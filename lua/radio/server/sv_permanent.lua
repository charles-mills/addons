--[[
    Radio Addon Server-Side Permanent Boombox Management
    Author: Charles Mills
    Description: This file handles the server-side functionality for managing permanent boomboxes.
                 It includes functions for saving, loading, and removing permanent boomboxes using
                 a SQLite database. The file also manages network communications for permanent
                 boombox actions and provides console commands for administrators to manage the
                 permanent boombox system.
    Date: October 30, 2024
]]--

-- Debug print function definition
local function DebugPrint(...)
    if GetConVar("radio_debug"):GetBool() then
        print("[rRadio Debug Permanent]", ...)
    end
end

-- Create the ConVar for boombox permanence
CreateConVar("boombox_permanent", "0", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Toggle boombox permanence")

local initialLoadComplete = false
local spawnedBoomboxesByPosition = {}
local spawnedBoomboxes = {}
local currentMap = game.GetMap()

-- Initialize the SQLite database
local function InitializeDatabase()
    if not sql.TableExists("permanent_boomboxes") then
        local query = [[
            CREATE TABLE permanent_boomboxes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                map TEXT NOT NULL,
                permanent_id TEXT,
                model TEXT NOT NULL,
                pos_x REAL NOT NULL,
                pos_y REAL NOT NULL,
                pos_z REAL NOT NULL,
                angle_pitch REAL NOT NULL,
                angle_yaw REAL NOT NULL,
                angle_roll REAL NOT NULL,
                station_name TEXT,
                station_url TEXT,
                volume REAL NOT NULL,
                UNIQUE(map, permanent_id)
            );
        ]]
        
        local result = sql.Query(query)
    else
        -- Check if the 'map' column exists
        local columnCheckQuery = "PRAGMA table_info(permanent_boomboxes);"
        local columns = sql.Query(columnCheckQuery)
        local mapColumnExists = false
        
        for _, column in ipairs(columns) do
            if column.name == "map" then
                mapColumnExists = true
                break
            end
        end
        
        -- If 'map' column doesn't exist, add it
        if not mapColumnExists then
            local alterTableQuery = "ALTER TABLE permanent_boomboxes ADD COLUMN map TEXT NOT NULL DEFAULT '';"
            local result = sql.Query(alterTableQuery)
        end
    end
end

-- Call the initialization function
InitializeDatabase()

-- Function to sanitize inputs to prevent SQL injection
local function sanitize(str)
    return string.gsub(str, "'", "''")
end

-- Function to generate a unique permanent ID
local function GeneratePermanentID()
    return os.time() .. "_" .. math.random(1000, 9999)
end

-- Function to add or update a permanent boombox in the database
local function SavePermanentBoombox(ent)
    if not IsValid(ent) then 
        DebugPrint("Invalid entity passed to SavePermanentBoombox")
        return 
    end

    -- Check if the table exists
    if not sql.TableExists("permanent_boomboxes") then
        InitializeDatabase()  -- Try to create the table
        if not sql.TableExists("permanent_boomboxes") then
            DebugPrint("Failed to create/find permanent_boomboxes table")
            return
        end
    end

    local model = sanitize(ent:GetModel())
    local pos = ent:GetPos()
    local ang = ent:GetAngles()
    
    -- Get the current station info from ActiveRadios if available
    local entIndex = ent:EntIndex()
    local stationName = ""
    local stationURL = ""
    local volume = ent:GetNWFloat("Volume", 1.0)

    -- Changed order: Check ActiveRadios first as it should have the most recent info
    if ActiveRadios and ActiveRadios[entIndex] then
        stationName = sanitize(ActiveRadios[entIndex].stationName or "")
        stationURL = sanitize(ActiveRadios[entIndex].url or "")
        DebugPrint("Got station info from ActiveRadios:", 
            "\nName:", stationName,
            "\nURL:", stationURL)
        
        -- If we got valid info from ActiveRadios, don't check other sources
        if stationName ~= "" and stationURL ~= "" then
            goto continue_save
        end
    end

    -- Fallback to networked values next
    if stationName == "" or stationURL == "" then
        stationName = sanitize(ent:GetNWString("StationName", ""))
        stationURL = sanitize(ent:GetNWString("StationURL", ""))
        DebugPrint("Got station info from networked vars:", 
            "\nName:", stationName,
            "\nURL:", stationURL)
        
        -- If we got valid info from networked vars, don't check BoomboxStatuses
        if stationName ~= "" and stationURL ~= "" then
            goto continue_save
        end
    end

    -- Last resort: check BoomboxStatuses
    if (stationURL == "" or stationName == "") and BoomboxStatuses and BoomboxStatuses[entIndex] then
        if stationName == "" then
            stationName = sanitize(BoomboxStatuses[entIndex].stationName or "")
        end
        if stationURL == "" then
            stationURL = sanitize(BoomboxStatuses[entIndex].url or "")
        end
        DebugPrint("Got station info from BoomboxStatuses:", 
            "\nName:", stationName,
            "\nURL:", stationURL)
    end

    ::continue_save::

    DebugPrint("Final station info for save:",
        "\nName:", stationName,
        "\nURL:", stationURL,
        "\nVolume:", volume,
        "\nSource: ActiveRadios")

    local permanentID = ent:GetNWString("PermanentID", "")
    if permanentID == "" then
        permanentID = GeneratePermanentID()
        ent:SetNWString("PermanentID", permanentID)
        DebugPrint("Generated new permanent ID:", permanentID)
    end

    -- Check if the boombox already exists for this map
    local query = string.format([[
        SELECT id FROM permanent_boomboxes
        WHERE map = %s AND permanent_id = %s
        LIMIT 1;
    ]], sql.SQLStr(currentMap), sql.SQLStr(permanentID))

    local result = sql.Query(query)
    if result == false then
        return
    end

    if result and #result > 0 then
        -- Update existing entry
        local id = result[1].id
        local updateQuery = string.format([[
            UPDATE permanent_boomboxes
            SET model = %s, pos_x = %f, pos_y = %f, pos_z = %f,
                angle_pitch = %f, angle_yaw = %f, angle_roll = %f,
                station_name = %s, station_url = %s, volume = %f
            WHERE id = %d;
        ]],
            sql.SQLStr(model), pos.x, pos.y, pos.z, ang.p, ang.y, ang.r,
            sql.SQLStr(stationName), sql.SQLStr(stationURL), volume, tonumber(id)
        )
        result = sql.Query(updateQuery)
    else
        -- Insert new entry
        local insertQuery = string.format([[
            INSERT INTO permanent_boomboxes (map, permanent_id, model, pos_x, pos_y, pos_z, angle_pitch, angle_yaw, angle_roll, station_name, station_url, volume)
            VALUES (%s, %s, %s, %f, %f, %f, %f, %f, %f, %s, %s, %f);
        ]],
            sql.SQLStr(currentMap), sql.SQLStr(permanentID), sql.SQLStr(model), pos.x, pos.y, pos.z, ang.p, ang.y, ang.r,
            sql.SQLStr(stationName), sql.SQLStr(stationURL), volume
        )
        result = sql.Query(insertQuery)
    end

    -- After saving, verify the entry
    local verifyQuery = string.format("SELECT * FROM permanent_boomboxes WHERE permanent_id = %s", sql.SQLStr(permanentID))
    local verifyResult = sql.Query(verifyQuery)
end

-- Function to remove a permanent boombox from the database
local function RemovePermanentBoombox(ent)
    if not IsValid(ent) then 
        return 
    end
    
    local permanentID = ent:GetNWString("PermanentID", "")
    if permanentID == "" then 
        return 
    end

    local deleteQuery = string.format([[
        DELETE FROM permanent_boomboxes
        WHERE map = '%s' AND permanent_id = '%s';
    ]], currentMap, permanentID)

    local success = sql.Query(deleteQuery)
end

-- Function to load and spawn all permanent boomboxes from the database
local function LoadPermanentBoomboxes(isReload)    
    DebugPrint("Loading permanent boomboxes", "isReload:", isReload)

    -- Clear the tracking tables
    table.Empty(spawnedBoomboxes)
    table.Empty(spawnedBoomboxesByPosition)

    -- Remove existing permanent boomboxes
    for _, ent in ipairs(ents.FindByClass("boombox")) do
        if ent.IsPermanent then
            ent:Remove()
        end
    end

    if not sql.TableExists("permanent_boomboxes") then
        DebugPrint("No permanent_boomboxes table found")
        return
    end

    local loadQuery = string.format("SELECT * FROM permanent_boomboxes WHERE map = '%s';", currentMap)
    local result = sql.Query(loadQuery)
    
    if not result then
        DebugPrint("No permanent boomboxes found for map:", currentMap)
        return
    end
    
    DebugPrint("Found", #result, "permanent boomboxes to load")
    
    for i, row in ipairs(result) do
        DebugPrint("Loading boombox", i, 
            "\nID:", row.permanent_id,
            "\nStation:", row.station_name,
            "\nURL:", row.station_url)

        -- Check if this boombox has already been spawned by ID
        if spawnedBoomboxes[row.permanent_id] then
            DebugPrint("Skipping already spawned boombox:", row.permanent_id)
            continue
        end

        -- Check if a boombox already exists at this position
        local posKey = string.format("%.2f,%.2f,%.2f", row.pos_x, row.pos_y, row.pos_z)
        if spawnedBoomboxesByPosition[posKey] then
            DebugPrint("Skipping boombox at existing position:", posKey)
            continue
        end

        local ent = ents.Create("boombox")
        if not IsValid(ent) then
            DebugPrint("Failed to create boombox entity")
            continue
        end

        ent:SetModel(row.model)
        ent:SetPos(Vector(row.pos_x, row.pos_y, row.pos_z))
        ent:SetAngles(Angle(row.angle_pitch, row.angle_yaw, row.angle_roll))
        ent:Spawn()
        ent:Activate()

        -- Set networked variables
        ent:SetNWString("PermanentID", row.permanent_id)
        ent:SetNWString("StationName", row.station_name)
        ent:SetNWString("StationURL", row.station_url)
        ent:SetNWFloat("Volume", row.volume)

        -- Mark as permanent
        ent.IsPermanent = true
        ent:SetNWBool("IsPermanent", true)

        DebugPrint("Created permanent boombox", 
            "\nEntity:", ent,
            "\nStation:", row.station_name,
            "\nURL:", row.station_url)

        -- Start playing the radio
        if row.station_url ~= "" then
            DebugPrint("Starting radio playback for permanent boombox")
            
            -- Set networked variables first
            ent:SetNWString("StationName", row.station_name)
            ent:SetNWString("StationURL", row.station_url)
            ent:SetNWString("Status", "playing")
            ent:SetNWBool("IsPlaying", true)
            
            -- Update BoomboxStatuses
            local entIndex = ent:EntIndex()
            BoomboxStatuses[entIndex] = {
                stationStatus = "playing",
                stationName = row.station_name,
                url = row.station_url
            }
            
            -- Broadcast status update to clients
            net.Start("UpdateRadioStatus")
                net.WriteEntity(ent)
                net.WriteString(row.station_name)
                net.WriteBool(true)
                net.WriteString("playing")
            net.Broadcast()
            
            DebugPrint("Broadcasted radio status update")
            
            -- Tell clients to start playback using QueueStream
            -- This will trigger the client-side StreamManager
            net.Start("QueueStream")
                net.WriteEntity(ent)
                net.WriteString(row.station_name)
                net.WriteString(row.station_url)
                net.WriteFloat(row.volume)
            net.Broadcast()
            
            DebugPrint("Broadcasted QueueStream")

            -- Update server-side tracking
            if AddActiveRadio then
                AddActiveRadio(ent, row.station_name, row.station_url, row.volume)
                DebugPrint("Added to active radios")
            else
                DebugPrint("Warning: AddActiveRadio function not available")
            end
        end

        -- Mark this boombox as spawned
        spawnedBoomboxes[row.permanent_id] = true
        spawnedBoomboxesByPosition[posKey] = true
    end
end

hook.Remove("InitPostEntity", "LoadPermanentBoomboxes")
hook.Remove("PostCleanupMap", "ReloadPermanentBoomboxes")

hook.Add("PostCleanupMap", "LoadPermanentBoomboxes", function()
    timer.Simple(5, function()
        if not initialLoadComplete then
            LoadPermanentBoomboxes()
            initialLoadComplete = true
        else
            LoadPermanentBoomboxes()
        end
    end)
end)

-- Network Receiver: MakeBoomboxPermanent
net.Receive("MakeBoomboxPermanent", function(len, ply)
    if not IsValid(ply) or not ply:IsSuperAdmin() then
        ply:ChatPrint("You do not have permission to perform this action.")
        return
    end

    local ent = net.ReadEntity()
    if not IsValid(ent) or (ent:GetClass() ~= "boombox" and ent:GetClass() ~= "golden_boombox") then
        ply:ChatPrint("Invalid boombox entity.")
        return
    end

    -- Check if already permanent
    if ent.IsPermanent then
        ply:ChatPrint("This boombox is already marked as permanent.")
        return
    end

    -- Mark as permanent
    ent.IsPermanent = true
    ent:SetNWBool("IsPermanent", true)

    -- Save to database
    SavePermanentBoombox(ent)

    -- Send confirmation to client
    net.Start("BoomboxPermanentConfirmation")
        net.WriteString("Boombox has been marked as permanent.")
    net.Send(ply)
end)

-- Network Receiver: RemoveBoomboxPermanent
net.Receive("RemoveBoomboxPermanent", function(len, ply)
    if not IsValid(ply) or not ply:IsSuperAdmin() then
        ply:ChatPrint("You do not have permission to perform this action.")
        return
    end

    local ent = net.ReadEntity()
    if not IsValid(ent) or (ent:GetClass() ~= "boombox" and ent:GetClass() ~= "golden_boombox") then
        ply:ChatPrint("Invalid boombox entity.")
        return
    end

    -- Check if it's marked as permanent
    if not ent.IsPermanent then
        ply:ChatPrint("This boombox is not marked as permanent.")
        return
    end

    -- Remove permanence
    ent.IsPermanent = false
    ent:SetNWBool("IsPermanent", false)

    -- Remove from database
    RemovePermanentBoombox(ent)

    -- Stop the radio if desired
    if ent.StopRadio then
        ent:StopRadio()
    end

    -- Send confirmation to client
    net.Start("BoomboxPermanentConfirmation")
        net.WriteString("Boombox permanence has been removed.")
    net.Send(ply)
end)

-- Make functions globally accessible
_G.SavePermanentBoombox = SavePermanentBoombox
_G.RemovePermanentBoombox = RemovePermanentBoombox

local AddActiveRadio = _G.AddActiveRadio

-- ConCommand to clear the permanent boombox database
concommand.Add("rradio_clear_permanent_db", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsSuperAdmin() then
        ply:ChatPrint("You must be a superadmin to use this command.")
        return
    end

    -- Clear all boomboxes from the database
    local clearQuery = "DELETE FROM permanent_boomboxes;"
    sql.Query(clearQuery)
    
    if IsValid(ply) then
        ply:ChatPrint("Permanent boombox database has been cleared for all maps.")
    end
end)

-- Update the concommand to use the isReload parameter
concommand.Add("rradio_reload_permanent_boomboxes", function(ply, cmd, args)
    if IsValid(ply) and not ply:IsSuperAdmin() then
        ply:ChatPrint("You must be a superadmin to use this command.")
        return
    end

    -- Remove existing permanent boomboxes
    for _, ent in ipairs(ents.FindByClass("boombox")) do
        if ent.IsPermanent then
            ent:Remove()
        end
    end

    -- Reload permanent boomboxes
    LoadPermanentBoomboxes(true)
    
    if IsValid(ply) then
        ply:ChatPrint("Permanent boomboxes have been reloaded.")
    end
end)

_G.LoadPermanentBoomboxes = function()
    LoadPermanentBoomboxes(false)
end

hook.Add("Initialize", "UpdateCurrentMapForPermanentBoomboxes", function()
    currentMap = game.GetMap()
end)

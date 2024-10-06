--[[ 
    rRadio Addon for Garry's Mod - Utility Functions
    Description: Provides utility functions for the rRadio addon.
    Author: Charles Mills (https://github.com/charles-mills)
    Date: 2024-10-03
]]

utils = utils or {}
utils.DEBUG_MODE = true
utils.VERBOSE_ERRORS = true

--[[
    Function: isSitAnywhereSeat
    Description: Checks if a vehicle is a "sit anywhere" seat.
    @param vehicle (Entity): The vehicle to check.
    @return (boolean): True if it's a sit anywhere seat, false otherwise.
]]
function utils.isSitAnywhereSeat(vehicle)
    utils.DebugPrint("Checking if vehicle " .. vehicle:EntIndex() .. " is a sit anywhere seat")
    if not IsValid(vehicle) then return false end
    utils.DebugPrint("Vehicle " .. vehicle:EntIndex() .. " is a sit anywhere seat: " .. tostring(vehicle:GetNWBool("IsSitAnywhereSeat", false)))
    return vehicle:GetNWBool("IsSitAnywhereSeat", false)
end

--[[
    Function: isBoombox
    Description: Checks if an entity is a boombox.
    @param ent (Entity): The entity to check.
    @return (boolean): True if it's a boombox, false otherwise.
]]
function utils.isBoombox(ent)
    entity = ent or nil
    if not IsValid(entity) then return false end
    return entity:GetClass() == "boombox" or entity:GetClass() == "golden_boombox"
end

-- Debug function to print messages if debug_mode is enabled
function utils.DebugPrint(msg)
    if utils.DEBUG_MODE then
        print("[rRadio Debug] " .. msg)
    end
end

-- Function to print errors if verbose_errors is enabled
function utils.PrintError(msg, severity)
    severity = severity or 3
    if utils.VERBOSE_ERRORS then
        print("[rRadio Error] [" .. (severity or "0") .. "] " .. msg)
    end
end

-- Add this new function to the existing utils.lua file

--[[ 
    Function: formatCountryNameForComparison
    Description: Formats a country name for consistent comparison.
    @param name (string): The country name to format.
    @return (string): The formatted country name.
]]
function utils.formatCountryNameForComparison(name)
    -- Convert to lowercase
    name = string.lower(name)
    -- Replace spaces and hyphens with underscores
    name = string.gsub(name, "[ -]", "_")
    -- Remove any non-alphanumeric characters (except underscores)
    name = string.gsub(name, "[^a-z0-9_]", "")
    -- Capitalize the first letter
    name = string.upper(string.sub(name, 1, 1)) .. string.sub(name, 2)
    return name
end

function utils.formatCountryNameForDisplay(name)
    -- Remove underscores
    name = string.gsub(name, "_", " ")
    -- Apply title case
    name = string.gsub(name, "(%a)([%w']*)", function(first, rest)
        return string.upper(first) .. string.lower(rest)
    end)
    return name
end

-- Utility function for localization with fallback
function utils.L(key, ...)
    if not Config or not Config.Lang then
        return key
    end
    local str = Config.Lang[key] or key
    if select("#", ...) > 0 then
        return string.format(str, ...)
    end
    return str
end

-- Add these functions to the existing utils.lua file

function utils.IsPlayerAuthorized(ply, entity)
    if not IsValid(ply) or not IsValid(entity) then return false end
    
    if ply:IsAdmin() or ply:IsSuperAdmin() then return true end
    
    local owner = entity.CPPIGetOwner and entity:CPPIGetOwner() or entity:GetNWEntity("Owner")
    
    return ply == owner or utils.isAuthorizedFriend(owner, ply)
end

function utils.HandleRadioPlay(entity, stationName, url, volume, country)
    entity:SetNWString("CurrentRadioStation", stationName)
    entity:SetNWString("StationURL", url)
    entity:SetNWFloat("Volume", volume)
    entity:SetNWString("Country", country)
    entity:SetNWBool("IsRadioSource", true)

    net.Start("rRadio_PlayRadioStation")
    net.WriteEntity(entity)
    net.WriteString(url)
    net.WriteFloat(volume)
    net.WriteString(country)
    net.Broadcast()

    return {
        entity = entity,
        stationName = stationName,
        url = url,
        volume = volume
    }
end

function utils.UpdateSitAnywhereSeatStatus(vehicle)
    if IsValid(vehicle) then
        local isSitAnywhere = vehicle.playerdynseat or false
        vehicle:SetNWBool("IsSitAnywhereSeat", isSitAnywhere)
        net.Start("rRadio_UpdateSitAnywhereSeat")
        net.WriteEntity(vehicle)
        net.WriteBool(isSitAnywhere)
        net.Broadcast()
    end
end

-- Add these hooks in utils.lua
hook.Add("PlayerEnteredVehicle", "MarkSitAnywhereSeat", function(ply, vehicle)
    timer.Simple(0.1, function()
        if IsValid(vehicle) then
            utils.UpdateSitAnywhereSeatStatus(vehicle)
        end
    end)
end)

hook.Add("PlayerLeaveVehicle", "UnmarkSitAnywhereSeat", function(ply, vehicle)
    if IsValid(vehicle) then
        utils.UpdateSitAnywhereSeatStatus(vehicle)
    end
end)

hook.Add("OnEntityCreated", "UpdateSitAnywhereSeatOnSpawn", function(ent)
    if IsValid(ent) and ent:IsVehicle() then
        timer.Simple(0.1, function()
            if IsValid(ent) then
                utils.UpdateSitAnywhereSeatStatus(ent)
            end
        end)
    end
end)

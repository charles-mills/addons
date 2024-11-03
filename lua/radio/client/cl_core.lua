--[[
    Radio Addon Client-Side Core Functionality
    Author: Charles Mills
    Description: This file implements the main client-side features of the Radio Addon.
                 It includes the user interface for the radio menu, handles playback of
                 radio stations, manages favorites, and processes network messages from
                 the server.
    Date: October 31, 2024
]]--

-- ------------------------------
--          Imports
-- ------------------------------
include("radio/shared/sh_config.lua")
local StreamManager = include("radio/client/cl_stream_manager.lua")
local StateManager = include("radio/client/cl_state_manager.lua")
local themeModule = include("radio/client/cl_theme_manager.lua")
local utils = include("radio/shared/sh_utils.lua")
local Misc = include("radio/client/cl_misc.lua")
local Debug = include("radio/shared/sh_debug.lua")
local Events = include("radio/shared/sh_events.lua")

if not StreamManager then
    error("[rRadio] Failed to load StreamManager")
end

if not StateManager then
    error("[rRadio] Failed to load StateManager")
end

-- Initialize managers
StateManager:Initialize()

local function getSafeState(key, default)
    return StateManager:GetState(key) or default
end

local function setSafeState(key, value)
    StateManager:SetState(key, value)
end

local favoriteCountries = getSafeState("favoriteCountries", {})
local favoriteStations = getSafeState("favoriteStations", {})
local entityVolumes = getSafeState("entityVolumes", {})
local lastKeyPress = getSafeState("lastKeyPress", 0)

local currentFrame = nil
local settingsMenuOpen = false
local openRadioMenu

local lastIconUpdate = 0
local iconUpdateDelay = 0.1
local pendingIconUpdate = nil
local isUpdatingIcon = false
local isMessageAnimating = false

local favoritesMenuOpen = false

local MaterialCache = {
    cache = {},
    paths = {
        "hud/vol_mute.png",
        "hud/vol_down.png",
        "hud/vol_up.png",
        "hud/radio.png",
        "hud/close.png",
        "hud/settings.png",
        "hud/return.png",
        "hud/star.png",
        "hud/star_full.png",
        "hud/github.png"
    },
    
    Get = function(self, path)
        self.cache[path] = self.cache[path] or Material(path, "smooth")
        return self.cache[path]
    end,
}
local VOLUME_ICONS = {
    MUTE = MaterialCache:Get("hud/vol_mute.png"),
    LOW = MaterialCache:Get("hud/vol_down.png"),
    HIGH = MaterialCache:Get("hud/vol_up.png")
}

local unauthorizedUIOpen = false
local isBoomboxMuted = {}

local lastPermissionMessage = 0
local PERMISSION_MESSAGE_COOLDOWN = 3

local MAX_CLIENT_STATIONS = 10
local streamsEnabled = true

local lastStreamUpdate = 0
local STREAM_UPDATE_INTERVAL = 0.1

local isLoadingStations = false
local STATION_CHUNK_SIZE = 100
local loadingProgress = 0

local UIReferenceTracker = {
    references = {},
    validityCache = {},
    lastCheck = 0,
    CHECK_INTERVAL = 0.5,
    
    Track = function(self, element, id)
        self.references[id] = element
        self.validityCache[id] = true
    end,
    
    Untrack = function(self, id)
        self.references[id] = nil
        self.validityCache[id] = nil
    end,
    
    IsValid = function(self, id)
        return self.validityCache[id] == true
    end,
    
    Update = function(self)
        local currentTime = CurTime()
        if (currentTime - self.lastCheck) < self.CHECK_INTERVAL then
            return
        end
        
        self.lastCheck = currentTime
        
        for id, element in pairs(self.references) do
            self.validityCache[id] = IsValid(element)
            if not self.validityCache[id] then
                self.references[id] = nil
            end
        end
    end
}

hook.Add("OnPlayerChat", "RadioStreamToggleCommands", function(ply, text, teamChat, isDead)
    if ply ~= LocalPlayer() then return end
    
    text = string.lower(text)
    
    if text == "!disablestreams" then
        if not streamsEnabled then
            chat.AddText(Color(255, 0, 0), "[Radio] Streams are already disabled.")
            return true
        end
        
        -- Stop all current streams
        for entity, source in pairs(currentRadioSources) do
            if IsValid(source) then
                source:Stop()
            end
        end
        
        -- Clear states
        currentRadioSources = {}
        StreamManager._streams = {}
        
        streamsEnabled = false
        chat.AddText(Color(0, 255, 0), "[Radio] All radio streams have been disabled for this session.")
        return true
    end
    
    if text == "!enablestreams" then
        if streamsEnabled then
            chat.AddText(Color(255, 0, 0), "[Radio] Streams are already enabled.")
            return true
        end
        
        streamsEnabled = true
        chat.AddText(Color(0, 255, 0), "[Radio] Radio streams have been re-enabled.")
        return true
    end
end)

local function transitionContent(panel, direction, onComplete)
    if not IsValid(panel) then return end
    
    -- Store panel reference
    local panelRef = panel
    
    -- Use the Transitions module for sliding with safety check
    Misc.Transitions:SlideElement(panel, 0.3, direction, function()
        if IsValid(panelRef) and onComplete then
            onComplete()
        end
    end)
    
    -- Handle fade effect with safety check
    Misc.Transitions:FadeElement(panel, direction, 0.2, function()
        if not IsValid(panelRef) then return false end
    end)
end


-- ------------------------------
--      Station Data Loading
-- ------------------------------

--[[
    Function: truncateStationName
    Truncates a station name to a maximum length and adds ellipsis if needed.
    This is for display purposes and data storage.

    Parameters:
    - name: The station name to truncate
    - maxLength: (optional) Maximum length before truncation, defaults to 15

    Returns:
    - The truncated name with ellipsis if needed
]]
local function truncateStationName(name, maxLength)
    maxLength = maxLength or 15
    if string.len(name) <= maxLength then
        return name
    end
    return string.sub(name, 1, maxLength) .. "..."
end

--[[
    Function: LoadStationData
    Loads station data from files asynchronously to prevent UI freezing.
    Uses chunked loading with progress tracking.
]]
local function LoadStationData()
    if stationDataLoaded or isLoadingStations then return end
    
    StationData = {}
    isLoadingStations = true
    loadingProgress = 0
    
    -- Get all data files first
    local dataFiles = file.Find("radio/client/stations/data_*.lua", "LUA")
    local totalFiles = #dataFiles
    local currentFileIndex = 1
    local currentStationIndex = 1
    local currentCountry = nil
    local currentStations = nil
    
    -- Create temporary storage for file data
    local fileData = {}
    
    -- Process files in chunks
    timer.Create("LoadStationDataChunks", 0.05, 0, function()
        -- Process current chunk
        local startTime = SysTime()
        
        while (SysTime() - startTime) < 0.016 and currentFileIndex <= totalFiles do
            local filename = dataFiles[currentFileIndex]
            
            -- Load file data if not already loaded
            if not fileData[filename] then
                local success, data = pcall(include, "radio/client/stations/" .. filename)
                if success and data then
                    fileData[filename] = data
                else
                    print("[rRadio] Error loading station data from: " .. filename)
                    fileData[filename] = {}
                end
            end
            
            -- Process stations from current file
            local data = fileData[filename]
            for country, stations in pairs(data) do
                -- Extract base country name
                local baseCountry = country:gsub("_(%d+)$", "")
                if not StationData[baseCountry] then
                    StationData[baseCountry] = {}
                end
                
                -- Process stations in chunks
                for i = 1, #stations, STATION_CHUNK_SIZE do
                    local endIndex = math.min(i + STATION_CHUNK_SIZE - 1, #stations)
                    for j = i, endIndex do
                        local station = stations[j]
                        table.insert(StationData[baseCountry], {
                            name = station.n,
                            displayName = truncateStationName(station.n),
                            url = station.u
                        })
                    end
                    
                    -- Update progress
                    loadingProgress = (currentFileIndex / totalFiles) * 100
                    
                    -- Emit progress event
                    StateManager:Emit(StateManager.Events.STATION_LOAD_PROGRESS, {
                        progress = loadingProgress,
                        currentFile = filename,
                        totalFiles = totalFiles
                    })
                    
                    -- Break chunk processing if time exceeded
                    if (SysTime() - startTime) >= 0.016 then
                        return
                    end
                end
            end
            
            currentFileIndex = currentFileIndex + 1
        end
        
        -- Check if loading is complete
        if currentFileIndex > totalFiles then
            timer.Remove("LoadStationDataChunks")
            stationDataLoaded = true
            isLoadingStations = false
            loadingProgress = 100
            
            -- Update state
            StateManager:SetState("stationDataLoaded", true)
            StateManager:SetState("stationData", StationData)
            
            -- Emit completion event
            StateManager:Emit(StateManager.Events.STATION_LOAD_COMPLETE, {
                totalStations = table.Count(StationData)
            })
            
            -- Clear temporary storage
            fileData = nil
        end
    end)
end

-- Initialize station data
LoadStationData()

-- ------------------------------
--      Stream Management
-- ------------------------------

--[[
    Function: updateStationCount
    Updates and validates the count of active radio stations.
    Cleans up invalid entries and returns the current count.
    
    Returns:
    - number: The current number of active stations
]]
local function updateStationCount()
    local count = StateManager:UpdateStationCount()
    return count
end

-- ------------------------------
--      Utility Functions
-- ------------------------------

local function LerpColor(t, col1, col2)
    return Color(
        Lerp(t, col1.r, col2.r),
        Lerp(t, col1.g, col2.g),
        Lerp(t, col1.b, col2.b),
        Lerp(t, col1.a or 255, col2.a or 255)
    )
end

--[[
    Function: reopenRadioMenu
    Reopens the radio menu with optional settings flag.

    Parameters:
    - openSettingsMenuFlag: Boolean to determine if settings menu should be opened.
]]
local function reopenRadioMenu(openSettingsMenuFlag)
    if openRadioMenu then
        if IsValid(LocalPlayer()) and LocalPlayer().currentRadioEntity then
            timer.Simple(0.1, function()
                openRadioMenu(openSettingsMenuFlag)
            end)
        end
    else
        print("Error: openRadioMenu function not found")
    end
end

--[[
    Function: ClampVolume
    Clamps the volume to a maximum value (server-side convar).

    Parameters:
    - volume: The volume to clamp.

    Returns:
    - The clamped volume.
]]
local function ClampVolume(volume)
    local maxVolume = Config.MaxVolume()
    return math.Clamp(volume, 0, maxVolume)
end

--[[
    Function: loadFavorites
    Loads favorite countries and stations from JSON files.
    Includes error handling, data validation, and backup recovery.
]]
local function loadFavorites()
    -- Ensure StationData is loaded
    LoadStationData()
    
    -- Load favorites through StateManager
    StateManager:LoadFavorites()
    
    -- Update local references
    favoriteCountries = getFavoriteCountries()
    favoriteStations = getFavoriteStations()
end

--[[
    Function: saveFavorites
    Saves favorite countries and stations to JSON files.
    Includes error handling, validation, and backup system.
]]
local function saveFavorites()
    StateManager:SetState("favoriteCountries", favoriteCountries)
    StateManager:SetState("favoriteStations", favoriteStations)

    return StateManager:SaveFavorites()
end

-- ------------------------------
--          UI Setup
-- ------------------------------

local function createFonts()
    surface.CreateFont("Roboto18", {
        font = "Roboto",
        size = ScreenScale(5),
        weight = 500,
    })

    surface.CreateFont("HeaderFont", {
        font = "Roboto",
        size = ScreenScale(8),
        weight = 700,
    })
end

createFonts()

-- ------------------------------
--      State Variables
-- ------------------------------

local selectedCountry = nil
local currentlyPlayingStation = nil
local lastMessageTime = -math.huge
local lastStationSelectTime = 0
local currentlyPlayingStations = {}
local settingsMenuOpen = false
local formattedCountryNames = {}
local stationDataLoaded = false
local isSearching = false

local MuteManager = {
    mutedEntities = {},
    originalVolumes = {},
    
    IsMuted = function(self, entIndex)
        return self.mutedEntities[entIndex] == true
    end,
    
    MuteEntity = function(self, entIndex, entity)
        if not IsValid(entity) then return end
        
        -- Store original volume and update stream
        local streamData = StreamManager._streams[entIndex]
        if streamData then
            self.originalVolumes[entIndex] = streamData.data.volume
            StreamManager:UpdateStreamVolume(entIndex, 0)
        end
        
        self.mutedEntities[entIndex] = true
        
        -- Emit state change
        StateManager:Emit(StateManager.Events.BOOMBOX_MUTE_CHANGED, {
            entity = entity,
            muted = true
        })
    end,
    
    UnmuteEntity = function(self, entIndex, entity)
        if not IsValid(entity) then return end
        
        local originalVolume = self.originalVolumes[entIndex]
        if originalVolume then
            local streamData = StreamManager._streams[entIndex]
            if streamData then
                streamData.data.volume = originalVolume
                StreamManager:UpdateStreamVolume(entIndex)
            end
        end
        
        self.mutedEntities[entIndex] = nil
        self.originalVolumes[entIndex] = nil
        
        -- Restore volume
        local streamData = StreamManager._streams[entIndex]
        if streamData and IsValid(streamData.stream) then
            streamData.stream:SetVolume(originalVolume)
        end
        
        -- Emit state change event
        StateManager:Emit(StateManager.Events.BOOMBOX_MUTE_CHANGED, {
            entity = entity,
            muted = false
        })
    end,
    
    CleanupEntity = function(self, entIndex)
        self.mutedEntities[entIndex] = nil
        self.originalVolumes[entIndex] = nil
    end,
    
    -- Handle volume updates while maintaining mute state
    HandleVolumeUpdate = function(self, entity, newVolume)
        local entIndex = entity:EntIndex()
        
        if self:IsMuted(entIndex) then
            -- Update stored original volume but keep muted
            self.originalVolumes[entIndex] = newVolume
            return 0 -- Return 0 to maintain mute
        end
        
        return newVolume -- Return original volume if not muted
    end
}

-- ------------------------------
--      Helper Functions
-- ------------------------------

--[[
    Function: GetVehicleEntity
    Retrieves the vehicle entity from a given entity.

    Parameters:
    - entity: The entity to check.

    Returns:
    - The vehicle entity or the original entity if not a vehicle.
]]
local function GetVehicleEntity(entity)
    if IsValid(entity) and entity:IsVehicle() then
        local parent = entity:GetParent()
        return IsValid(parent) and parent or entity
    end
    return entity
end

--[[
    Function: Scale
    Scales a value based on the screen width.

    Parameters:
    - value: The value to scale.

    Returns:
    - The scaled value.
]]
local function Scale(value)
    return value * (ScrW() / 2560)
end

--[[
    Function: getEntityConfig
    Retrieves the configuration for a given entity.

    Parameters:
    - entity: The entity to get the config for.

    Returns:
    - The configuration table for the entity.
]]
local function getEntityConfig(entity)
    return utils.GetEntityConfig(entity)
end

--[[
    Function: formatCountryName
    Formats and translates a country name, with caching per language.

    Parameters:
    - name: The original country name.

    Returns:
    - The formatted and translated country name.
]]
local function formatCountryName(name)
    local lang = GetConVar("radio_language"):GetString() or "en"
    local cacheKey = name .. "_" .. lang

    if formattedCountryNames[cacheKey] then
        return formattedCountryNames[cacheKey]
    end

    local translatedName = Misc.Language:GetCountryTranslation(lang, name)

    formattedCountryNames[cacheKey] = translatedName
    return translatedName
end

--[[
    Function: playStation
    Plays a specified radio station on a given entity.

    Parameters:
    - entity: The entity on which to play the station.
    - station: The station data containing name and URL.
    - volume: The volume level for playback.

    Returns:
    - None: This function does not return a value, but it updates the state and sends network messages.
]]

local function playStation(entity, station, volume)
    if not IsValid(entity) then return end
    if not station or not station.name or not station.url then 
        print("[rRadio] Invalid station data")
        return 
    end

    -- Validate volume range
    volume = math.Clamp(volume, 0, Config.MaxVolume())

    -- Update local state immediately
    local entIndex = entity:EntIndex()
    if not BoomboxStatuses[entIndex] then
        BoomboxStatuses[entIndex] = {}
    end
    BoomboxStatuses[entIndex] = {
        stationStatus = "playing",
        stationName = station.name,
        url = station.url
    }

    -- Create stream through StreamManager
    local success = StreamManager:CreateStream(entity, {
        name = station.name,
        url = station.url,
        volume = volume,
        minDist = utils.GetEntityConfig(entity).MinVolumeDistance(),
        maxDist = utils.GetEntityConfig(entity).MaxHearingDistance()
    })

    if success then
        -- Update server state
        net.Start("PlayCarRadioStation")
            net.WriteEntity(entity)
            net.WriteString(utils.truncateStationName(station.name))
            net.WriteString(station.url)
            net.WriteFloat(volume)
        net.SendToServer()

        -- Update state
        StateManager:SetState("currentlyPlayingStations", {
            [entity] = station
        })
        StateManager:SetState("lastStationSelectTime", CurTime())
    else
        utils.playErrorSound("connection")
        utils.clearRadioStatus(entity)
    end
end


--[[
    Function: updateRadioVolume
    Updates the volume of the radio station based on distance and whether the player is in the car.
]]
local function updateRadioVolume(station, distanceSqr, isPlayerInCar, entity)
    local entityConfig = getEntityConfig(entity)
    if not entityConfig then 
        print("[rRadio] Warning: No entity config found for", entity)
        return 
    end

    -- Early distance check
    local maxDist = entityConfig.MaxHearingDistance()
    if distanceSqr > (maxDist * maxDist) then
        station:SetVolume(0)
        return
    end

    -- Get the user-set volume
    local userVolume = ClampVolume(entity:GetNWFloat("Volume", entityConfig.Volume()))

    if userVolume <= 0.02 then
        station:SetVolume(0)
        return
    end

    -- Check mute state before proceeding
    local entIndex = entity:EntIndex()
    if MuteManager:IsMuted(entIndex) then
        station:SetVolume(0)
        return
    end

    -- If player is in the vehicle, use full user-set volume and disable 3D
    if isPlayerInCar then
        station:Set3DEnabled(false)
        station:SetVolume(userVolume)
        return
    end

    station:Set3DEnabled(true)
    local minDist = entityConfig.MinVolumeDistance()
    
    -- innerAngle of 180 means full volume in front hemisphere
    -- outerAngle of 360 means sound can be heard from all directions
    -- outerVolume of 0.8 means only 20% volume reduction when behind the source
    station:Set3DCone(180, 360, 0.8)
    
    station:Set3DFadeDistance(minDist, maxDist)
    station:SetPlaybackRate(1.0)
    
    local finalVolume = userVolume
    if distanceSqr > minDist * minDist then
        local dist = math.sqrt(distanceSqr)
        local falloff = 1 - math.pow((dist - minDist) / (maxDist - minDist), 0.75)
        finalVolume = userVolume * math.Clamp(falloff, 0, 1)
    end

    station:SetVolume(finalVolume)

    -- Update stream activity timestamp
    local streamData = StreamManager._streams[entity:EntIndex()]
    if streamData then
        streamData.lastActivity = CurTime()
    end
end

local function cleanupMessage()
    if messageCleanupTimer then
        timer.Remove(messageCleanupTimer)
        messageCleanupTimer = nil
    end
    
    if IsValid(messagePanel) then
        messagePanel:Remove()
    end
    messagePanel = nil
    isMessageAnimating = false
end

local function createMessageAnimation(panel, startPos, endPos, duration, onComplete)
    return Misc.Animations:CreateTween(
        duration,
        startPos,
        endPos,
        function(value)
            return IsValid(panel) and panel:SetPos(value, panel:GetY())
        end,
        onComplete,
        nil,
        panel
    )
end

local function playCarEnterAnim()
    if not GetConVar("car_radio_show_messages"):GetBool() then return end

    cleanupMessage()
    
    local currentTime = CurTime()
    if currentTime - (lastMessageTime or 0) < Config.MessageCooldown() then return end

    if isMessageAnimating then return end

    lastMessageTime = currentTime
    isMessageAnimating = true

    local openKey = GetConVar("car_radio_open_key"):GetInt()
    local keyName = Misc.KeyNames:GetKeyName(openKey) or "Unknown"

    local scrW, scrH = ScrW(), ScrH()
    local panelWidth = Scale(300)
    local panelHeight = Scale(70)

    local panel = vgui.Create("DPanel")
    messagePanel = panel

    panel:SetSize(panelWidth, panelHeight)
    panel:SetPos(scrW, scrH * 0.2)
    panel:SetAlpha(0)
    panel:MoveToFront()
    panel:SetZPos(32767)
    panel:ParentToHUD()
    panel:SetPaintedManually(false)
    panel:SetVisible(true)
    panel:SetEnabled(true)

    panel.SetVisible = function(self, state)
        if not state then return end
        self.BaseClass.SetVisible(self, true)
    end

    UIReferenceTracker:Track(panel, "message_panel")

    panel.Paint = function(self, w, h)
        if not IsValid(self) then return end

        draw.RoundedBoxEx(12, 0, 0, w, h, Config.UI.MessageBackgroundColor, true, false, true, false)

        local keyWidth = Scale(40)
        local keyHeight = Scale(30)
        local keyX = Scale(20)
        local keyY = h/2 - keyHeight/2
        
        local pulse = 1 + math.sin(CurTime() * 3) * 0.05
        local adjustedWidth = keyWidth * pulse
        local adjustedHeight = keyHeight * pulse
        local adjustedX = keyX - (adjustedWidth - keyWidth) / 2
        local adjustedY = keyY - (adjustedHeight - keyHeight) / 2

        draw.RoundedBox(6, adjustedX, adjustedY, adjustedWidth, adjustedHeight, 
            Config.UI.KeyHighlightColor)

        draw.SimpleText(keyName, "Roboto18", 
            adjustedX + adjustedWidth/2, 
            adjustedY + adjustedHeight/2, 
            Config.UI.TextColor, 
            TEXT_ALIGN_CENTER, 
            TEXT_ALIGN_CENTER)

        draw.SimpleText(Config.Lang["OpenRadio"] or "Open Radio", "Roboto18",
            Scale(70), h/2, Config.UI.TextColor, 
            TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        surface.SetDrawColor(ColorAlpha(Config.UI.TextColor, 40))
        surface.DrawLine(
            Scale(70) - Scale(5), h * 0.3,
            Scale(70) - Scale(5), h * 0.7
        )
    end

    local startX = scrW
    local endX = scrW - panelWidth
    
    if not IsValid(panel) then return end

    local startTime = CurTime()
    local duration = 0.5
    local startAlpha = 0
    local endAlpha = 255

    panel.Think = function(self)
        if not self:IsValid() then cleanupMessage() return end
        
        local currentTime = CurTime()
        local delta = math.Clamp((currentTime - startTime) / duration, 0, 1)

        local newX = Lerp(delta, startX, endX)
        local newAlpha = Lerp(delta, startAlpha, endAlpha)
        
        self:SetPos(newX, self:GetY())
        self:SetAlpha(newAlpha)
        
        if delta >= 1 then
            timer.Create("HideRadioMessage", 3, 1, function()
                if not IsValid(self) then return end
                
                local hideStartTime = CurTime()
                local hideStartX = self:GetX()
                
                self.Think = function()
                    if not IsValid(self) then return end
                    
                    local hideDelta = math.Clamp((CurTime() - hideStartTime) / duration, 0, 1)
                    
                    local hideX = Lerp(hideDelta, hideStartX, scrW)
                    local hideAlpha = Lerp(hideDelta, endAlpha, 0)
                    
                    self:SetPos(hideX, self:GetY())
                    self:SetAlpha(hideAlpha)
                    
                    if hideDelta >= 1 then
                        self:Remove()
                        isMessageAnimating = false
                    end
                end
            end)

            self.Think = nil
        end
    end

    panel:SetPos(startX, panel:GetY())
    panel:SetAlpha(startAlpha)
end

-- ------------------------------
--      UI Helper Functions
-- ------------------------------

--[[
    Function: calculateFontSizeForStopButton
    Dynamically calculates the font size for the stop button text.

    Parameters:
    - text: The text to display.
    - buttonWidth: The width of the button.
    - buttonHeight: The height of the button.

    Returns:
    - The name of the font to use.
]]
local function calculateFontSizeForStopButton(text, buttonWidth, buttonHeight)
    local maxFontSize = buttonHeight * 0.7
    local fontName = "DynamicStopButtonFont"

    surface.CreateFont(fontName, {
        font = "Roboto",
        size = maxFontSize,
        weight = 700,
    })

    surface.SetFont(fontName)
    local textWidth = surface.GetTextSize(text)

    while textWidth > buttonWidth * 0.9 and maxFontSize > 10 do
        maxFontSize = maxFontSize - 1
        surface.CreateFont(fontName, {
            font = "Roboto",
            size = maxFontSize,
            weight = 700,
        })
        surface.SetFont(fontName)
        textWidth = surface.GetTextSize(text)
    end

    return fontName
end

--[[
    Function: createStarIcon
    Creates a star icon for favorites (both countries and stations).

    Parameters:
    - parent: The parent UI element.
    - country: The country code.
    - station: (Optional) The station data. If nil, treats as country favorite.
    - updateList: The function to update the list.

    Returns:
    - The created star icon UI element.
]]
local function createStarIcon(parent, country, station, updateList)
    local starIcon = vgui.Create("DImageButton", parent)
    starIcon:SetSize(Scale(24), Scale(24))
    starIcon:SetPos(Scale(12), (Scale(40) - Scale(24)) / 2)

    local isFavorite = station and 
        (getSafeState("favoriteStations", {})[country] and 
         getSafeState("favoriteStations", {})[country][station.name]) or 
        (not station and getSafeState("favoriteCountries", {})[country])

    starIcon:SetImage(isFavorite and "hud/star_full.png" or "hud/star.png")
    
    -- Update star icon color
    starIcon.Paint = function(self, w, h)
        surface.SetDrawColor(Config.UI.FavoriteStarColor)
        surface.SetMaterial(MaterialCache:Get(isFavorite and "hud/star_full.png" or "hud/star.png"))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    starIcon.DoClick = function()
        if station then
            local currentFavoriteStations = getSafeState("favoriteStations", {})
            if not currentFavoriteStations[country] then
                currentFavoriteStations[country] = {}
            end

            if currentFavoriteStations[country][station.name] then
                currentFavoriteStations[country][station.name] = nil
                if next(currentFavoriteStations[country]) == nil then
                    currentFavoriteStations[country] = nil
                end
            else
                currentFavoriteStations[country][station.name] = true
            end

            StateManager:SetState("favoriteStations", currentFavoriteStations)
        else
            local currentFavoriteCountries = getSafeState("favoriteCountries", {})
            if currentFavoriteCountries[country] then
                currentFavoriteCountries[country] = nil
            else
                currentFavoriteCountries[country] = true
            end

            StateManager:SetState("favoriteCountries", currentFavoriteCountries)
        end

        saveFavorites()

        local newIsFavorite = station and 
            (getSafeState("favoriteStations", {})[country] and 
             getSafeState("favoriteStations", {})[country][station.name]) or 
            (not station and getSafeState("favoriteCountries", {})[country])
        
        starIcon:SetImage(newIsFavorite and "hud/star_full.png" or "hud/star.png")

        -- Force refresh of favorites list if we're in the favorites view
        if selectedCountry == "favorites" then
            -- Invalidate cache and force refresh
            StateManager:InvalidateCache("favorites")
            populateList(stationListPanel, backButton, searchBox, false)
        end

        if updateList then
            updateList()
        end

        -- Notify state change
        StateManager:Emit(StateManager.Events.FAVORITES_CHANGED, {
            type = station and "station" or "country",
            country = country,
            station = station,
            isFavorite = newIsFavorite
        })
    end

    return starIcon
end

--[[
    Function: createTooltip
    Creates a themed tooltip for a panel.
    
    Parameters:
    - panel: The panel to attach the tooltip to
    - text: The text to display in the tooltip
]]
local function createTooltip(panel, text)
    local tooltip
    
    panel.OnCursorEntered = function(self)
        if IsValid(tooltip) or not text or #text == 0 then return end
        
        tooltip = vgui.Create("DPanel")
        tooltip:SetDrawOnTop(true)
        
        -- Calculate maximum width based on screen size
        local maxWidth = math.min(ScrW() * 0.3, Scale(400))
        local padding = Scale(10)
        
        -- Wrap text to fit width
        local wrappedText = {}
        local currentLine = ""
        local words = string.Explode(" ", text)
        
        surface.SetFont("Roboto18")
        for _, word in ipairs(words) do
            local testLine = currentLine .. (currentLine ~= "" and " " or "") .. word
            local textWidth = surface.GetTextSize(testLine)
            
            if textWidth > maxWidth - (padding * 2) then
                table.insert(wrappedText, currentLine)
                currentLine = word
            else
                currentLine = testLine
            end
        end
        if currentLine ~= "" then
            table.insert(wrappedText, currentLine)
        end
        
        -- Calculate height based on number of lines
        local _, lineHeight = surface.GetTextSize("TEST")
        local textHeight = #wrappedText * lineHeight
        
        -- Set tooltip size
        tooltip:SetSize(maxWidth, textHeight + padding * 2)
        
        -- Position tooltip below cursor
        local x, y = gui.MousePos()
        tooltip:SetPos(x + Scale(10), y + Scale(10))
        
        -- Ensure tooltip stays on screen
        local screenW, screenH = ScrW(), ScrH()
        if x + tooltip:GetWide() + Scale(10) > screenW then
            tooltip:SetPos(screenW - tooltip:GetWide() - Scale(10), y + Scale(10))
        end
        if y + tooltip:GetTall() + Scale(10) > screenH then
            tooltip:SetPos(tooltip:GetX(), y - tooltip:GetTall() - Scale(10))
        end
        
        tooltip.Paint = function(self, w, h)
            -- Background with subtle shadow
            for i = 1, 5 do
                local alpha = math.max(0, 20 - i * 4)
                surface.SetDrawColor(0, 0, 0, alpha)
                draw.RoundedBox(8, -i, i, w + i*2, h, Color(0, 0, 0, alpha))
            end
            
            -- Main background
            draw.RoundedBox(8, 0, 0, w, h, Config.UI.MessageBackgroundColor)
            
            -- Draw wrapped text
            for i, line in ipairs(wrappedText) do
                draw.SimpleText(
                    line,
                    "Roboto18",
                    padding,
                    padding + (i-1) * lineHeight,
                    Config.UI.TextColor,
                    TEXT_ALIGN_LEFT,
                    TEXT_ALIGN_TOP
                )
            end
        end
        
        -- Remove tooltip when panel is removed
        panel.OnRemove = function()
            if IsValid(tooltip) then
                tooltip:Remove()
            end
        end
    end
    
    panel.OnCursorExited = function(self)
        if IsValid(tooltip) then
            tooltip:Remove()
            tooltip = nil
        end
    end
    
    -- Ensure cleanup
    panel.Think = function(self)
        if IsValid(tooltip) and not self:IsHovered() then
            tooltip:Remove()
            tooltip = nil
        end
    end
end

-- ------------------------------
--      UI Population
-- ------------------------------

--[[
    Function: populateList
    Populates the station or country list in the UI.

    Parameters:
    - stationListPanel: The panel to populate.
    - backButton: The back button UI element.
    - searchBox: The search box UI element.
    - resetSearch: Boolean indicating whether to reset the search box.
]]
local function populateList(stationListPanel, backButton, searchBox, resetSearch)
    if not stationListPanel then return end
    
    local currentState = {
        selectedCountry = getSafeState("selectedCountry", nil),
        favoritesMenuOpen = getSafeState("favoritesMenuOpen", false),
        settingsMenuOpen = getSafeState("settingsMenuOpen", false)
    }

    stationListPanel:Clear()
    if resetSearch then searchBox:SetText("") end

    -- Reset scroll position when changing views
    local sbar = stationListPanel:GetVBar()
    if sbar then
        sbar:SetScroll(0)
        sbar:InvalidateLayout()
    end

    local filterText = searchBox:GetText():lower()
    local lang = GetConVar("radio_language"):GetString() or "en"
    local selectedCountry = currentState.selectedCountry

    local function updateList()
        populateList(stationListPanel, backButton, searchBox, false)
    end

    local function createStyledButton(parent, text, onClick)
        local button = vgui.Create("DButton", parent)
        button:Dock(TOP)
        button:DockMargin(Scale(10), Scale(5), Scale(10), 0)
        button:SetTall(Scale(40))
        button:SetText(text)
        button:SetFont("Roboto18")
        button:SetTextColor(Config.UI.TextColor)
        button:SetTextInset(Scale(40), 0)
        
        -- Animation states
        button.hoverProgress = 0
        button.clickScale = 1
        
        button.Paint = function(self, w, h)
            -- Scale animation for click feedback
            local matrix = Matrix()
            matrix:Translate(Vector(w/2, h/2, 0))
            matrix:Scale(Vector(self.clickScale, self.clickScale, 1))
            matrix:Translate(Vector(-w/2, -h/2, 0))
            
            cam.PushModelMatrix(matrix)
            
            -- Background with hover animation
            local baseColor = Config.UI.ButtonColor
            local hoverColor = Config.UI.ButtonHoverColor
            local currentColor = LerpColor(self.hoverProgress, baseColor, hoverColor)
            
            draw.RoundedBox(8, 0, 0, w, h, currentColor)
            
            cam.PopModelMatrix()
        end
        
        button.Think = function(self)
            if self:IsHovered() then
                self.hoverProgress = math.Approach(self.hoverProgress, 1, FrameTime() * 5)
            else
                self.hoverProgress = math.Approach(self.hoverProgress, 0, FrameTime() * 5)
            end
        end
        
        button.DoClick = onClick
        
        return button
    end

    -- Create a separator line
    local function createSeparator()
        local separator = vgui.Create("DPanel", stationListPanel)
        separator:Dock(TOP)
        separator:DockMargin(Scale(10), Scale(5), Scale(10), Scale(5))
        separator:SetTall(Scale(2))
        separator.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Config.UI.SeparatorColor)
        end
        return separator
    end

    if selectedCountry == nil then
        local hasFavorites = false
        for country, stations in pairs(favoriteStations) do
            for stationName, isFavorite in pairs(stations) do
                if isFavorite then
                    hasFavorites = true
                    break
                end
            end
            if hasFavorites then break end
        end

        if hasFavorites then
            createSeparator()

            local favoritesButton = createStyledButton(
                stationListPanel,
                Config.Lang["FavoriteStations"] or "Favorite Stations",
                function()
                    surface.PlaySound("garrysmod/content_downloaded.wav")
                    StateManager:SetState("selectedCountry", "favorites")
                    StateManager:SetState("favoritesMenuOpen", true)
                    selectedCountry = "favorites"
                    favoritesMenuOpen = true
                    
                    if backButton then 
                        backButton:SetVisible(true)
                        backButton:SetEnabled(true)
                    end
                    updateList()
                end
            )

            favoritesButton:SetTextInset(Scale(40), 0)

            favoritesButton.PaintOver = function(self, w, h)
                surface.SetMaterial(MaterialCache:Get("hud/star_full.png"))
                surface.SetDrawColor(Config.UI.TextColor)
                
                local iconSize = Scale(24)
                local iconX = Scale(8)
                local iconY = (h - iconSize) / 2
                
                surface.DrawTexturedRect(iconX, iconY, iconSize, iconSize)
            end

            createSeparator()
        end

        local countries = {}
        for country, _ in pairs(StationData) do
            -- Format and translate the country name
            local formattedCountry = country:gsub("_", " "):gsub("(%a)([%w_']*)", function(first, rest)
                return first:upper() .. rest:lower()
            end)
            
            local translatedCountry = Misc.Language:GetCountryTranslation(lang, formattedCountry) or formattedCountry

            if filterText == "" or translatedCountry:lower():find(filterText, 1, true) then
                local isFavorite = getSafeState("favoriteCountries", {})[country] or false
                
                table.insert(countries, { 
                    original = country,        -- Original country code
                    formatted = formattedCountry, -- Formatted but untranslated name
                    translated = translatedCountry, -- Translated name for display
                    isPrioritized = isFavorite 
                })
            end
        end

        -- Sort countries with favorites first, using translated names
        table.sort(countries, function(a, b)
            if a.isPrioritized ~= b.isPrioritized then
                return a.isPrioritized
            end
            return a.translated < b.translated
        end)

        -- Create country buttons
        for _, country in ipairs(countries) do
            local countryButton = createStyledButton(
                stationListPanel,
                country.translated, -- Use translated name for display
                function()
                    local countryCode = country.original
                    surface.PlaySound("ui/buttonclick.wav") -- Add navigation sound
                    StateManager:SetState("selectedCountry", countryCode)
                    selectedCountry = countryCode
                    
                    if backButton then 
                        backButton:SetVisible(true)
                        backButton:SetEnabled(true)
                    end
                    
                    if searchBox then
                        searchBox:SetText("")
                    end
                    
                    updateList()
                end
            )

            -- Pass the raw country code to the star icon
            createStarIcon(countryButton, country.original, nil, updateList)
        end

        if backButton then
            backButton:SetVisible(false)
            backButton:SetEnabled(false)
        end

    elseif selectedCountry == "favorites" then
        -- Get cached favorites list
        local favoritesList = StateManager:GetFavoritesList(lang, filterText)

        for _, favorite in ipairs(favoritesList) do
            -- Format the country name before displaying
            local formattedCountry = favorite.countryName:gsub("_", " "):gsub("(%a)([%w_']*)", function(first, rest)
                return first:upper() .. rest:lower()
            end)
            -- Get translated country name
            local translatedCountry = Misc.Language:GetCountryTranslation(lang, formattedCountry) or formattedCountry
            
            local displayName = translatedCountry .. " - " .. utils.truncateStationName(favorite.station.name)
            local fullName = translatedCountry .. " - " .. favorite.station.name
            
            local stationButton = createStyledButton(
                stationListPanel,
                displayName,
                function(button)
                    local currentTime = CurTime()
                    -- Get last station time with a default value of 0
                    local lastStationTime = getSafeState("lastStationSelectTime", 0)
                    
                    -- Ensure we have valid numbers for comparison
                    if type(currentTime) ~= "number" or type(lastStationTime) ~= "number" then
                        print("[rRadio] Warning: Invalid time values in station button handler")
                        lastStationTime = 0
                    end

                    if (currentTime - lastStationTime) < 2 then return end

                    surface.PlaySound("buttons/button17.wav")
                    local entity = LocalPlayer().currentRadioEntity
                    if not IsValid(entity) then return end

                    -- Get and validate volume
                    local entityConfig = getEntityConfig(entity)
                    local volume = entityVolumes[entity] or (entityConfig and entityConfig.Volume()) or 0.5
                    volume = ClampVolume(volume)

                    -- Play the station
                    playStation(entity, favorite.station, volume)
                    
                    -- Update UI
                    updateList()
                end
            )

            -- Add tooltip if name is truncated
            if displayName ~= fullName then
                createTooltip(stationButton, fullName)
            end

            createStarIcon(stationButton, favorite.country, favorite.station, updateList)
        end
    else
        -- Regular station list for selected country
        local stations = StationData[selectedCountry] or {}
        local stationsList = {}

        -- Filter and prepare stations
        for _, station in ipairs(stations) do
            if station and station.name and (filterText == "" or station.name:lower():find(filterText, 1, true)) then
                local isFavorite = favoriteStations[selectedCountry] and favoriteStations[selectedCountry][station.name]
                table.insert(stationsList, { station = station, favorite = isFavorite })
            end
        end

        -- Sort stations (favorites first, then alphabetically)
        table.sort(stationsList, function(a, b)
            if a.favorite ~= b.favorite then
                return a.favorite
            end
            return (a.station.name or "") < (b.station.name or "")
        end)

        -- Create station buttons
        for _, stationData in ipairs(stationsList) do
            local station = stationData.station
            local displayName = utils.truncateStationName(station.name)
            local stationButton = createStyledButton(
                stationListPanel,
                displayName,
                function(button)
                    local currentTime = CurTime()
                    -- Get last station time with a default value of 0
                    local lastStationTime = getSafeState("lastStationSelectTime", 0)
                    
                    -- Ensure we have valid numbers for comparison
                    if type(currentTime) ~= "number" or type(lastStationTime) ~= "number" then
                        print("[rRadio] Warning: Invalid time values in station button handler")
                        lastStationTime = 0
                    end

                    if (currentTime - lastStationTime) < 2 then return end

                    surface.PlaySound("buttons/button17.wav")
                    local entity = LocalPlayer().currentRadioEntity
                    if not IsValid(entity) then return end

                    -- Get and validate volume
                    local entityConfig = getEntityConfig(entity)
                    local volume = entityVolumes[entity] or (entityConfig and entityConfig.Volume()) or 0.5
                    volume = ClampVolume(volume)

                    -- Play the station
                    playStation(entity, station, volume)
                    
                    -- Update UI
                    updateList()
                end
            )

            -- Add tooltip if name is truncated
            if displayName ~= station.name then
                createTooltip(stationButton, station.name)
            end

            stationButton.Paint = function(self, w, h)
                local entity = LocalPlayer().currentRadioEntity
                if IsValid(entity) and currentlyPlayingStations[entity] and 
                   currentlyPlayingStations[entity].name == station.name then
                    -- Base playing station color
                    draw.RoundedBox(8, 0, 0, w, h, Config.UI.StatusIndicatorColor)
                else
                    draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
                    if self:IsHovered() then
                        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonHoverColor)
                    end
                end

                -- Update reference from activeStreams to _streams
                local streamData = StreamManager._streams[entity:EntIndex()]
                if streamData then
                    if streamData.stream and not streamData.stream:IsValid() then
                        surface.SetDrawColor(Config.UI.CloseButtonColor)
                        surface.DrawRect(w * 0.9, 0, w * 0.1, h)
                    end
                end
            end

            createStarIcon(stationButton, selectedCountry, station, updateList)
        end

        if backButton then
            backButton:SetVisible(true)
            backButton:SetEnabled(true)
        end
    end
end

--[[
    Function: openSettingsMenu
    Opens the settings menu within the radio menu.

    Parameters:
    - parentFrame: The parent frame of the settings menu.
    - backButton: The back button to return to the main menu.
]]
local function openSettingsMenu(parentFrame, backButton)
    settingsFrame = vgui.Create("DPanel", parentFrame)
    settingsFrame:SetSize(parentFrame:GetWide() - Scale(20), parentFrame:GetTall() - Scale(50) - Scale(10))
    settingsFrame:SetPos(Scale(10), Scale(50))
    settingsFrame.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.BackgroundColor)
    end

    local scrollPanel = vgui.Create("DScrollPanel", settingsFrame)
    scrollPanel:Dock(FILL)
    scrollPanel:DockMargin(Scale(5), Scale(5), Scale(5), Scale(5))

    local function addHeader(text, isFirst)
        local header = vgui.Create("DLabel", scrollPanel)
        header:SetText(text)
        header:SetFont("Roboto18")
        header:SetTextColor(Config.UI.TextColor)
        header:Dock(TOP)
        if isFirst then
            header:DockMargin(0, Scale(5), 0, Scale(0))
        else
            header:DockMargin(0, Scale(10), 0, Scale(5))
        end
        header:SetContentAlignment(4)
    end

    local function addDropdown(text, choices, currentValue, onSelect)
        local container = vgui.Create("DPanel", scrollPanel)
        container:Dock(TOP)
        container:SetTall(Scale(50))
        container:DockMargin(0, 0, 0, Scale(5))
        container.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
        end

        local label = vgui.Create("DLabel", container)
        label:SetText(text)
        label:SetFont("Roboto18")
        label:SetTextColor(Config.UI.TextColor)
        label:Dock(LEFT)
        label:DockMargin(Scale(10), 0, 0, 0)
        label:SetContentAlignment(4)
        label:SizeToContents()

        local dropdown = vgui.Create("DComboBox", container)
        dropdown:Dock(RIGHT)
        dropdown:SetWide(Scale(150))
        dropdown:DockMargin(0, Scale(10), Scale(10), Scale(10))
        dropdown:SetValue(currentValue)
        dropdown:SetTextColor(Config.UI.TextColor)
        dropdown:SetFont("Roboto18")
        
        -- Style the dropdown
        dropdown.Paint = function(self, w, h)
            -- Main background
            draw.RoundedBox(6, 0, 0, w, h, Config.UI.SearchBoxColor)
            
            -- Draw arrow indicator
            surface.SetDrawColor(Config.UI.TextColor)
            local arrowSize = Scale(8)
            local margin = Scale(8)
            local x = w - arrowSize - margin
            local y = h/2 - arrowSize/2
            
            surface.DrawLine(x, y, x + arrowSize/2, y + arrowSize)
            surface.DrawLine(x + arrowSize/2, y + arrowSize, x + arrowSize, y)
        end

        dropdown.OpenMenu = function(self, pControlOpener)
            if IsValid(self.Menu) then
                self.Menu:Remove()
                self.Menu = nil
            end

            local menu = DermaMenu()
            menu:SetMinimumWidth(self:GetWide())

            local scrollPanel = vgui.Create("DScrollPanel", menu)
            scrollPanel:Dock(FILL)
            local maxHeight = Scale(300)

            local sbar = scrollPanel:GetVBar()
            sbar:SetWide(Scale(8))
            sbar:SetHideButtons(true)
            function sbar:Paint(w, h) 
                draw.RoundedBox(4, 0, 0, w, h, Config.UI.ScrollbarColor) 
            end
            function sbar.btnGrip:Paint(w, h) 
                draw.RoundedBox(4, 0, 0, w, h, Config.UI.ScrollbarGripColor) 
            end

            menu.Paint = function(_, w, h)
                draw.RoundedBox(6, 0, 0, w, h, Config.UI.SearchBoxColor)
                surface.SetDrawColor(Config.UI.ButtonColor)
                surface.DrawRect(0, 0, w, 1)
            end

            local totalHeight = 0
            local optionHeight = Scale(30)
            
            for _, choice in ipairs(choices) do
                local panel = vgui.Create("DPanel", scrollPanel)
                panel:SetTall(optionHeight)
                panel:Dock(TOP)
                panel.Paint = function(_, w, h)
                    if panel:IsHovered() then
                        draw.RoundedBox(0, 0, 0, w, h, Config.UI.ButtonHoverColor)
                    end
                end
                
                local button = vgui.Create("DButton", panel)
                button:Dock(FILL)
                button:SetText(choice.name)
                button:SetTextColor(Config.UI.TextColor)
                button:SetFont("Roboto18")
                button.Paint = function() end -- No background
                
                -- Store the choice data
                button.choiceData = choice.data
                
                button.DoClick = function()
                    print("[rRadio Debug] Button Click:")
                    print("  - Choice name:", choice.name)
                    print("  - Choice data:", choice.data)
                    
                    self:SetValue(choice.name)
                    if onSelect then
                        onSelect(self, nil, choice.name, choice.data)
                    end
                    menu:Remove()
                end
                
                totalHeight = totalHeight + optionHeight
            end

            -- Set menu size
            local menuHeight = math.min(totalHeight + Scale(2), maxHeight)
            menu:SetTall(menuHeight)
            scrollPanel:SetTall(menuHeight)

            -- Position the menu
            local x, y = self:LocalToScreen(0, self:GetTall())

            local screenH = ScrH()
            if y + menuHeight > screenH then
                y = y - menuHeight - self:GetTall()
            end
            
            menu:SetPos(x, y)
            menu:MakePopup()
            self.Menu = menu
        end

        for _, choice in ipairs(choices) do
            dropdown:AddChoice(choice.name, choice.data)
        end

        dropdown.OnSelect = onSelect

        return dropdown
    end

    local function addCheckbox(text, convar)
        local container = vgui.Create("DPanel", scrollPanel)
        container:Dock(TOP)
        container:SetTall(Scale(40))
        container:DockMargin(0, 0, 0, Scale(5))
        container.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
        end

        local checkbox = vgui.Create("DCheckBox", container)
        checkbox:SetPos(Scale(10), (container:GetTall() - Scale(20)) / 2)
        checkbox:SetSize(Scale(20), Scale(20))
        checkbox:SetConVar(convar)

        checkbox.Paint = function(self, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Config.UI.SearchBoxColor)
            if self:GetChecked() then
                surface.SetDrawColor(Config.UI.TextColor)
                surface.DrawRect(Scale(4), Scale(4), w - Scale(8), h - Scale(8))
            end
        end

        local label = vgui.Create("DLabel", container)
        label:SetText(text)
        label:SetTextColor(Config.UI.TextColor)
        label:SetFont("Roboto18")
        label:SizeToContents()
        label:SetPos(Scale(40), (container:GetTall() - label:GetTall()) / 2)

        checkbox.OnChange = function(self, value)
            if not ConVarExists(convar) then
                print("[rRadio] Warning: ConVar " .. convar .. " does not exist")
                return
            end

            RunConsoleCommand(convar, value and "1" or "0")
            StateManager:SetState("settings_" .. convar, value)
            
            -- Emit settings change event
            StateManager:Emit(StateManager.Events.SETTINGS_CHANGED, {
                setting = convar,
                value = value
            })
        end

        return checkbox
    end

    -- Theme Selection
    addHeader(Config.Lang["ThemeSelection"] or "Theme Selection", true)
    local themeChoices = {
        main = {},
        strange = {},
        other = {}
    }

    -- Validate themes table
    if type(themeModule.themes) == "table" then
        for themeName, themeData in pairs(themeModule.themes) do
            if type(themeData) == "table" then
                local category = themeData.category or "other"
                table.insert(themeChoices[category], {
                    name = themeName:gsub("^%l", string.upper),
                    data = themeName
                })
            end
        end
    else
        print("[rRadio] Warning: Themes table is invalid")
        themeModule.themes = {}
    end

    -- Sort themes within each category
    for _, categoryThemes in pairs(themeChoices) do
        table.sort(categoryThemes, function(a, b)
            return a.name < b.name
        end)
    end

    -- Create final choices array with category headers
    local finalThemeChoices = {}

    -- Add Main themes
    if #themeChoices.main > 0 then
        table.insert(finalThemeChoices, {
            name = Config.Lang["Main"] or "Main Themes",
            data = nil,
            isHeader = true
        })
        for _, theme in ipairs(themeChoices.main) do
            table.insert(finalThemeChoices, theme)
        end
    end

    -- Add Strange themes
    if #themeChoices.strange > 0 then
        table.insert(finalThemeChoices, {
            name = Config.Lang["Strange"] or "Strange Themes",
            data = nil,
            isHeader = true
        })
        for _, theme in ipairs(themeChoices.strange) do
            table.insert(finalThemeChoices, theme)
        end
    end

    -- Add Other themes
    if #themeChoices.other > 0 then
        table.insert(finalThemeChoices, {
            name = Config.Lang["Other"] or "Other Themes",
            data = nil,
            isHeader = true
        })
        for _, theme in ipairs(themeChoices.other) do
            table.insert(finalThemeChoices, theme)
        end
    end

    local currentTheme = GetConVar("radio_theme"):GetString()
    local currentThemeName = currentTheme:gsub("^%l", string.upper)

    -- Modify the dropdown creation to handle categories
    local themeDropdown = addDropdown(Config.Lang["SelectTheme"] or "Select Theme", finalThemeChoices, currentThemeName, function(_, _, value)
        local lowerValue = value:lower()
        if themeModule.themes[lowerValue] then
            RunConsoleCommand("radio_theme", lowerValue)
            timer.Simple(0, function()
                Misc.Settings:ApplyTheme(lowerValue)
            end)
            
            -- Safely close and reopen the menu
            if IsValid(parentFrame) then
                parentFrame:Close()
                timer.Simple(0.1, function()
                    reopenRadioMenu(true)
                end)
            end
        else
            print("[rRadio] Warning: Invalid theme selected:", value)
        end
    end)

    themeDropdown.OpenMenu = function(self, pControlOpener)
        if IsValid(self.Menu) then
            self.Menu:Remove()
            self.Menu = nil
        end

        local menu = DermaMenu()
        menu:SetMinimumWidth(self:GetWide())

        local scrollPanel = vgui.Create("DScrollPanel", menu)
        scrollPanel:Dock(FILL)
        local maxHeight = Scale(300)

        -- Enhanced scrollbar styling
        local sbar = scrollPanel:GetVBar()
        sbar:SetWide(Scale(8))
        sbar:SetHideButtons(true)
        sbar.Paint = function(_, w, h)
            draw.RoundedBox(4, 0, 0, w, h, ColorAlpha(Config.UI.ScrollbarColor, 100))
        end
        sbar.btnGrip.Paint = function(_, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Config.UI.ScrollbarGripColor)
        end

        -- Enhanced menu background
        menu.Paint = function(_, w, h)
            -- Main background
            draw.RoundedBox(8, 0, 0, w, h, Config.UI.SearchBoxColor)
            
            -- Subtle border
            surface.SetDrawColor(ColorAlpha(Config.UI.ButtonColor, 30))
            surface.DrawRect(0, 0, w, 1)
            surface.DrawRect(0, h-1, w, 1)
            
            -- Subtle shadow effect
            for i = 1, 5 do
                local alpha = math.max(0, 20 - i * 4)
                surface.SetDrawColor(0, 0, 0, alpha)
                draw.RoundedBox(8, -i, i, w + i*2, h, Color(0, 0, 0, alpha))
            end
        end

        local totalHeight = 0
        local optionHeight = Scale(32)
        local headerHeight = Scale(28)
        local padding = Scale(10)
        
        for _, choice in ipairs(finalThemeChoices) do
            if choice.isHeader then
                -- Enhanced header styling
                local header = vgui.Create("DPanel", scrollPanel)
                header:SetTall(headerHeight)
                header:Dock(TOP)
                header:DockMargin(0, totalHeight == 0 and 0 or padding, 0, Scale(2))
                
                header.Paint = function(_, w, h)
                    -- Header background
                    draw.RoundedBox(4, padding/2, 0, w-padding, h, ColorAlpha(Config.UI.ButtonColor, 40))
                    
                    -- Header text
                    draw.SimpleText(
                        choice.name, 
                        "Roboto18", 
                        padding + Scale(5), 
                        h/2,
                        Config.UI.TextColor, 
                        TEXT_ALIGN_LEFT, 
                        TEXT_ALIGN_CENTER
                    )
                    
                    -- Subtle separator line
                    surface.SetDrawColor(ColorAlpha(Config.UI.TextColor, 20))
                    surface.DrawLine(
                        padding + Scale(5), 
                        h-1, 
                        w-padding-Scale(5), 
                        h-1
                    )
                end
                totalHeight = totalHeight + headerHeight + (totalHeight == 0 and 0 or padding)
            else
                -- Enhanced theme option styling
                local panel = vgui.Create("DPanel", scrollPanel)
                panel:SetTall(optionHeight)
                panel:Dock(TOP)
                panel:DockMargin(padding, Scale(2), padding, 0)
                
                local isCurrentTheme = choice.data == GetConVar("radio_theme"):GetString()
                local hoverAlpha = 0
                
                panel.Paint = function(self, w, h)
                    -- Background with hover effect
                    local bgColor = isCurrentTheme and Config.UI.ButtonColor or Color(0,0,0,0)
                    local hoverColor = Config.UI.ButtonHoverColor
                    
                    if self:IsHovered() then
                        hoverAlpha = math.Approach(hoverAlpha, 1, FrameTime() * 10)
                    else
                        hoverAlpha = math.Approach(hoverAlpha, 0, FrameTime() * 10)
                    end
                    
                    local finalColor = LerpColor(hoverAlpha, bgColor, hoverColor)
                    draw.RoundedBox(6, 0, 0, w, h, finalColor)
                    
                    -- Current theme indicator
                    if isCurrentTheme then
                        -- Accent dot
                        local dotSize = Scale(6)
                        local dotMargin = Scale(8)
                        draw.RoundedBox(dotSize/2, dotMargin, h/2-dotSize/2, dotSize, dotSize, Config.UI.AccentColor)
                    end
                end
                
                local button = vgui.Create("DButton", panel)
                button:Dock(FILL)
                button:DockMargin(isCurrentTheme and Scale(20) or Scale(8), 0, 0, 0)
                button:SetText(choice.name)
                button:SetTextColor(Config.UI.TextColor)
                button:SetFont("Roboto18")
                button.Paint = function() end
                
                button.DoClick = function()
                    surface.PlaySound("buttons/button15.wav")
                    self:SetValue(choice.name)
                    if choice.data then
                        RunConsoleCommand("radio_theme", choice.data)
                        timer.Simple(0, function()
                            Misc.Settings:ApplyTheme(choice.data)
                        end)
                        
                        if IsValid(parentFrame) then
                            parentFrame:Close()
                            timer.Simple(0.1, function()
                                reopenRadioMenu(true)
                            end)
                        end
                    end
                    menu:Remove()
                end
                
                totalHeight = totalHeight + optionHeight + Scale(2)
            end
        end

        -- Set menu size with padding
        local menuHeight = math.min(totalHeight + padding * 2, maxHeight)
        menu:SetTall(menuHeight)
        scrollPanel:SetTall(menuHeight)

        -- Position the menu with improved screen boundary checking
        local x, y = self:LocalToScreen(0, self:GetTall())
        local screenW, screenH = ScrW(), ScrH()
        
        -- Horizontal position adjustment
        if x + menu:GetWide() > screenW then
            x = screenW - menu:GetWide() - padding
        end
        
        -- Vertical position adjustment
        if y + menuHeight > screenH then
            y = y - menuHeight - self:GetTall()
        end
        
        menu:SetPos(x, y)
        menu:MakePopup()
        self.Menu = menu
    end

    -- Language Selection
    addHeader(Config.Lang["LanguageSelection"] or "Language Selection")
    local languageChoices = {}
    local availableLanguages = Misc.Language:GetAvailableLanguages()
    
    if type(availableLanguages) == "table" then
        for code, name in pairs(availableLanguages) do
            if type(code) == "string" and type(name) == "string" then
                table.insert(languageChoices, {name = name, data = code})
            end
        end
    else
        print("[rRadio] Warning: Available languages table is invalid")
    end

    local currentLanguage = GetConVar("radio_language"):GetString()
    local currentLanguageName = Misc.Language:GetLanguageName(currentLanguage)

    addDropdown(Config.Lang["SelectLanguage"] or "Select Language", languageChoices, currentLanguageName, function(_, _, name, data)
        print("[rRadio Debug] Language Selection:")
        print("  - Selected Name:", name)
        print("  - Language Code:", data)
        print("  - Current Language:", GetConVar("radio_language"):GetString())
        
        if not data then 
            print("  - Error: No language code provided")
            return 
        end
        
        -- Update convar and language
        RunConsoleCommand("radio_language", data)
        print("  - Set language convar to:", data)
        
        -- Verify convar was set
        timer.Simple(0.1, function()
            print("  - Verified language convar:", GetConVar("radio_language"):GetString())
        end)
        
        Misc.Language:SetLanguage(data)
        Config.Lang = Misc.Language.translations[data]
        
        -- Update state
        StateManager:SetState("currentLanguage", data)
        StateManager:Emit(StateManager.Events.LANGUAGE_CHANGED, data)
        print("  - Language state updated")

        -- Reset cached country names
        StateManager:SetState("formattedCountryNames", {})

        -- Reload station data
        stationDataLoaded = false
        LoadStationData()

        -- Close and reopen menu
        if IsValid(currentFrame) then
            currentFrame:Close()
            timer.Simple(0.1, function()
                if openRadioMenu then
                    radioMenuOpen = false
                    StateManager:SetState("selectedCountry", nil)
                    StateManager:SetState("settingsMenuOpen", false)
                    StateManager:SetState("favoritesMenuOpen", false)
                    openRadioMenu(true)
                end
            end)
        end
    end)

    addHeader(Config.Lang["SelectKeyToOpenRadioMenu"] or "Select Key to Open Radio Menu")
    local keyChoices = {}

    local letterKeys = {}
    local numberKeys = {}
    local functionKeys = {}
    local otherKeys = {}

    for keyCode, keyName in pairs(Misc.KeyNames) do
        if type(keyName) == "string" and keyCode ~= "GetKeyName" then
            local entry = {code = tonumber(keyCode), name = keyName}
            
            if keyName:match("^%a$") then
                table.insert(letterKeys, entry)
            elseif keyName:match("^%d$") then
                table.insert(numberKeys, entry)
            elseif keyName:match("^F%d+$") then
                table.insert(functionKeys, entry)
            else
                table.insert(otherKeys, entry)
            end
        end
    end

    -- Sort categories (same as before)
    table.sort(letterKeys, function(a, b) return a.name < b.name end)
    table.sort(numberKeys, function(a, b) return tonumber(a.name) < tonumber(b.name) end)
    table.sort(functionKeys, function(a, b) 
        return tonumber(a.name:match("%d+")) < tonumber(b.name:match("%d+"))
    end)
    table.sort(otherKeys, function(a, b) return a.name < b.name end)

    local sortedKeys = {}
    for _, key in ipairs(letterKeys) do table.insert(sortedKeys, key) end
    for _, key in ipairs(numberKeys) do table.insert(sortedKeys, key) end
    for _, key in ipairs(functionKeys) do table.insert(sortedKeys, key) end
    for _, key in ipairs(otherKeys) do table.insert(sortedKeys, key) end

    -- Convert to choices format
    for _, key in ipairs(sortedKeys) do
        table.insert(keyChoices, {
            name = key.name,
            data = key.code
        })
    end

    local currentKey = GetConVar("car_radio_open_key"):GetInt()
    local currentKeyName = Misc.KeyNames:GetKeyName(currentKey)

    addDropdown(Config.Lang["SelectKey"] or "Select Key", keyChoices, currentKeyName, function(panel, _, name, data)
        print("[rRadio Debug] Key Selection:")
        print("  - Selected Name:", name)
        print("  - Key Code:", data)
        print("  - Current Key:", GetConVar("car_radio_open_key"):GetInt())
        
        if not data then 
            print("  - Error: No key code provided")
            return 
        end
        
        -- Ensure we have a number
        local keyCode = tonumber(data)
        if not keyCode then
            print("  - Error: Invalid key code format:", data)
            return
        end
        
        -- Use RunConsoleCommand instead of SetInt
        print("  - Setting key convar to:", keyCode)
        RunConsoleCommand("car_radio_open_key", keyCode)
        
        -- Verify convar was set
        timer.Simple(0.1, function()
            print("  - Verified key convar:", GetConVar("car_radio_open_key"):GetInt())
            print("  - Key name for verified code:", Misc.KeyNames:GetKeyName(GetConVar("car_radio_open_key"):GetInt()))
        end)
        
        -- Update state
        StateManager:SetState("lastKeyPress", 0)
        StateManager:Emit(StateManager.Events.KEY_CHANGED, {
            key = keyCode,
            keyName = name
        })
        print("  - Key state updated")
        
        -- Play feedback sound
        surface.PlaySound("buttons/button15.wav")
    end)

    addHeader(Config.Lang["GeneralOptions"] or "General Options")
    addCheckbox(Config.Lang["ShowCarMessages"] or "Show Car Radio Messages", "car_radio_show_messages")
    addCheckbox(Config.Lang["ShowBoomboxHUD"] or "Show Boombox Hover Text", "boombox_show_text")

    -- Superadmin: Permanent Boombox Section
    if LocalPlayer():IsSuperAdmin() then
        local currentEntity = LocalPlayer().currentRadioEntity
        local isBoombox = IsValid(currentEntity) and (currentEntity:GetClass() == "boombox" or currentEntity:GetClass() == "golden_boombox")

        if isBoombox then
            addHeader(Config.Lang["SuperadminSettings"] or "Superadmin Settings")

            local permanentCheckbox = addCheckbox(Config.Lang["MakeBoomboxPermanent"] or "Make Boombox Permanent", "")
            permanentCheckbox:SetChecked(currentEntity:GetNWBool("IsPermanent", false))

            permanentCheckbox.OnChange = function(self, value)
                if not IsValid(currentEntity) then
                    self:SetChecked(false)
                    return
                end

                if value then
                    net.Start("MakeBoomboxPermanent")
                        net.WriteEntity(currentEntity)
                    net.SendToServer()
                else
                    net.Start("RemoveBoomboxPermanent")
                        net.WriteEntity(currentEntity)
                    net.SendToServer()
                end
            end

            net.Receive("BoomboxPermanentConfirmation", function()
                local message = net.ReadString()
                chat.AddText(Color(0, 255, 0), "[Boombox] ", Color(255, 255, 255), message)
                if string.find(message, "marked as permanent") then
                    permanentCheckbox:SetChecked(true)
                elseif string.find(message, "permanence has been removed") then
                    permanentCheckbox:SetChecked(false)
                end
            end)
        end
    end

    local footerHeight = Scale(60)
    local footer = vgui.Create("DButton", settingsFrame)
    footer:SetSize(settingsFrame:GetWide(), footerHeight)
    footer:SetPos(0, settingsFrame:GetTall() - footerHeight)
    footer:SetText("")
    footer.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, self:IsHovered() and Config.UI.BackgroundColor or Config.UI.BackgroundColor)
    end
    footer.DoClick = function()
        gui.OpenURL("https://github.com/charles-mills/rRadio")
    end

    local githubIcon = vgui.Create("DImage", footer)
    githubIcon:SetSize(Scale(32), Scale(32))
    githubIcon:SetPos(Scale(10), (footerHeight - Scale(32)) / 2)
    githubIcon:SetImage("materials/hud/github.png")

    local contributeTitleLabel = vgui.Create("DLabel", footer)
    contributeTitleLabel:SetText(Config.Lang["Contribute"] or "Want to contribute?")
    contributeTitleLabel:SetFont("Roboto18")
    contributeTitleLabel:SetTextColor(Config.UI.TextColor)
    contributeTitleLabel:SizeToContents()
    contributeTitleLabel:SetPos(Scale(50), footerHeight / 2 - contributeTitleLabel:GetTall() + Scale(2))

    local contributeSubLabel = vgui.Create("DLabel", footer)
    contributeSubLabel:SetText(Config.Lang["SubmitPullRequest"] or "Submit a pull request :)")
    contributeSubLabel:SetFont("Roboto18")
    contributeSubLabel:SetTextColor(Config.UI.TextColor)
    contributeSubLabel:SizeToContents()
    contributeSubLabel:SetPos(Scale(50), footerHeight / 2 + Scale(2))

    githubIcon.Paint = function(self, w, h)
        surface.SetDrawColor(Config.UI.TextColor)
        surface.SetMaterial(MaterialCache:Get("hud/github.png"))
        surface.DrawTexturedRect(0, 0, w, h)
    end
end

--[[
    Function: openUnauthorizedUI
    Opens a limited UI for users without boombox permissions.
    Shows current station, mute controls, and settings access.
]]
local function openUnauthorizedUI(entity)
    if unauthorizedUIOpen then return end
    if not IsValid(entity) then return end
    
    unauthorizedUIOpen = true
    
    local frame = vgui.Create("DFrame")
    currentFrame = frame
    frame:SetTitle("")
    frame:SetSize(Scale(Config.UI.FrameSize.width), Scale(200))
    frame:Center()
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:MakePopup()
    
    frame.OnClose = function()
        unauthorizedUIOpen = false
    end

    frame.Paint = function(self, w, h)
        -- Background
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.BackgroundColor)
        draw.RoundedBoxEx(8, 0, 0, w, Scale(40), Config.UI.HeaderColor, true, true, false, false)

        -- Header icon and text
        local headerHeight = Scale(40)
        local iconSize = Scale(25)
        local iconOffsetX = Scale(10)
        local iconOffsetY = headerHeight/2 - iconSize/2

        surface.SetMaterial(MaterialCache:Get("hud/radio.png"))
        surface.SetDrawColor(Config.UI.TextColor)
        surface.DrawTexturedRect(iconOffsetX, iconOffsetY, iconSize, iconSize)

        draw.SimpleText(
            Config.Lang["UnauthorizedAccess"] or "Unauthorized Access", 
            "HeaderFont", 
            iconOffsetX + iconSize + Scale(5), 
            headerHeight/2, 
            Config.UI.TextColor, 
            TEXT_ALIGN_LEFT, 
            TEXT_ALIGN_CENTER
        )
    end

    -- Station info panel
    local infoPanel = vgui.Create("DPanel", frame)
    infoPanel:SetPos(Scale(10), Scale(50))
    infoPanel:SetSize(frame:GetWide() - Scale(20), Scale(60))
    infoPanel.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
        
        local stationName = entity:GetNWString("StationName", "")
        local status = entity:GetNWString("Status", "")
        local volume = entity:GetNWFloat("Volume", 0.5)
        local entIndex = entity:EntIndex()
        local isMuted = MuteManager:IsMuted(entIndex)
        
        if stationName ~= "" then
            -- Station name with truncation
            local displayName = utils.truncateStationName(stationName)
            draw.SimpleText(
                displayName,
                "Roboto18",
                Scale(10),
                Scale(10),
                Config.UI.TextColor,
                TEXT_ALIGN_LEFT,
                TEXT_ALIGN_TOP
            )
            
            -- Show full name as tooltip if truncated
            if displayName ~= stationName then
                if self:IsHovered() then
                    local x, y = self:LocalToScreen(0, 0)
                    local tooltip = vgui.Create("DPanel")
                    tooltip:SetDrawOnTop(true)
                    tooltip:SetText(stationName)
                    tooltip:SizeToContents()
                    tooltip:SetPos(x + Scale(10), y + Scale(10))
                    timer.Simple(0.01, function() if IsValid(tooltip) then tooltip:Remove() end end)
                end
            end
            
            -- Status with volume indicator
            local statusText = status:sub(1,1):upper() .. status:sub(2)
            if status == "playing" then
                statusText = statusText .. string.format(" (Volume: %d%%)", math.Round(volume * 100))
                if isMuted then
                    statusText = statusText .. " - MUTED"
                end
            end
            
            -- Status text with color based on state
            local statusColor = status == "playing" and 
                (isMuted and Config.UI.CloseButtonColor or Color(100, 255, 100, 255)) or 
                Config.UI.TextColor
            
            draw.SimpleText(
                statusText,
                "Roboto18",
                Scale(10),
                Scale(35),
                statusColor,
                TEXT_ALIGN_LEFT,
                TEXT_ALIGN_TOP
            )
            
            -- Visual volume indicator
            if status == "playing" then
                local barWidth = w - Scale(20)
                local barHeight = Scale(4)
                local barY = Scale(52)
                
                -- Background bar
                draw.RoundedBox(2, Scale(10), barY, barWidth, barHeight, 
                    ColorAlpha(Config.UI.ScrollbarColor, 100))
                
                -- Volume bar
                local volWidth = barWidth * volume
                draw.RoundedBox(2, Scale(10), barY, volWidth, barHeight,
                    isMuted and Config.UI.CloseButtonColor or Config.UI.AccentColor)
            end
        else
            draw.SimpleText(
                Config.Lang["NoStation"] or "No Station Playing",
                "Roboto18",
                w/2,
                h/2,
                Config.UI.TextColor,
                TEXT_ALIGN_CENTER,
                TEXT_ALIGN_CENTER
            )
        end
    end

    infoPanel.Think = function(self)
        if IsValid(entity) and entity:GetNWString("Status", "") == "playing" then
            self:InvalidateLayout()
        end
    end

    -- Mute button
    local muteButton = vgui.Create("DButton", frame)
    muteButton:SetPos(Scale(10), Scale(120))
    muteButton:SetSize(frame:GetWide() - Scale(20), Scale(40))
    muteButton:SetText("")
    
    local isMuted = isBoomboxMuted[entity:EntIndex()] or false
    
    muteButton.Paint = function(self, w, h)
        local bgColor = isMuted and Config.UI.CloseButtonColor or Config.UI.ButtonColor
        local hoverColor = isMuted and Config.UI.CloseButtonHoverColor or Config.UI.ButtonHoverColor
        
        if self:IsHovered() then
            draw.RoundedBox(8, 0, 0, w, h, hoverColor)
        else
            draw.RoundedBox(8, 0, 0, w, h, bgColor)
        end
        
        -- Icon
        surface.SetMaterial(MaterialCache:Get(isMuted and "hud/vol_mute.png" or "hud/vol_up.png"))
        surface.SetDrawColor(Config.UI.TextColor)
        surface.DrawTexturedRect(Scale(10), Scale(8), Scale(24), Scale(24))
        
        -- Text
        draw.SimpleText(
            isMuted and (Config.Lang["Unmute"] or "Unmute Boombox") or (Config.Lang["Mute"] or "Mute Boombox"),
            "Roboto18",
            Scale(44),
            h/2,
            Config.UI.TextColor,
            TEXT_ALIGN_LEFT,
            TEXT_ALIGN_CENTER
        )
    end
    
    muteButton.DoClick = function()
        surface.PlaySound("buttons/button15.wav")
        local entIndex = entity:EntIndex()
        
        if MuteManager:IsMuted(entIndex) then
            MuteManager:UnmuteEntity(entIndex, entity)
            isMuted = false
        else
            MuteManager:MuteEntity(entIndex, entity)
            isMuted = true
        end
    end

    local buttonSize = Scale(25)
    local topMargin = Scale(7)
    local buttonPadding = Scale(5)

    local closeButton = vgui.Create("DButton", frame)
    closeButton:SetPos(frame:GetWide() - buttonSize - Scale(10), topMargin)
    closeButton:SetSize(buttonSize, buttonSize)
    closeButton:SetText("")
    closeButton.lerp = 0
    
    closeButton.Paint = function(self, w, h)
        if self:IsHovered() then
            self.lerp = math.Approach(self.lerp, 1, FrameTime() * 5)
        else
            self.lerp = math.Approach(self.lerp, 0, FrameTime() * 5)
        end
        
        surface.SetMaterial(MaterialCache:Get("hud/close.png"))
        surface.SetDrawColor(ColorAlpha(Config.UI.IconColor, 255 * (0.5 + 0.5 * self.lerp)))
        surface.DrawTexturedRect(0, 0, w, h)
    end
    
    closeButton.DoClick = function()
        surface.PlaySound("buttons/lightswitch2.wav")
        frame:Close()
    end
end

-- ------------------------------
--      Main UI Function
-- ------------------------------

--[[
    Function: openRadioMenu
    Opens the radio menu UI for the player.
]]
openRadioMenu = function(openSettings)
    Debug:Log("Attempting to open radio menu")
    
    -- Add mutex lock to prevent multiple opens
    if StateManager:GetState("isOpeningMenu") then
        Debug:Log("Menu is currently in opening process, returning")
        return
    end
    
    -- Check if menu is already open
    if StateManager:GetState("radioMenuOpen") then 
        Debug:Log("Menu already open, returning")
        return 
    end
    
    -- Set opening state
    StateManager:SetState("isOpeningMenu", true)
    
    local ply = LocalPlayer()
    local entity = StateManager:GetState("currentRadioEntity")
    
    Debug:Log("Entity check:", IsValid(entity), entity)
    
    if not IsValid(entity) or 
       not utils.canUseRadio(entity) or 
       (utils.IsBoombox(entity) and not utils.canInteractWithBoombox(ply, entity)) then
        Debug:Log("Failed entity validation checks")
        StateManager:SetState("isOpeningMenu", false)
        return
    end
    
    -- Create frame BEFORE setting menu state
    Debug:Log("Creating frame")
    local frame = vgui.Create("DFrame")
    if not IsValid(frame) then
        Debug:Error("Failed to create frame")
        StateManager:SetState("isOpeningMenu", false)
        return
    end
    
    currentFrame = frame
    frame:SetTitle("")
    frame:SetSize(Scale(Config.UI.FrameSize.width), Scale(Config.UI.FrameSize.height))
    frame:Center()
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:MakePopup()
    
    -- Only set menu state after successful frame creation
    Debug:Log("Setting menu states")
    StateManager:SetState("radioMenuOpen", true)
    StateManager:SetState("settingsMenuOpen", openSettings or false)
    StateManager:SetState("favoritesMenuOpen", false)
    StateManager:SetState("selectedCountry", nil)
    
    -- Clear opening state
    StateManager:SetState("isOpeningMenu", false)
    
    frame.OnClose = function()
        Debug:Log("Frame closing, cleaning up states")
        StateManager:SetState("radioMenuOpen", false)
        StateManager:SetState("selectedCountry", nil)
        StateManager:SetState("favoritesMenuOpen", false)
        StateManager:SetState("settingsMenuOpen", false)
        StateManager:SetState("isOpeningMenu", false)
        currentFrame = nil
        
        -- Clean up any abandoned streams
        for entIndex, streamData in pairs(StreamManager._streams) do
            if not IsValid(streamData.entity) then
                StreamManager:QueueCleanup(entIndex, "menu_closed")
            end
        end
    end
    
    frame.Paint = function(self, w, h)
        -- Normal painting
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.BackgroundColor)
        draw.RoundedBoxEx(8, 0, 0, w, Scale(40), Config.UI.HeaderColor, true, true, false, false)

        local headerHeight = Scale(40)
        local iconSize = Scale(25)
        local iconOffsetX = Scale(10)
        local iconOffsetY = headerHeight/2 - iconSize/2

        -- Draw the icon
        surface.SetMaterial(MaterialCache:Get("hud/radio.png"))
        surface.SetDrawColor(Config.UI.TextColor)
        surface.DrawTexturedRect(iconOffsetX, iconOffsetY, iconSize, iconSize)

        -- Get current language and state
        local lang = GetConVar("radio_language"):GetString() or "en"
        local currentCountry = getSafeState("selectedCountry", nil)
        local isSettingsOpen = settingsMenuOpen -- Use local variable instead of state
        local isFavoritesOpen = favoritesMenuOpen -- Use local variable instead of state

        -- Determine header text
        local headerText
        if isSettingsOpen then
            headerText = Config.Lang["Settings"] or "Settings"
        elseif currentCountry then
            if currentCountry == "favorites" or isFavoritesOpen then
                headerText = Config.Lang["FavoriteStations"] or "Favorite Stations"
            else
                -- Format and translate country name
                local formattedCountry = currentCountry:gsub("_", " "):gsub("(%a)([%w_']*)", function(a, b)
                    return string.upper(a) .. string.lower(b) 
                end)
                headerText = Misc.Language:GetCountryTranslation(lang, formattedCountry) or formattedCountry
            end
        else
            headerText = Config.Lang["SelectCountry"] or "Select Country"
        end

        -- Draw the header text
        draw.SimpleText(headerText, "HeaderFont", iconOffsetX + iconSize + Scale(5), 
                       headerHeight/2, Config.UI.TextColor, 
                       TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local searchBox = vgui.Create("DTextEntry", frame)
    searchBox:SetPos(Scale(10), Scale(50))
    searchBox:SetSize(Scale(Config.UI.FrameSize.width) - Scale(20), Scale(30))
    searchBox:SetFont("Roboto18")
    searchBox:SetPlaceholderText(Config.Lang and Config.Lang["SearchPlaceholder"] or "Search")
    searchBox:SetTextColor(Config.UI.TextColor)
    searchBox:SetDrawBackground(false)
    searchBox.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.SearchBoxColor)
        self:DrawTextEntryText(Config.UI.TextColor, Color(120, 120, 120), Config.UI.TextColor)

        if self:GetText() == "" then
            draw.SimpleText(self:GetPlaceholderText(), self:GetFont(), Scale(5), h / 2, Config.UI.TextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end
    searchBox:SetVisible(not settingsMenuOpen)

    searchBox.OnGetFocus = function()
        isSearching = true
    end

    searchBox.OnLoseFocus = function()
        isSearching = false
    end

    local stationListPanel = vgui.Create("DScrollPanel", frame)
    stationListPanel:SetPos(Scale(5), Scale(90))
    stationListPanel:SetSize(Scale(Config.UI.FrameSize.width) - Scale(10), Scale(Config.UI.FrameSize.height) - Scale(200))
    stationListPanel:SetVisible(not settingsMenuOpen)

    local stopButtonHeight = Scale(Config.UI.FrameSize.width) / 8
    local stopButtonWidth = Scale(Config.UI.FrameSize.width) / 4
    local stopButtonText = Config.Lang["StopRadio"] or "STOP"
    local stopButtonFont = calculateFontSizeForStopButton(stopButtonText, stopButtonWidth, stopButtonHeight)

    local function createAnimatedButton(parent, x, y, w, h, text, textColor, bgColor, hoverColor, clickFunc)
        local button = vgui.Create("DButton", parent)
        button:SetPos(x, y)
        button:SetSize(w, h)
        button:SetText(text)
        button:SetTextColor(textColor)
        button.bgColor = bgColor
        button.hoverColor = hoverColor
        button.lerp = 0
        
        button.Paint = function(self, w, h)
            local color = LerpColor(self.lerp, self.bgColor, self.hoverColor)
            draw.RoundedBox(8, 0, 0, w, h, color)
        end
        
        button.Think = function(self)
            if self:IsHovered() then
                self.lerp = math.Approach(self.lerp, 1, FrameTime() * 5)
            else
                self.lerp = math.Approach(self.lerp, 0, FrameTime() * 5)
            end
        end
        
        button.DoClick = clickFunc
        
        return button
    end

    local stopButton = createAnimatedButton(
        frame, 
        Scale(10), 
        Scale(Config.UI.FrameSize.height) - Scale(90), 
        stopButtonWidth, 
        stopButtonHeight, 
        stopButtonText, 
        Config.UI.TextColor, 
        Config.UI.CloseButtonColor, 
        Config.UI.CloseButtonHoverColor, 
        function()
            surface.PlaySound("buttons/button6.wav")
            local entity = LocalPlayer().currentRadioEntity
            if not IsValid(entity) then return end

            -- Get actual vehicle entity
            entity = utils.GetVehicle(entity) or entity
            
            -- Send stop request to server
            net.Start("StopCarRadioStation")
                net.WriteEntity(entity)
            net.SendToServer()
            
            -- Clean up local state immediately
            local entIndex = entity:EntIndex()
            StreamManager:CleanupStream(entIndex)
            
            if currentlyPlayingStations[entity] then
                currentlyPlayingStations[entity] = nil
                StateManager:SetState("currentlyPlayingStations", currentlyPlayingStations)
            end
            
            -- Update UI
            populateList(stationListPanel, backButton, searchBox, false)
            if backButton then
                backButton:SetVisible(selectedCountry ~= nil or settingsMenuOpen)
                backButton:SetEnabled(selectedCountry ~= nil or settingsMenuOpen)
            end
        end
    )
    stopButton:SetFont(stopButtonFont)

    local volumePanel = vgui.Create("DPanel", frame)
    volumePanel:SetPos(Scale(20) + stopButtonWidth, Scale(Config.UI.FrameSize.height) - Scale(90))
    volumePanel:SetSize(Scale(Config.UI.FrameSize.width) - Scale(30) - stopButtonWidth, stopButtonHeight)
    volumePanel.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.CloseButtonColor)
    end

    local volumeIconSize = Scale(50)

    local volumeIcon = vgui.Create("DImage", volumePanel)
    volumeIcon:SetPos(Scale(10), (volumePanel:GetTall() - volumeIconSize) / 2)
    volumeIcon:SetSize(volumeIconSize, volumeIconSize)
    volumeIcon:SetMaterial(VOLUME_ICONS.HIGH)

    local function updateVolumeIcon(volumeIcon, value)
        if not IsValid(volumeIcon) then return end
        
        local iconMat
        if type(value) == "function" then
            value = value()
        end
        
        if value < 0.05 then
            iconMat = VOLUME_ICONS.MUTE
        elseif value <= 0.65 then
            iconMat = VOLUME_ICONS.LOW
        else
            iconMat = VOLUME_ICONS.HIGH
        end
        
        if iconMat then
            volumeIcon:SetMaterial(iconMat)
        end
    end

    volumeIcon.Paint = function(self, w, h)
        surface.SetDrawColor(Config.UI.IconColor)
        local mat = self:GetMaterial()
        if mat then
            surface.SetMaterial(mat)
            surface.DrawTexturedRect(0, 0, w, h)
        end
    end

    local entity = LocalPlayer().currentRadioEntity
    local currentVolume = 0.5

    if entityVolumes[entity] then
        currentVolume = entityVolumes[entity]
    else
        local entityConfig = getEntityConfig(entity)
        if entityConfig and entityConfig.Volume then
            currentVolume = type(entityConfig.Volume) == "function" 
                and entityConfig.Volume() 
                or entityConfig.Volume
        end
    end

    currentVolume = math.min(currentVolume, Config.MaxVolume())

    updateVolumeIcon(volumeIcon, currentVolume)
    local volumeSlider = vgui.Create("DNumSlider", volumePanel)
    volumeSlider:SetPos(-Scale(170), Scale(2))
    volumeSlider:SetSize(Scale(Config.UI.FrameSize.width) + Scale(120) - stopButtonWidth, volumePanel:GetTall() - Scale(4))
    volumeSlider:SetText("")
    volumeSlider:SetMin(0)
    volumeSlider:SetMax(Config.MaxVolume())
    volumeSlider:SetDecimals(2)
    volumeSlider:SetValue(currentVolume)

    volumeSlider.Slider.Paint = function(self, w, h)
        local centerY = h/2
        local trackHeight = Scale(12)
        local trackY = centerY - trackHeight/2

        draw.RoundedBox(trackHeight/2, 0, trackY, w, trackHeight, ColorAlpha(Config.UI.VolumeSliderColor, 100))
    end

    volumeSlider.Slider.Knob.Paint = function(self, w, h)
        local knobSize = Scale(24)
        local offset = knobSize/2

        local shadowSize = Scale(2)
        local shadowAlpha = 100
        draw.RoundedBox(knobSize/2, shadowSize, shadowSize, knobSize, knobSize, 
            ColorAlpha(Color(0, 0, 0), shadowAlpha))
        
        -- Main knob
        draw.RoundedBox(knobSize/2, 0, 0, knobSize, knobSize, Config.UI.VolumeKnobColor)
        
        -- Hover effect
        if self:IsHovered() then
            draw.RoundedBox(knobSize/2, 0, 0, knobSize, knobSize, 
                ColorAlpha(Config.UI.TextColor, 20))
        end
    end

    volumeSlider.Slider.Knob:SetSize(Scale(24), Scale(24))
    volumeSlider.Slider.Knob:SetTall(Scale(24))

    volumeSlider.TextArea:SetVisible(false)

    local lastServerUpdate = 0
    volumeSlider.OnValueChanged = function(_, value)
        local entity = LocalPlayer().currentRadioEntity
        if not IsValid(entity) then return end

        value = math.min(value, Config.MaxVolume())
        StreamManager:UpdateStreamVolume(entity:EntIndex(), value)
    end

    local sbar = stationListPanel:GetVBar()
    sbar:SetWide(Scale(8))
    function sbar:Paint(w, h) draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor) end
    function sbar.btnUp:Paint(w, h) draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor) end
    function sbar.btnDown:Paint(w, h) draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor) end
    function sbar.btnGrip:Paint(w, h) draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarGripColor) end

    local buttonSize = Scale(25)
    local topMargin = Scale(7)
    local buttonPadding = Scale(5)

    local closeButton = createAnimatedButton(
        frame, 
        frame:GetWide() - buttonSize - Scale(10), 
        topMargin, 
        buttonSize, 
        buttonSize, 
        "", 
        Config.UI.TextColor, 
        Color(0, 0, 0, 0), 
        Config.UI.ButtonHoverColor, 
        function()
            surface.PlaySound("buttons/lightswitch2.wav")
            frame:Close()
        end
    )
    closeButton.Paint = function(self, w, h)
        surface.SetMaterial(MaterialCache:Get("hud/close.png"))
        surface.SetDrawColor(ColorAlpha(Config.UI.IconColor, 255 * (0.5 + 0.5 * self.lerp)))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    local settingsButton = createAnimatedButton(
        frame, 
        closeButton:GetX() - buttonSize - buttonPadding, 
        topMargin, 
        buttonSize, 
        buttonSize, 
        "", 
        Config.UI.TextColor, 
        Color(0, 0, 0, 0), 
        Config.UI.ButtonHoverColor, 
        function()
            surface.PlaySound("buttons/lightswitch2.wav")
            settingsMenuOpen = true
            openSettingsMenu(currentFrame, backButton)
            backButton:SetVisible(true)
            backButton:SetEnabled(true)
            searchBox:SetVisible(false)
            stationListPanel:SetVisible(false)
        end
    )
    settingsButton.Paint = function(self, w, h)
        surface.SetMaterial(MaterialCache:Get("hud/settings.png"))
        surface.SetDrawColor(ColorAlpha(Config.UI.IconColor, 255 * (0.5 + 0.5 * self.lerp)))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    backButton = createAnimatedButton(
        frame, 
        settingsButton:GetX() - buttonSize - buttonPadding, 
        topMargin, 
        buttonSize, 
        buttonSize, 
        "", 
        Config.UI.TextColor, 
        Color(0, 0, 0, 0), 
        Config.UI.ButtonHoverColor, 
        function()
            surface.PlaySound("ui/buttonrollover.wav")
            
            if settingsMenuOpen then
                settingsMenuOpen = false
                StateManager:SetState("settingsMenuOpen", false)
                if IsValid(settingsFrame) then
                    settingsFrame:Remove()
                    settingsFrame = nil
                end
                
                searchBox:SetVisible(true)
                stationListPanel:SetVisible(true)
                
                local currentCountry = StateManager:GetState("selectedCountry")
                backButton:SetVisible(currentCountry ~= nil)
                backButton:SetEnabled(currentCountry ~= nil)
            else
                local currentCountry = StateManager:GetState("selectedCountry")
                if currentCountry then
                    StateManager:SetState("selectedCountry", nil)
                    StateManager:SetState("favoritesMenuOpen", false)
                    selectedCountry = nil
                    favoritesMenuOpen = false
                    
                    populateList(stationListPanel, backButton, searchBox, true)
                    
                    backButton:SetVisible(false)
                    backButton:SetEnabled(false)
                end
            end
        end
    )
    backButton.Paint = function(self, w, h)
        if self:IsVisible() then
            surface.SetMaterial(MaterialCache:Get("hud/return.png"))
            surface.SetDrawColor(ColorAlpha(Config.UI.IconColor, 255 * (0.5 + 0.5 * self.lerp)))
            surface.DrawTexturedRect(0, 0, w, h)
        end
    end

    backButton:SetVisible((selectedCountry ~= nil and selectedCountry ~= "") or settingsMenuOpen)
    backButton:SetEnabled((selectedCountry ~= nil and selectedCountry ~= "") or settingsMenuOpen)

    if not settingsMenuOpen then
        populateList(stationListPanel, backButton, searchBox, true)
    else
        openSettingsMenu(currentFrame, backButton)
    end

    searchBox.OnChange = function(self)
        populateList(stationListPanel, backButton, searchBox, false)
    end

    _G.openRadioMenu = openRadioMenu
end

-- ------------------------------
--      Hooks and Net Messages
-- ------------------------------

--[[
    Hook: Think
    Opens the car radio menu when the player presses the designated key.
]]
local lastKeyState = false

-- Add at the top with other local variables:
local isProcessingOpen = false
local OPEN_COOLDOWN = 0.2

hook.Add("Think", "OpenCarRadioMenu", function()
    if isProcessingOpen then return end
    
    local openKey = GetConVar("car_radio_open_key"):GetInt()
    local ply = LocalPlayer()

    if not IsValid(ply) or not openKey then return end
    if ply:IsTyping() then return end

    local currentKeyState = input.IsKeyDown(openKey)
    
    -- Only trigger on key press, not hold
    if currentKeyState == lastKeyState then return end
    lastKeyState = currentKeyState
    
    -- Only handle key press, not release
    if not currentKeyState then return end

    local currentTime = CurTime()
    local lastPress = StateManager:GetState("lastKeyPress", 0)
    
    if (currentTime - lastPress) <= OPEN_COOLDOWN then return end
    StateManager:SetState("lastKeyPress", currentTime)

    -- Handle closing if menu is open
    if StateManager:GetState("radioMenuOpen") and not isSearching then
        surface.PlaySound("buttons/lightswitch2.wav")
        if IsValid(currentFrame) then
            currentFrame:Close()
        end
        return
    end

    -- Only handle vehicle radio here, boombox is handled by network message
    local currentSeat = ply:GetVehicle()
    if not IsValid(currentSeat) then return end

    local actualVehicle = utils.GetVehicle(currentSeat)
    if not actualVehicle or not utils.canUseRadio(actualVehicle) then return end

    isProcessingOpen = true
    ply.currentRadioEntity = actualVehicle
    StateManager:SetState("currentRadioEntity", actualVehicle)
    
    timer.Simple(0, function()
        if not StateManager:GetState("radioMenuOpen") then
            openRadioMenu()
        end
        timer.Simple(OPEN_COOLDOWN, function()
            isProcessingOpen = false
        end)
    end)
end)

--[[
    Network Receiver: UpdateRadioStatus
    Updates the status of the boombox.
]]
net.Receive("UpdateRadioStatus", function()
    local entity = net.ReadEntity()
    local stationName = net.ReadString()
    local displayName = truncateStationName(stationName)
    local isPlaying = net.ReadBool()
    local status = net.ReadString()

    if not IsValid(entity) then return end

    -- Update local state
    local statusData = {
        stationStatus = status,
        stationName = stationName,
        displayName = displayName,
        isPlaying = isPlaying
    }

    BoomboxStatuses[entity:EntIndex()] = statusData
    StateManager:SetState("boomboxStatuses", BoomboxStatuses)

    -- Update entity networked vars
    entity:SetNWString("Status", status)
    entity:SetNWString("StationName", stationName)
    entity:SetNWBool("IsPlaying", isPlaying)

    if status == "playing" then
        currentlyPlayingStations[entity] = { name = stationName }
        StateManager:SetState("currentlyPlayingStations", currentlyPlayingStations)
    elseif status == "stopped" then
        currentlyPlayingStations[entity] = nil
        StateManager:SetState("currentlyPlayingStations", currentlyPlayingStations)
    end

    -- Emit status change event
    StateManager:Emit(StateManager.Events.RADIO_STATUS_CHANGED, entity, statusData)
end)

--[[
    Network Receiver: PlayCarRadioStation
    Handles playing a radio station on the client.
]]
net.Receive("PlayCarRadioStation", function()
    if not streamsEnabled then return end
    
    local entity = net.ReadEntity()
    if not IsValid(entity) then return end

    -- Get actual vehicle entity if needed
    entity = utils.GetVehicle(entity) or entity
    if not IsValid(entity) then return end

    local entIndex = entity:EntIndex()
    local stationName = net.ReadString()
    local url = net.ReadString()
    local volume = net.ReadFloat()

    utils.DebugPrint("Received PlayCarRadioStation", 
        "\nEntity:", entity,
        "\nClass:", entity:GetClass(),
        "\nStation:", stationName,
        "\nURL:", url,
        "\nVolume:", volume)

    -- Update local state immediately
    if not BoomboxStatuses[entIndex] then
        BoomboxStatuses[entIndex] = {}
    end
    BoomboxStatuses[entIndex] = {
        stationStatus = "playing",
        stationName = stationName,
        url = url
    }

    sound.PlayURL(url, "3d", function(station, errorID, errorName)
        if not IsValid(station) then
            print("[Radio] Error creating sound stream:", errorName)
            utils.playErrorSound("connection")
            if IsValid(entity) then
                utils.clearRadioStatus(entity)
            end
            return
        end
        
        if not IsValid(entity) then
            station:Stop()
            utils.playErrorSound("connection")
            return
        end

        -- Register with StreamManager
        if not StreamManager:CreateStream(entity, {
            name = stationName,
            url = url,
            volume = volume,
            startTime = CurTime()
        }) then
            station:Stop()
            return
        end

        -- Configure sound
        station:SetPos(entity:GetPos())
        station:SetVolume(volume)
        station:Play()
    end)
end)

-- Update the stop handler
net.Receive("StopCarRadioStation", function()
    local entity = net.ReadEntity()
    if not IsValid(entity) then return end
    
    -- Get the actual vehicle entity
    entity = utils.GetVehicle(entity) or entity
    if not IsValid(entity) then return end

    -- Clean up through StreamManager
    local entIndex = entity:EntIndex()
    StreamManager:CleanupStream(entIndex)
    
    -- Clear local state
    if currentlyPlayingStations[entity] then
        currentlyPlayingStations[entity] = nil
        StateManager:SetState("currentlyPlayingStations", currentlyPlayingStations)
    end
    
    -- Clear status for boomboxes
    if utils.IsBoombox(entity) then
        utils.clearRadioStatus(entity)
    end
end)

local function cleanupRadioMenu()
    if IsValid(currentFrame) then
        currentFrame:Remove()
        currentFrame = nil
    end
    radioMenuOpen = false
    selectedCountry = nil
    settingsMenuOpen = false
    favoritesMenuOpen = false
    StateManager:SetState("settingsMenuOpen", false)
    StateManager:SetState("selectedCountry", nil)
    StateManager:SetState("favoritesMenuOpen", false)
end

--[[
    Network Receiver: OpenRadioMenu
    Opens the radio menu for a given entity.
]]
net.Receive("OpenRadioMenu", function()
    if isProcessingOpen then return end
    
    local ent = net.ReadEntity()
    if not IsValid(ent) then return end

    local ply = LocalPlayer()
    local currentTime = CurTime()

    if ent:GetClass() == "boombox" or ent:GetClass() == "golden_boombox" then
        -- Validate interaction permissions
        if utils.canInteractWithBoombox(ply, ent) then
            isProcessingOpen = true
            ply.currentRadioEntity = ent
            StateManager:SetState("currentRadioEntity", ent)
            
            timer.Simple(0, function()
                if not StateManager:GetState("radioMenuOpen") then
                    openRadioMenu()
                end
                timer.Simple(OPEN_COOLDOWN, function()
                    isProcessingOpen = false
                end)
            end)
        else
            -- Show unauthorized UI instead of just a chat message
            if currentTime - lastPermissionMessage >= PERMISSION_MESSAGE_COOLDOWN then
                chat.AddText(Color(255, 0, 0), "You don't have permission to interact with this boombox.")
                lastPermissionMessage = currentTime
                StateManager:SetState("lastPermissionMessage", currentTime)
                
                -- Open unauthorized UI
                openUnauthorizedUI(ent)
            end
        end
    end
end)

net.Receive("RadioConfigUpdate", function()
    -- Update all active radio volumes with validation
    for entIndex, streamData in pairs(StreamManager._streams) do -- Changed from activeStreams to _streams
        if StreamManager:IsValid(entIndex) then
            local entity = streamData.entity
            if IsValid(entity) then
                local entityConfig = utils.GetEntityConfig(entity)
                if utils.entityConfig then
                    local volume = ClampVolume(entityVolumes[entity] or entityConfig.Volume())
                    StreamManager:UpdateStreamVolume(entIndex, volume)
                end
            end
        end
    end
    
    -- Update station count after cleanup
    StateManager:SetState("activeStationCount", updateStationCount())
end)

-- ------------------------------
--      Cleanup Hooks
-- ------------------------------

-- Entity cleanup
hook.Add("EntityRemoved", "RadioCleanup", function(entity)
    if IsValid(entity) then
        StreamManager:CleanupStream(entity:EntIndex())
    end
end)

-- Vehicle state cleanup
hook.Add("VehicleChanged", "RadioVehicleCleanup", function(ply, old, new)
    if ply ~= LocalPlayer() then return end
    
    if not new then
        ply.currentRadioEntity = nil
        StateManager:SetState("currentRadioEntity", nil)
        return
    end

    -- Get actual vehicle entity
    local actualVehicle = utils.GetVehicle(new)
    if actualVehicle then
        ply.currentRadioEntity = actualVehicle
        StateManager:SetState("currentRadioEntity", actualVehicle)
    end
end)

-- Periodic validation
timer.Create("RadioStateValidation", 30, 0, function()
    -- Update reference from activeStreams to _streams
    for entIndex, streamData in pairs(StreamManager._streams) do
        if not IsValid(streamData.entity) or not IsValid(streamData.stream) then
            StreamManager:CleanupStream(entIndex)
        end
    end
end)

StateManager:On(StateManager.Events.FAVORITES_LOADED, function(data)
    favoriteCountries = data.countries
    favoriteStations = data.stations
end)

-- Initialize theme
local function initializeTheme()
    local themeName = GetConVar("radio_theme"):GetString()
    if themeModule.themes[themeName] and themeModule.factory:validateTheme(themeModule.themes[themeName]) then
        Config.UI = themeModule.themes[themeName]
    else
        -- Fallback to default theme
        Config.UI = themeModule.factory:getDefaultThemeData()
        RunConsoleCommand("radio_theme", themeModule.factory:getDefaultTheme())
    end
end

hook.Add("Initialize", "InitializeRadioTheme", initializeTheme)

hook.Add("Think", "UpdateStreamPositions", function()
    local currentTime = CurTime()
    
    if (currentTime - lastStreamUpdate) < STREAM_UPDATE_INTERVAL then
        return
    end
    
    lastStreamUpdate = currentTime

    local ply = LocalPlayer()
    local plyPos = ply:GetPos()

    -- Cache IsValid results at start
    local validStreams = {}
    for entIndex, streamData in pairs(StreamManager._streams) do
        if IsValid(streamData.entity) and IsValid(streamData.stream) then
            validStreams[entIndex] = streamData
        else
            StreamManager:QueueCleanup(entIndex, "invalid_reference")
        end
    end

    for entIndex, streamData in pairs(validStreams) do
        local entity = streamData.entity
        local stream = streamData.stream
        
        stream:SetPos(entity:GetPos())
        
        local distanceSqr = plyPos:DistToSqr(entity:GetPos())
        local isPlayerInCar = false
        
        if entity:IsVehicle() then
            local vehicle = utils.GetVehicle(entity)
            isPlayerInCar = (vehicle:GetDriver() == ply)
        end
        
        updateRadioVolume(stream, distanceSqr, isPlayerInCar, entity)
    end
end)

local function initializeNetworking()
    net.Receive("CarRadioMessage", function()
        local vehicle = net.ReadEntity()
        local isValid = net.ReadBool()
        
        utils.DebugPrint("Received CarRadioMessage:",
        "\nVehicle:", IsValid(vehicle) and vehicle:GetClass() or "invalid",
        "\nValidation Flag:", isValid)
    
        if not isValid then
            return
        end

        playCarEnterAnim()
    end)
end

hook.Add("InitPostEntity", "RadioInitializeNetworking", initializeNetworking)
hook.Add("OnReloaded", "RadioInitializeNetworking", initializeNetworking)

hook.Add("Think", "UpdateStreamValidityCache", function()
    if StreamManager then
        StreamManager:UpdateValidityCache()
    end
end)

hook.Add("Think", "UpdateUIReferences", function()
    if UIReferenceTracker then
        UIReferenceTracker:Update()
    end
end)

hook.Add("Think", "RadioAnimationsThink", function()
    if Misc and Misc.Animations then
        Misc.Animations:Think()
    end
end)

-- Stream event handlers
StreamManager:On(StreamManager.Events.STREAM_STARTED, function(entity, data)
    if not IsValid(entity) then return end
    
    -- Update entity state
    entity:SetNWString("Status", "playing")
    entity:SetNWString("StationName", data.name)
    entity:SetNWBool("IsPlaying", true)
    
    -- Update UI if needed
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
    
    -- Update state
    StateManager:SetState("currentlyPlayingStations", {
        [entity] = { name = data.name, url = data.url }
    })
    
    -- Emit state change event
    StateManager:Emit(StateManager.Events.RADIO_STATUS_CHANGED, {
        entity = entity,
        status = "playing",
        station = data.name
    })
end)

StreamManager:On(StreamManager.Events.STREAM_STOPPED, function(entity)
    if not IsValid(entity) then return end
    
    -- Update entity state
    entity:SetNWString("Status", "stopped")
    entity:SetNWString("StationName", "")
    entity:SetNWBool("IsPlaying", false)
    
    -- Update UI if needed
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
    
    -- Update state
    local currentStations = StateManager:GetState("currentlyPlayingStations") or {}
    currentStations[entity] = nil
    StateManager:SetState("currentlyPlayingStations", currentStations)
    
    -- Emit state change event
    StateManager:Emit(StateManager.Events.RADIO_STATUS_CHANGED, {
        entity = entity,
        status = "stopped"
    })
end)

StreamManager:On(StreamManager.Events.STREAM_ERROR, function(entity, errorID, errorName)
    if not IsValid(entity) then return end
    
    -- Update entity state
    entity:SetNWString("Status", "error")
    
    -- Play error sound and notify user
    utils.playErrorSound("connection")
    chat.AddText(Color(255, 0, 0), 
        string.format("[Radio] Error playing station: %s", errorName))
    
    -- Update UI if needed
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
    
    -- Emit error event
    StateManager:Emit(StateManager.Events.RADIO_STATUS_CHANGED, {
        entity = entity,
        status = "error",
        error = errorName
    })
end)

-- State event handlers
StateManager:On(StateManager.Events.RADIO_STATUS_CHANGED, function(data)
    if not data.entity then return end
    
    -- Update UI elements
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
end)

StateManager:On(StateManager.Events.FAVORITES_CHANGED, function(data)
    -- Update local references
    favoriteCountries = StateManager:GetState("favoriteCountries") or {}
    favoriteStations = StateManager:GetState("favoriteStations") or {}
    
    -- Update UI if needed
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
end)

StateManager:On(StateManager.Events.VOLUME_CHANGED, function(data)
    if not data.entity then return end
    
    -- Update volume UI if needed
    if IsValid(volumeSlider) and data.entity == LocalPlayer().currentRadioEntity then
        volumeSlider:SetValue(data.volume)
    end
    
    -- Update volume icon
    if IsValid(volumeIcon) then
        updateVolumeIcon(volumeIcon, data.volume)
    end
end)

StateManager:On(StateManager.Events.BOOMBOX_MUTE_CHANGED, function(data)
    if not data.entity then return end
    
    -- Update mute button if needed
    if IsValid(muteButton) and data.entity == LocalPlayer().currentRadioEntity then
        muteButton:SetText(data.muted and "Unmute" or "Mute")
    end
    
    -- Update volume display
    if data.muted then
        if IsValid(volumeIcon) then
            volumeIcon:SetMaterial(VOLUME_ICONS.MUTE)
        end
    else
        local volume = entityVolumes[data.entity] or 0.5
        if IsValid(volumeIcon) then
            updateVolumeIcon(volumeIcon, volume)
        end
    end
end)

-- Network event handlers
net.Receive("RadioConfigUpdate", function()
    for entIndex, streamData in pairs(StreamManager._streams) do
        if StreamManager:IsValid(entIndex) then
            local entity = streamData.entity
            if IsValid(entity) then
                local entityConfig = utils.getEntityConfig(entity)
                if entityConfig then
                    local volume = ClampVolume(entityVolumes[entity] or entityConfig.Volume())
                    StreamManager:UpdateStreamVolume(entIndex, volume)
                end
            end
        end
    end
    
    -- Update UI if needed
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
end)

local function updateUI()
    local playingStations = StreamManager:GetPlayingStations()
    local streamStates = StreamManager:GetAllStreamStates()

    -- Update UI based on stream states
    if IsValid(currentFrame) then
        populateList(stationListPanel, backButton, searchBox, false)
    end
end

-- Update event handlers
StreamManager:On(StreamManager.Events.STATE_CHANGED, function(data)
    updateUI()
end)

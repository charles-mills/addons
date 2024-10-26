-- Include shared and client-side configurations and utilities
include("radio/shared/sh_config.lua")
local LanguageManager = include("radio/client/lang/cl_language_manager.lua")
local Misc = include("radio/client/cl_misc.lua")
local Utils = include("radio/shared/sh_utils.lua")

-- Initialize variables and tables
BoomboxStatuses = BoomboxStatuses or {}
local favoriteCountries = {}
local favoriteStations = {}
local dataDir = "rradio"
local favoriteCountriesFile = dataDir .. "/favorite_countries.json"
local favoriteStationsFile = dataDir .. "/favorite_stations.json"

if not file.IsDir(dataDir, "DATA") then
    file.CreateDir(dataDir)
end

local currentFrame = nil
local settingsMenuOpen = false
local selectedCountry = nil
local radioMenuOpen = false
local currentRadioSources = {}
local lastMessageTime = -math.huge
local lastStationSelectTime = 0
local currentlyPlayingStations = {}
local stationDataLoaded = false
local entityVolumes = {}
local openRadioMenu
StationData = StationData or {}

-- RadioSourceManager handles active radio sources and their statuses
local RadioSourceManager = {
    activeSources = {},
    sourceStatuses = {},

    -- Adds a new radio source
    addSource = function(self, entity, station, stationName)
        if not IsValid(entity) or not IsValid(station) then
            return
        end

        local entIndex = entity:EntIndex()
        self.activeSources[entIndex] = {
            entity = entity,
            station = station,
            volume = entityVolumes[entity] or 0.5
        }
        self:setStatus(entity, "playing", stationName)
    end,

    -- Removes an existing radio source
    removeSource = function(self, entity)
        if not IsValid(entity) then
            return
        end

        local entIndex = entity:EntIndex()
        self.activeSources[entIndex] = nil
        self:setStatus(entity, "stopped", "")
    end,

    -- Sets the status of a radio source
    setStatus = function(self, entity, status, stationName)
        if not IsValid(entity) then
            return
        end

        local entIndex = entity:EntIndex()
        self.sourceStatuses[entIndex] = {
            stationStatus = status,
            stationName = stationName or ""
        }
    end,

    -- Updates all active radio sources
    updateSources = function(self)
        local player = LocalPlayer()
        if not IsValid(player) then
            return
        end

        local playerPos = player:GetPos()

        for entIndex, sourceData in pairs(self.activeSources) do
            if not IsValid(sourceData.entity) or not IsValid(sourceData.station) then
                self:removeSource(sourceData.entity)
                continue
            end

            sourceData.station:SetPos(sourceData.entity:GetPos())
            local distanceSqr = playerPos:DistToSqr(sourceData.entity:GetPos())
            local isPlayerInCar = player:GetVehicle() == sourceData.entity or
                                  (IsValid(player:GetVehicle()) and player:GetVehicle():GetParent() == sourceData.entity)

            if Utils:getEntityConfig(sourceData.entity) then
                updateRadioVolume(sourceData.station, distanceSqr, isPlayerInCar, sourceData.entity)
            end
        end
    end,

    -- Cleans up all active radio sources
    cleanup = function(self)
        for entIndex, sourceData in pairs(self.activeSources) do
            if IsValid(sourceData.station) then
                sourceData.station:Stop()
            end
        end
        self.activeSources = {}
        self.sourceStatuses = {}
    end
}

-- Expose certain variables globally for client-side access
if CLIENT then
    _G.BoomboxStatuses = BoomboxStatuses
    _G.favoriteCountries = favoriteCountries
    _G.favoriteStations = favoriteStations
    _G.RadioSourceManager = RadioSourceManager
    _G.loadFavorites = loadFavorites
    _G.saveFavorites = saveFavorites
    _G.LerpColor = LerpColor
    _G.calculateFontSizeForStopButton = calculateFontSizeForStopButton
end

-- LerpColor interpolates between two colors based on a parameter t
local function LerpColor(t, col1, col2)
    return Color(
        Lerp(t, col1.r, col2.r),
        Lerp(t, col1.g, col2.g),
        Lerp(t, col1.b, col2.b),
        Lerp(t, col1.a or 255, col2.a or 255)
    )
end

-- Attempts to reopen the radio menu after a delay
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

-- Loads favorite countries and stations from JSON files
local function loadFavorites()
    if file.Exists(favoriteCountriesFile, "DATA") then
        local content = file.Read(favoriteCountriesFile, "DATA")
        favoriteCountries = util.JSONToTable(content) or {}
    end

    if file.Exists(favoriteStationsFile, "DATA") then
        local content = file.Read(favoriteStationsFile, "DATA")
        favoriteStations = util.JSONToTable(content) or {}
    end
end

-- Saves favorite countries and stations to JSON files
local function saveFavorites()
    file.Write(favoriteCountriesFile, util.TableToJSON(favoriteCountries))
    file.Write(favoriteStationsFile, util.TableToJSON(favoriteStations))
end

-- Creates necessary fonts for the UI
local function createFonts()
    surface.CreateFont("Roboto18", {
        font = "Roboto",
        size = ScreenScale(5),
        weight = 500
    })

    surface.CreateFont("HeaderFont", {
        font = "Roboto",
        size = ScreenScale(8),
        weight = 700
    })
end

createFonts()

-- Scales UI elements based on performance settings
local function Scale(value)
    return UIPerformance:GetScale(value)
end

-- CountryNameCache handles caching of country names in different languages
local CountryNameCache = {
    cache = {},
    defaultLang = "en",
    lastLang = GetConVar("radio_language"):GetString() or "en",

    -- Creates a key for caching
    makeKey = function(self, name, lang)
        return {
            country = name,
            lang = lang or self.defaultLang
        }
    end,

    -- Retrieves a cached country name
    get = function(self, name, lang)
        lang = lang or self.defaultLang
        return self.cache[name] and self.cache[name][lang]
    end,

    -- Sets a cached country name
    set = function(self, name, lang, value)
        lang = lang or self.defaultLang
        if not self.cache[name] then
            self.cache[name] = {}
        end
        self.cache[name][lang] = value
    end,

    -- Clears cached country names
    clear = function(self, name, lang)
        if lang then
            if self.cache[name] then
                self.cache[name][lang] = nil
            end
        else
            self.cache[name] = nil
        end
    end,

    -- Clears all cached names for a specific language
    clearLanguage = function(self, lang)
        for country, translations in pairs(self.cache) do
            translations[lang] = nil
            if table.IsEmpty(translations) then
                self.cache[country] = nil
            end
        end
    end,

    -- Pre-caches country names
    preCache = function(self, countries, lang)
        lang = lang or self.defaultLang
        for _, country in pairs(countries) do
            if not self:get(country, lang) then
                local translatedName = LanguageManager:GetCountryTranslation(lang, country)
                if translatedName and translatedName ~= "" then
                    self:set(country, lang, translatedName)
                end
            end
        end
    end
}

-- Formats the country name based on the current language
local function formatCountryName(name)
    local lang = GetConVar("radio_language"):GetString() or "en"
    local cached = CountryNameCache:get(name, lang)
    if cached then
        return cached
    end

    local translatedName = LanguageManager:GetCountryTranslation(lang, name)
    if not translatedName or translatedName == "" then
        translatedName = name
    end
    CountryNameCache:set(name, lang, translatedName)
    return translatedName
end

-- Updates the volume of a radio station based on distance and other factors
local function updateRadioVolume(station, distanceSqr, isPlayerInCar, entity)
    local entityConfig = Utils:getEntityConfig(entity)
    if not entityConfig then
        return
    end

    local volume = entityVolumes[entity] or entityConfig.Volume
    if volume <= 0.02 then
        station:SetVolume(0)
        return
    end

    local maxVolume = GetConVar("radio_max_volume"):GetFloat()
    local effectiveVolume = math.min(volume, maxVolume)
    local minVolumeDistance = entityConfig.MinVolumeDistance or 0
    local maxHearingDistance = entityConfig.MaxHearingDistance or 1000
    local distance = math.sqrt(distanceSqr)

    if isPlayerInCar then
        station:SetVolume(effectiveVolume)
    else
        if distance <= minVolumeDistance then
            station:SetVolume(effectiveVolume)
        elseif distance <= maxHearingDistance then
            local exponent = Config.VolumeAttenuationExponent or 1
            local attenuationFactor = ((maxHearingDistance - distance) / (maxHearingDistance - minVolumeDistance)) ^ exponent
            attenuationFactor = math.Clamp(attenuationFactor, 0, 1)
            local adjustedVolume = effectiveVolume * attenuationFactor
            station:SetVolume(adjustedVolume)
        else
            station:SetVolume(0)
        end
    end
end

-- Displays a message to the player about the car radio
local function PrintCarRadioMessage()
    if not GetConVar("car_radio_show_messages"):GetBool() then
        return
    end

    local vehicle = LocalPlayer():GetVehicle()
    if not Utils:isValidRadioEntity(vehicle) then
        return
    end

    local currentTime = CurTime()
    if (currentTime - lastMessageTime) < Config.MessageCooldown and lastMessageTime ~= -math.huge then
        return
    end

    lastMessageTime = currentTime
    local openKey = GetConVar("car_radio_open_key"):GetInt()
    local keyName = Misc.KeyNames:GetKeyName(openKey)
    local message = Config.Lang["PressKeyToOpen"]:gsub("{key}", keyName)
    chat.AddText(Color(0, 255, 128), "[CAR RADIO] ", Color(255, 255, 255), message)
end

-- Calculates the appropriate font size for the stop button based on button dimensions
local function calculateFontSizeForStopButton(text, buttonWidth, buttonHeight)
    local maxFontSize = buttonHeight * 0.7
    local fontName = "DynamicStopButtonFont"
    surface.CreateFont(fontName, {
        font = "Roboto",
        size = maxFontSize,
        weight = 700
    })

    surface.SetFont(fontName)
    local textWidth = surface.GetTextSize(text)
    while textWidth > buttonWidth * 0.9 and maxFontSize > 10 do
        maxFontSize = maxFontSize - 1
        surface.CreateFont(fontName, {
            font = "Roboto",
            size = maxFontSize,
            weight = 700
        })

        surface.SetFont(fontName)
        textWidth = surface.GetTextSize(text)
    end

    return fontName
end

-- Creates a star icon for favoriting countries
local function createStarIcon(parent, country, updateList)
    local starIcon = vgui.Create("DImageButton", parent)
    starIcon:SetSize(Scale(24), Scale(24))
    starIcon:SetPos(Scale(8), (Scale(40) - Scale(24)) / 2)

    if favoriteCountries[country] then
        starIcon:SetImage("hud/star_full.png")
    else
        starIcon:SetImage("hud/star.png")
    end

    starIcon.DoClick = function()
        favoriteCountries[country] = not favoriteCountries[country]
        if not favoriteCountries[country] then
            favoriteCountries[country] = nil
        end
        saveFavorites()

        if favoriteCountries[country] then
            starIcon:SetImage("hud/star_full.png")
        else
            starIcon:SetImage("hud/star.png")
        end

        if updateList then
            updateList()
        end
    end

    return starIcon
end

-- Creates a star icon for favoriting stations
local function createStationStarIcon(parent, country, station, updateList)
    local starIcon = vgui.Create("DImageButton", parent)
    starIcon:SetSize(Scale(24), Scale(24))
    starIcon:SetPos(Scale(8), (Scale(40) - Scale(24)) / 2)

    if favoriteStations[country] and favoriteStations[country][station.name] then
        starIcon:SetImage("hud/star_full.png")
    else
        starIcon:SetImage("hud/star.png")
    end

    starIcon.DoClick = function()
        if not favoriteStations[country] then
            favoriteStations[country] = {}
        end

        favoriteStations[country][station.name] = not favoriteStations[country][station.name]
        if not favoriteStations[country][station.name] then
            favoriteStations[country][station.name] = nil
        end

        if next(favoriteStations[country]) == nil then
            favoriteStations[country] = nil
        end

        saveFavorites()

        if favoriteStations[country] and favoriteStations[country][station.name] then
            starIcon:SetImage("hud/star_full.png")
        else
            starIcon:SetImage("hud/star.png")
        end

        if updateList then
            updateList()
        end
    end

    return starIcon
end

-- Loads station data from data files
local function LoadStationData()
    if stationDataLoaded then
        return
    end

    local dataFiles = file.Find("radio/client/stations/data_*.lua", "LUA")
    local countries = {}

    for _, filename in ipairs(dataFiles) do
        local data = include("radio/client/stations/" .. filename)
        for country, stations in pairs(data) do
            local baseCountry = country:gsub("_(%d+)$", "")
            if not StationData[baseCountry] then
                StationData[baseCountry] = {}
                table.insert(countries, baseCountry)
            end

            for _, station in ipairs(stations) do
                table.insert(StationData[baseCountry], {
                    name = station.n,
                    url = station.u
                })
            end
        end
    end

    CountryNameCache:preCache(countries)
    stationDataLoaded = true
end

-- Populates the station list panel based on the selected country and search filter
local function populateList(stationListPanel, backButton, searchBox, resetSearch)
    local currentLang = GetConVar("radio_language"):GetString() or "en"
    if currentLang ~= CountryNameCache.lastLang then
        CountryNameCache:clearLanguage(CountryNameCache.lastLang)
        CountryNameCache.lastLang = currentLang

        local countries = {}
        for country, _ in pairs(StationData) do
            table.insert(countries, country)
        end

        CountryNameCache:preCache(countries, currentLang)
    end

    if not stationListPanel then
        return
    end

    stationListPanel:Clear()
    if resetSearch then
        searchBox:SetText("")
    end

    local filterText = searchBox:GetText():lower()
    local function updateList()
        populateList(stationListPanel, backButton, searchBox, false)
    end

    if selectedCountry == nil then
        local countries = {}
        for country, _ in pairs(StationData) do
            local translatedCountry = formatCountryName(country)
            if filterText == "" or translatedCountry:lower():find(filterText, 1, true) then
                table.insert(countries, {
                    original = country,
                    translated = translatedCountry,
                    isPrioritized = favoriteCountries[country]
                })
            end
        end

        table.sort(countries, function(a, b)
            if a.isPrioritized ~= b.isPrioritized then
                return a.isPrioritized
            end
            return a.translated < b.translated
        end)

        for _, country in ipairs(countries) do
            local countryButton = vgui.Create("DButton", stationListPanel)
            countryButton:Dock(TOP)
            countryButton:DockMargin(Scale(5), Scale(5), Scale(5), 0)
            countryButton:SetTall(Scale(40))
            countryButton:SetText(country.translated)
            countryButton:SetFont("Roboto18")
            countryButton:SetTextColor(Config.UI.TextColor)
            countryButton.Paint = function(self, w, h)
                draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
                if self:IsHovered() then
                    draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonHoverColor)
                end
            end

            createStarIcon(countryButton, country.original, updateList)

            countryButton.DoClick = function()
                surface.PlaySound("buttons/button3.wav")
                selectedCountry = country.original
                if backButton then
                    backButton:SetVisible(true)
                end
                populateList(stationListPanel, backButton, searchBox, true)
            end
        end

        if backButton then
            backButton:SetVisible(false)
            backButton:SetEnabled(false)
        end
    else
        local stations = StationData[selectedCountry] or {}
        local favoriteStationsList = {}

        for _, station in ipairs(stations) do
            if station and station.name and (filterText == "" or station.name:lower():find(filterText, 1, true)) then
                local isFavorite = favoriteStations[selectedCountry] and favoriteStations[selectedCountry][station.name]
                table.insert(favoriteStationsList, {
                    station = station,
                    favorite = isFavorite
                })
            end
        end

        table.sort(favoriteStationsList, function(a, b)
            if a.favorite ~= b.favorite then
                return a.favorite
            end
            return (a.station.name or "") < (b.station.name or "")
        end)

        for _, stationData in ipairs(favoriteStationsList) do
            local station = stationData.station
            local stationButton = vgui.Create("DButton", stationListPanel)
            stationButton:Dock(TOP)
            stationButton:DockMargin(Scale(5), Scale(5), Scale(5), 0)
            stationButton:SetTall(Scale(40))
            stationButton:SetText(station.name)
            stationButton:SetFont("Roboto18")
            stationButton:SetTextColor(Config.UI.TextColor)
            stationButton.Paint = function(self, w, h)
                local entity = LocalPlayer().currentRadioEntity
                if IsValid(entity) and station == currentlyPlayingStations[entity] then
                    draw.RoundedBox(8, 0, 0, w, h, Config.UI.PlayingButtonColor)
                else
                    draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonColor)
                    if self:IsHovered() then
                        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ButtonHoverColor)
                    end
                end
            end

            createStationStarIcon(stationButton, selectedCountry, station, updateList)

            stationButton.DoClick = function()
                local currentTime = CurTime()
                if currentTime - lastStationSelectTime < 2 then
                    return
                end

                surface.PlaySound("buttons/button17.wav")
                local entity = LocalPlayer().currentRadioEntity
                if not IsValid(entity) then
                    return
                end

                if currentlyPlayingStations[entity] then
                    net.Start("StopCarRadioStation")
                    net.WriteEntity(entity)
                    net.SendToServer()
                end

                local volume = entityVolumes[entity] or (Utils:getEntityConfig(entity) and Utils:getEntityConfig(entity).Volume) or 0.5
                net.Start("PlayCarRadioStation")
                net.WriteEntity(entity)
                net.WriteString(station.name)
                net.WriteString(station.url)
                net.WriteFloat(volume)
                net.SendToServer()
                currentlyPlayingStations[entity] = station
                lastStationSelectTime = currentTime
                populateList(stationListPanel, backButton, searchBox, false)
            end
        end

        if backButton then
            backButton:SetVisible(true)
            backButton:SetEnabled(true)
        end
    end
end

-- Opens the settings menu within the radio UI
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

    -- Adds a header label to the scroll panel
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

    -- Adds a dropdown menu to the scroll panel
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
        dropdown:DockMargin(0, Scale(5), Scale(10), Scale(5))
        dropdown:SetValue(currentValue)
        dropdown:SetTextColor(Config.UI.TextColor)
        dropdown:SetFont("Roboto18")
        dropdown.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Config.UI.SearchBoxColor)
            self:DrawTextEntryText(Config.UI.TextColor, Config.UI.ButtonHoverColor, Config.UI.TextColor)
        end

        for _, choice in ipairs(choices) do
            dropdown:AddChoice(choice.name, choice.data)
        end

        dropdown.OnSelect = onSelect
        return dropdown
    end

    -- Adds a checkbox to the scroll panel
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
            RunConsoleCommand(convar, value and "1" or "0")
        end

        return checkbox
    end

    -- Add headers and UI elements for settings
    addHeader(Config.Lang["ThemeSelection"] or "Theme Selection", true)
    local themeChoices = {}
    if Misc.Themes then
        for themeName, _ in pairs(Misc.Themes.list) do
            table.insert(themeChoices, {
                name = themeName:gsub("^%l", string.upper),
                data = themeName
            })
        end
    end

    local currentTheme = GetConVar("radio_theme"):GetString()
    local currentThemeName = currentTheme:gsub("^%l", string.upper)
    addDropdown(Config.Lang["SelectTheme"] or "Select Theme", themeChoices, currentThemeName, function(_, _, value)
        local lowerValue = value:lower()
        if Misc.Themes and Misc.Themes.list[lowerValue] then
            RunConsoleCommand("radio_theme", lowerValue)
            Config.UI = Misc.Themes.list[lowerValue]
            parentFrame:Close()
            reopenRadioMenu(true)
        end
    end)

    addHeader(Config.Lang["LanguageSelection"] or "Language Selection")
    local languageChoices = {}
    for code, name in pairs(LanguageManager:GetAvailableLanguages()) do
        table.insert(languageChoices, {
            name = name,
            data = code
        })
    end

    local currentLanguage = GetConVar("radio_language"):GetString()
    local currentLanguageName = LanguageManager:GetLanguageName(currentLanguage)
    addDropdown(Config.Lang["SelectLanguage"] or "Select Language", languageChoices, currentLanguageName, function(_, _, _, data)
        RunConsoleCommand("radio_language", data)
        LanguageManager:SetLanguage(data)
        Config.Lang = LanguageManager.translations[data]
        parentFrame:Close()
        reopenRadioMenu(true)
    end)

    addHeader(Config.Lang["SelectKeyToOpenRadioMenu"] or "Select Key to Open Radio Menu")
    local keyChoices = {}
    if Misc.KeyNames then
        for keyCode, keyName in pairs(Misc.KeyNames.mapping) do
            table.insert(keyChoices, {
                name = keyName,
                data = keyCode
            })
        end

        table.sort(keyChoices, function(a, b)
            return a.name < b.name
        end)
    else
        table.insert(keyChoices, {
            name = "K",
            data = KEY_K
        })
    end

    local currentKey = GetConVar("car_radio_open_key"):GetInt()
    local currentKeyName = (Misc.KeyNames and Misc.KeyNames.mapping[currentKey]) or "K"
    addDropdown(Config.Lang["SelectKey"] or "Select Key", keyChoices, currentKeyName, function(_, _, _, data)
        RunConsoleCommand("car_radio_open_key", data)
    end)

    addHeader(Config.Lang["GeneralOptions"] or "General Options")
    addCheckbox(Config.Lang["ShowCarMessages"] or "Show Car Radio Messages", "car_radio_show_messages")
    addCheckbox(Config.Lang["ShowBoomboxHUD"] or "Show Boombox Hover Text", "boombox_show_text")

    if LocalPlayer():IsSuperAdmin() then
        local currentEntity = LocalPlayer().currentRadioEntity
        local isBoombox = IsValid(currentEntity) and (currentEntity:GetClass() == "boombox")
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

    -- Footer with GitHub link and contribution prompt
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
    githubIcon:SetImage("hud/github.png")
    githubIcon.Paint = function(self, w, h)
        surface.SetDrawColor(Config.UI.TextColor)
        surface.SetMaterial(Material("hud/github.png"))
        surface.DrawTexturedRect(0, 0, w, h)
    end

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
end

-- Opens the main radio menu UI
openRadioMenu = function(openSettings)
    if radioMenuOpen then
        return
    end

    local ply = LocalPlayer()
    local entity = ply.currentRadioEntity
    if not IsValid(entity) then
        return
    end

    if entity:GetClass() == "boombox" and not Utils:canInteractWithBoombox(ply, entity) then
        chat.AddText(Color(255, 0, 0), "You don't have permission to interact with this boombox.")
        return
    end

    radioMenuOpen = true
    local backButton
    local frame = vgui.Create("DFrame")
    currentFrame = frame
    frame:SetTitle("")
    frame:SetSize(Scale(Config.UI.FrameSize.width), Scale(Config.UI.FrameSize.height))
    frame:Center()
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:MakePopup()

    frame.OnClose = function()
        radioMenuOpen = false
    end

    frame.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.BackgroundColor)
        draw.RoundedBoxEx(8, 0, 0, w, Scale(40), Config.UI.HeaderColor, true, true, false, false)
        
        local iconSize = Scale(25)
        local iconOffsetX = Scale(10)
        surface.SetFont("HeaderFont")
        local textHeight = select(2, surface.GetTextSize("H"))
        local iconOffsetY = Scale(2) + textHeight - iconSize
        surface.SetMaterial(Material("hud/radio.png"))
        surface.SetDrawColor(Config.UI.TextColor)
        surface.DrawTexturedRect(iconOffsetX, iconOffsetY, iconSize, iconSize)

        local headerText = settingsMenuOpen and (Config.Lang["Settings"] or "Settings") or
                           (selectedCountry and formatCountryName(selectedCountry) or (Config.Lang["SelectCountry"] or "Select Country"))
        draw.SimpleText(headerText, "HeaderFont", iconOffsetX + iconSize + Scale(5), iconOffsetY, Config.UI.TextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end

    local searchBox = vgui.Create("DTextEntry", frame)
    searchBox:SetPos(Scale(10), Scale(50))
    searchBox:SetSize(Scale(Config.UI.FrameSize.width) - Scale(20), Scale(30))
    searchBox:SetFont("Roboto18")
    searchBox:SetPlaceholderText(Config.Lang and Config.Lang["SearchPlaceholder"] or "Search")
    searchBox:SetTextColor(Config.UI.TextColor)
    searchBox:SetPaintBackground(false)
    searchBox.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.SearchBoxColor)
        self:DrawTextEntryText(Config.UI.TextColor, Color(120, 120, 120), Config.UI.TextColor)
        if self:GetText() == "" then
            draw.SimpleText(self:GetPlaceholderText(), self:GetFont(), Scale(5), h / 2, Config.UI.TextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    searchBox:SetVisible(not settingsMenuOpen)

    local stationListPanel = vgui.Create("DScrollPanel", frame)
    stationListPanel:SetPos(Scale(5), Scale(90))
    stationListPanel:SetSize(Scale(Config.UI.FrameSize.width) - Scale(20), Scale(Config.UI.FrameSize.height) - Scale(200))
    stationListPanel:SetVisible(not settingsMenuOpen)

    local stopButtonHeight = Scale(Config.UI.FrameSize.width) / 8
    local stopButtonWidth = Scale(Config.UI.FrameSize.width) / 4
    local stopButtonText = Config.Lang["StopRadio"] or "STOP"
    local stopButtonFont = calculateFontSizeForStopButton(stopButtonText, stopButtonWidth, stopButtonHeight)

    -- Creates an animated button with hover effects
    local function createAnimatedButton(parent, x, y, w, h, text, textColor, bgColor, hoverColor, clickFunc)
        local button = vgui.Create("DButton", parent)
        button:SetPos(x, y)
        button:SetSize(w, h)
        button:SetText(text)
        button:SetTextColor(textColor)
        button.bgColor = bgColor
        button.hoverColor = hoverColor
        button.lerp = 0

        button.Paint = UIPerformance:OptimizePaintFunction(button, function(self, w, h)
            local color = LerpColor(self.lerp, self.bgColor, self.hoverColor)
            draw.RoundedBox(8, 0, 0, w, h, color)
        end)

        local lastThink = 0
        button.Think = function(self)
            local currentTime = RealTime()
            if currentTime - lastThink < UIPerformance.frameUpdateThreshold then
                return
            end

            if self:IsHovered() then
                self.lerp = math.Approach(self.lerp, 1, FrameTime() * 5)
            else
                self.lerp = math.Approach(self.lerp, 0, FrameTime() * 5)
            end

            lastThink = currentTime
        end

        button.DoClick = clickFunc
        return button
    end

    -- Stop button to stop the currently playing radio
    local stopButton = createAnimatedButton(frame, Scale(10), Scale(Config.UI.FrameSize.height) - Scale(90), stopButtonWidth, stopButtonHeight, stopButtonText, Config.UI.TextColor, Config.UI.CloseButtonColor, Config.UI.CloseButtonHoverColor, function()
        surface.PlaySound("buttons/button6.wav")
        if IsValid(entity) then
            entity = Utils:getVehicleEntity(entity)
            net.Start("StopCarRadioStation")
            net.WriteEntity(entity)
            net.SendToServer()
            currentlyPlayingStations[entity] = nil
            populateList(stationListPanel, backButton, searchBox, false)
            if backButton then
                backButton:SetVisible(selectedCountry ~= nil or settingsMenuOpen)
                backButton:SetEnabled(selectedCountry ~= nil or settingsMenuOpen)
            end
        end
    end)

    stopButton:SetFont(stopButtonFont)

    -- Volume control panel
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

    -- Updates the volume icon based on the current volume level
    local function updateVolumeIcon(value)
        local iconName
        if value < 0.01 then
            iconName = "vol_mute"
        elseif value <= 0.65 then
            iconName = "vol_down"
        else
            iconName = "vol_up"
        end

        local mat = Material("hud/" .. iconName .. ".png")
        volumeIcon:SetMaterial(mat)
    end

    volumeIcon.Paint = function(self, w, h)
        surface.SetDrawColor(Config.UI.TextColor)
        surface.SetMaterial(self:GetMaterial())
        surface.DrawTexturedRect(0, 0, w, h)
    end

    local currentVolume = 0.5
    if IsValid(entity) then
        currentVolume = entityVolumes[entity] or (Utils:getEntityConfig(entity) and Utils:getEntityConfig(entity).Volume) or 0.5
    end
    updateVolumeIcon(currentVolume)

    local volumeSlider = vgui.Create("DNumSlider", volumePanel)
    volumeSlider:SetPos(-Scale(170), Scale(5))
    volumeSlider:SetSize(Scale(Config.UI.FrameSize.width) + Scale(120) - stopButtonWidth, volumePanel:GetTall() - Scale(20))
    volumeSlider:SetText("")
    volumeSlider:SetMin(0)
    volumeSlider:SetMax(1)
    volumeSlider:SetDecimals(2)
    volumeSlider:SetValue(currentVolume)
    volumeSlider.Slider.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, h / 2 - 4, w, 16, Config.UI.TextColor)
    end
    volumeSlider.Slider.Knob.Paint = function(self, w, h)
        draw.RoundedBox(12, 0, Scale(-2), w * 2, h * 2, Config.UI.BackgroundColor)
    end
    volumeSlider.TextArea:SetVisible(false)

    local lastServerUpdate = 0
    volumeSlider.OnValueChanged = function(_, value)
        local currentTime = CurTime()
        if IsValid(entity) and entity:GetClass() == "prop_vehicle_prisoner_pod" and entity:GetParent():IsValid() then
            entity = Utils:getVehicleEntity(entity)
        end

        if value < 0.05 then
            value = 0
        end

        entityVolumes[entity] = value
        if currentRadioSources[entity] and IsValid(currentRadioSources[entity]) then
            currentRadioSources[entity]:SetVolume(value)
        end
        updateVolumeIcon(value)

        if currentTime - lastServerUpdate >= 0.1 then
            lastServerUpdate = currentTime
            net.Start("UpdateRadioVolume")
            net.WriteEntity(entity)
            net.WriteFloat(value)
            net.SendToServer()
        end
    end

    -- Customize the scrollbar appearance
    local sbar = stationListPanel:GetVBar()
    sbar:SetWide(Scale(8))

    function sbar:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor)
    end

    function sbar.btnUp:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor)
    end

    function sbar.btnDown:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarColor)
    end

    function sbar.btnGrip:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Config.UI.ScrollbarGripColor)
    end

    local buttonSize = Scale(25)
    local topMargin = Scale(7)
    local buttonPadding = Scale(5)

    -- Close button for the radio menu
    local closeButton = createAnimatedButton(frame, frame:GetWide() - buttonSize - Scale(10), topMargin, buttonSize, buttonSize, "", Config.UI.TextColor, Color(0, 0, 0, 0), Config.UI.ButtonHoverColor, function()
        surface.PlaySound("buttons/lightswitch2.wav")
        frame:Close()
    end)

    closeButton.Paint = function(self, w, h)
        surface.SetMaterial(Material("hud/close.png"))
        surface.SetDrawColor(ColorAlpha(Config.UI.TextColor, 255 * (0.5 + 0.5 * self.lerp)))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    -- Settings button to open the settings menu
    local settingsButton = createAnimatedButton(frame, closeButton:GetX() - buttonSize - buttonPadding, topMargin, buttonSize, buttonSize, "", Config.UI.TextColor, Color(0, 0, 0, 0), Config.UI.ButtonHoverColor, function()
        surface.PlaySound("buttons/lightswitch2.wav")
        settingsMenuOpen = true
        openSettingsMenu(currentFrame, backButton)
        backButton:SetVisible(true)
        backButton:SetEnabled(true)
        searchBox:SetVisible(false)
        stationListPanel:SetVisible(false)
    end)

    settingsButton.Paint = function(self, w, h)
        surface.SetMaterial(Material("hud/settings.png"))
        surface.SetDrawColor(ColorAlpha(Config.UI.TextColor, 255 * (0.5 + 0.5 * self.lerp)))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    -- Back button to navigate back in the UI
    backButton = createAnimatedButton(frame, settingsButton:GetX() - buttonSize - buttonPadding, topMargin, buttonSize, buttonSize, "", Config.UI.TextColor, Color(0, 0, 0, 0), Config.UI.ButtonHoverColor, function()
        surface.PlaySound("buttons/lightswitch2.wav")
        if settingsMenuOpen then
            settingsMenuOpen = false
            if IsValid(settingsFrame) then
                settingsFrame:Remove()
                settingsFrame = nil
            end

            searchBox:SetVisible(true)
            stationListPanel:SetVisible(true)
            backButton:SetVisible(selectedCountry ~= nil)
            backButton:SetEnabled(selectedCountry ~= nil)
        elseif selectedCountry ~= nil then
            selectedCountry = nil
            backButton:SetVisible(false)
            backButton:SetEnabled(false)
        else
            backButton:SetVisible(false)
            backButton:SetEnabled(false)
        end

        populateList(stationListPanel, backButton, searchBox, true)
    end)

    backButton.Paint = function(self, w, h)
        if self:IsVisible() then
            surface.SetMaterial(Material("hud/return.png"))
            surface.SetDrawColor(ColorAlpha(Config.UI.TextColor, 255 * (0.5 + 0.5 * self.lerp)))
            surface.DrawTexturedRect(0, 0, w, h)
        end
    end

    backButton:SetVisible(selectedCountry ~= nil or settingsMenuOpen)
    backButton:SetEnabled(selectedCountry ~= nil or settingsMenuOpen)

    if not settingsMenuOpen then
        populateList(stationListPanel, backButton, searchBox, true)
    else
        openSettingsMenu(currentFrame, backButton)
    end

    -- Update the station list based on search input
    searchBox.OnChange = function(self)
        populateList(stationListPanel, backButton, searchBox, false)
    end

    _G.openRadioMenu = openRadioMenu

    local oldOnRemove = frame.OnRemove
    frame.OnRemove = function(self)
        if oldOnRemove then
            oldOnRemove(self)
        end
        UIPerformance:RemovePanel(self)
    end

    return frame
end

-- Hook to open the radio menu when the open key is pressed
hook.Add("Think", "OpenCarRadioMenu", function()
    local openKey = GetConVar("car_radio_open_key"):GetInt()
    local ply = LocalPlayer()
    local vehicle = ply:GetVehicle()

    if input.IsKeyDown(openKey) and not radioMenuOpen then
        if Utils:isValidRadioEntity(vehicle) then
            ply.currentRadioEntity = vehicle
            openRadioMenu()
        elseif IsValid(ply.currentRadioEntity) and ply.currentRadioEntity:GetClass() == "boombox" then
            if Utils:canInteractWithBoombox(ply, ply.currentRadioEntity) then
                openRadioMenu()
            else
                chat.AddText(Color(255, 0, 0), "You don't have permission to interact with this boombox.")
            end
        end
    end
end)

-- Hook to continuously update radio sources
hook.Add("Think", "UpdateRadioSources", function()
    RadioSourceManager:updateSources()
end)

-- Hook to clean up radio sources on server shutdown
hook.Add("ShutDown", "CleanupRadioSources", function()
    RadioSourceManager:cleanup()
    RadioSourceManager.sourceStatuses = {}
    BoomboxStatuses = {}
end)

-- Hook to remove a radio source when its entity is removed
hook.Add("EntityRemoved", "CleanupRadioSource", function(ent)
    if IsValid(ent) then
        RadioSourceManager:removeSource(ent)
    end
end)

-- Network receiver for playing a radio station
net.Receive("PlayCarRadioStation", function()
    local entity = Utils:getVehicleEntity(net.ReadEntity())
    local stationName = net.ReadString()
    local url = net.ReadString()
    local volume = net.ReadFloat()

    if not IsValid(entity) or type(url) ~= "string" or type(volume) ~= "number" then
        print("[Radio Error] Invalid data received")
        return
    end

    ErrorHandler:TrackAttempt(entity, stationName, url)
    if IsValid(entity) and (entity:GetClass() == "boombox") then
        entity:SetNWString("Status", "tuning")
        entity:SetNWString("StationName", stationName)
        entity:SetNWBool("IsPlaying", true)
        BoomboxStatuses[entity:EntIndex()] = {
            stationStatus = "tuning",
            stationName = stationName
        }
    end

    if currentRadioSources[entity] and IsValid(currentRadioSources[entity]) then
        currentRadioSources[entity]:Stop()
        currentRadioSources[entity] = nil
    end

    ErrorHandler:StartTimeout(entity, function()
        net.Start("PlayCarRadioStation")
        net.WriteEntity(entity)
        net.WriteString(stationName)
        net.WriteString(url)
        net.WriteFloat(volume)
        net.SendToServer()
    end)

    sound.PlayURL(url, "3d mono", function(station, errorID, errorName)
        ErrorHandler:StopTimeout(entity)
        if IsValid(station) then
            station:SetPos(entity:GetPos())
            station:SetVolume(volume)
            station:Play()
            RadioSourceManager:addSource(entity, station, stationName)
            local entityConfig = Utils:getEntityConfig(entity)
            if entityConfig then
                station:Set3DFadeDistance(entityConfig.MinVolumeDistance, entityConfig.MaxHearingDistance)
            end
            ErrorHandler:ClearEntity(entity)

            -- Continuously check the state of the station
            local function checkStationState()
                if not IsValid(entity) or not IsValid(station) then
                    return
                end

                if station:GetState() == GMOD_CHANNEL_PLAYING then
                    if entity:GetClass() == "boombox" then
                        BoomboxStatuses[entity:EntIndex()] = {
                            stationStatus = "playing",
                            stationName = stationName
                        }

                        entity:SetNWString("Status", "playing")
                    end
                elseif station:GetState() == GMOD_CHANNEL_STOPPED then
                    ErrorHandler:HandleError(entity, ErrorHandler.ErrorTypes.STREAM_ERROR, nil, nil, function()
                        net.Start("PlayCarRadioStation")
                        net.WriteEntity(entity)
                        net.WriteString(stationName)
                        net.WriteString(url)
                        net.WriteFloat(volume)
                        net.SendToServer()
                    end)
                else
                    timer.Simple(0.1, checkStationState)
                end
            end

            checkStationState()
        else
            local errorType = errorID == 1 and ErrorHandler.ErrorTypes.CONNECTION_FAILED or
                              errorID == 2 and ErrorHandler.ErrorTypes.INVALID_URL or
                              ErrorHandler.ErrorTypes.UNKNOWN
            ErrorHandler:HandleError(entity, errorType, errorID, errorName, function()
                net.Start("PlayCarRadioStation")
                net.WriteEntity(entity)
                net.WriteString(stationName)
                net.WriteString(url)
                net.WriteFloat(volume)
                net.SendToServer()
            end)
        end
    end)
end)

-- Network receiver for stopping a radio station
net.Receive("StopCarRadioStation", function()
    local entity = Utils:getVehicleEntity(net.ReadEntity())
    if not IsValid(entity) then
        return
    end

    RadioSourceManager:removeSource(entity)
    currentlyPlayingStations[entity] = nil
end)

-- Network receiver for updating radio volume
net.Receive("UpdateRadioVolume", function()
    local entity = Utils:getVehicleEntity(net.ReadEntity())
    local volume = net.ReadFloat()
    if not IsValid(entity) then
        return
    end

    entityVolumes[entity] = volume
    if currentRadioSources[entity] and IsValid(currentRadioSources[entity]) then
        currentRadioSources[entity]:SetVolume(volume)
    end

    if radioMenuOpen and IsValid(currentFrame) then
        local volumeSlider = currentFrame:GetChildren()[6]:GetChildren()[2]
        if IsValid(volumeSlider) and volumeSlider:GetName() == "DNumSlider" then
            volumeSlider:SetValue(volume)
        end
    end
end)

-- Network receiver to open the radio menu
net.Receive("OpenRadioMenu", function()
    local ent = net.ReadEntity()
    if IsValid(ent) then
        local ply = LocalPlayer()
        if ent:IsVehicle() or Utils:canInteractWithBoombox(ply, ent) then
            ply.currentRadioEntity = ent
            if not radioMenuOpen then
                openRadioMenu()
            end
        else
            chat.AddText(Color(255, 0, 0), "You don't have permission to interact with this boombox.")
        end
    end
end)

-- Initialize favorites and station data
loadFavorites()
LoadStationData()

-- Hook to clean up boombox statuses when entities are removed
hook.Add("EntityRemoved", "BoomboxCleanup", function(ent)
    if IsValid(ent) and (ent:GetClass() == "boombox") then
        BoomboxStatuses[ent:EntIndex()] = nil
    end
end)

-- Callback to clear language cache when radio language changes
cvars.AddChangeCallback("radio_language", function(_, _, newValue)
    CountryNameCache:clearLanguage(CountryNameCache.lastLang)
    CountryNameCache.lastLang = newValue
end)

-- Hook to clean up country name cache on server shutdown
hook.Add("ShutDown", "CleanupCountryNameCache", function()
    CountryNameCache.cache = {}
end)

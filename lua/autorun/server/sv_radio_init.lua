print("[RADIO] Starting server-side initialization")

-- Add all the necessary Lua files for the client
AddCSLuaFile("radio/config.lua")
AddCSLuaFile("radio/lang/cl_language_manager.lua")
AddCSLuaFile("radio/cl_radio.lua")
AddCSLuaFile("radio/theme_menu.lua")
AddCSLuaFile("themes.lua")
AddCSLuaFile("radio/cl_init.lua")
AddCSLuaFile("radio/key_names.lua")
AddCSLuaFile("radio/utils.lua")

-- Dynamically include all radio station data files
local dataFiles = file.Find("radio/stations/data_*.lua", "LUA")
for _, filename in ipairs(dataFiles) do
    AddCSLuaFile("radio/stations/" .. filename)
end

-- Dynamically include all language files
local langFiles = file.Find("radio/lang/*.lua", "LUA")
for _, filename in ipairs(langFiles) do
    AddCSLuaFile("radio/lang/" .. filename)
end

-- Include the server-side radio logic
include("radio/sv_radio.lua")

-- Add resources
resource.AddFile("models/rammel/boombox.mdl")
resource.AddFile("models/rammel/boombox.phy")
resource.AddFile("models/rammel/boombox.vvd")
resource.AddFile("models/rammel/boombox.dx80.vtx")
resource.AddFile("models/rammel/boombox.dx90.vtx")
resource.AddFile("materials/models/")
resource.AddFile("materials/hud/")
resource.AddFile("materials/entities/boombox.png")
resource.AddFile("materials/entities/golden_boombox.png")

-- Add CSLuaFiles for boombox entities
AddCSLuaFile("entities/base_boombox/init.lua")
AddCSLuaFile("entities/base_boombox/cl_init.lua")
AddCSLuaFile("entities/base_boombox/shared.lua")
AddCSLuaFile("entities/boombox/shared.lua")
AddCSLuaFile("entities/golden_boombox/shared.lua")

-- Set up spawnable entities
list.Set("SpawnableEntities", "boombox", {
    PrintName = "Boombox",
    ClassName = "boombox",
    Category = "Radio",
    AdminOnly = false,
    Model = "models/rammel/boombox.mdl",
    Description = "A basic boombox, ready to play some music!"
})

list.Set("SpawnableEntities", "golden_boombox", {
    PrintName = "Golden Boombox",
    ClassName = "golden_boombox",
    Category = "Radio",
    AdminOnly = true,
    Model = "models/rammel/boombox.mdl",
    Description = "A boombox with an extreme audio range!"
})

print("[RADIO] Finished server-side initialization")

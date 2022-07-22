--- Sapiens++: sapiensPlusPlus.lua
--- Mod entry point for the Sapiens++ Mod.
--- @author SirLich

local sapiensPlusPlus = {}

-- Sapiens
local keyCodes = mjrequire "mainThread/keyMapping".keyCodes
local timer = mjrequire "common/timer"

-- Hammerstone
local inputManager = mjrequire "hammerstone/input/inputManager"
local uiManager = mjrequire "hammerstone/ui/uiManager"
local saveState = mjrequire "hammerstone/state/saveState"

function sapiensPlusPlus:init()
	mj:log("Initializing Sapiens++ Mod...")
end

-- Module return
return sapiensPlusPlus

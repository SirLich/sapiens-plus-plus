--- Sapiens++: server.lua
--- @author SirLich

local mod = {
	loadOrder = 1
}

-- Hammerstone
local logger = mjrequire "hammerstone/logging"

function mod:onload(server)
	logger:log("Server Loaded")
end

return mod
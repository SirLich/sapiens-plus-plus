--- Sapiens++: serverMob.lua
--- @author SirLich

local mod = {
	loadOrder = 1,
}

-- Sapiens++
local serverDodo = mjrequire "sapiens-pp/dodo/serverDodo"

function mod:onload(serverMob)
	local super_init = serverMob.init
	serverMob.init = function (self_, serverGOM, serverWorld, serverSapien, planManager)
		super_init(serverMob, serverGOM, serverWorld, serverSapien, planManager)

		-- This cannot be called here because the object set doesn't exist yet.
		-- Custom implementation
		-- serverDodo:init(serverGOM, serverWorld, serverMob)
	end
end

return mod
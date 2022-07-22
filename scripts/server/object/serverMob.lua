--- Sapiens++: serverMob.lua
--- @author SirLich

local mod = {
	loadOrder = 1,
}

-- hammerstone
local logger = mjrequire "hammerstone/logging"

-- Sapiens++
local serverDodo = mjrequire "sapiens-pp/dodo/serverDodo"


function mod:onload(serverMob)
	local super_init = serverMob.init
	serverMob.init = function (self_, serverGOM, serverWorld, serverSapien, planManager)
		super_init(serverMob, serverGOM, serverWorld, serverSapien, planManager)

		-- Custom implementation
		serverDodo:init(serverGOM, serverWorld, serverMob)
	end
end

-- Module Return
return mod
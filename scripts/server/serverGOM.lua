--- Sapiens++: serverGOM.lua
--- @author SirLich

local mod = {
	loadOrder = 1,
	serverWorld = nil
}

-- Base
local serverMob = mjrequire "server/objects/serverMob"

-- Sapiens++
local serverDodo = mjrequire "sapiens-pp/dodo/serverDodo"

function mod:onload(serverGOM)
	local super_setWorld = serverGOM.setWorld
	serverGOM.setWorld = function (self_, serverWorld, serverTribe)
		super_setWorld(serverGOM, serverWorld, serverTribe)
		mod.serverWorld = serverWorld
	end


	local super_setBridge = serverGOM.setBridge

	serverGOM.setBridge = function (self_, bridge)
		super_setBridge(serverGOM, bridge)
		serverGOM.bridge = bridge

		-- Custom implementation
		mj:log("S++: Creating ObjectSet 'dodos'")

		serverGOM:createObjectSet("dodos")
		serverDodo:init(serverGOM, mod.serverWorld, serverMob)
	end

	function serverGOM:createObjectSet(objectSetID)
		serverGOM.objectSets[objectSetID] = serverGOM.bridge:createObjectSet(objectSetID)
	end
end

return mod
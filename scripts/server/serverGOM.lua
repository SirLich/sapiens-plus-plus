--- Sapiens++: serverGOM.lua
--- @author SirLich

local mod = {
	loadOrder = 1,
}

-- Hammerstone
local logger = mjrequire "hammerstone/logging"

function mod:onload(serverGOM)
	local super_setBridge = serverGOM.setBridge

	serverGOM.setBridge = function (self_, bridge)
		super_setBridge(serverGOM, bridge)
		serverGOM.bridge = bridge

		-- Custom implementation
		serverGOM:createObjectSet("dodo")
	end

	function serverGOM:createObjectSet(objectSetID)
		serverGOM.objectSets[objectSetID] = serverGOM.bridge:createObjectSet(objectSetID)
	end
end

return mod
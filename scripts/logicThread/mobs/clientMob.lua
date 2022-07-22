--- Sapiens++: clientMob.lua
--- @author SirLich

local mod = {
	loadOrder = 1,
}

-- Base
local mob = mjrequire "common/mob/mob"

-- Sapiens++
local clientDodo = mjrequire "sapiens-pp/dodo/clientDodo"

function mod:onload(clientMob)
	clientMob.mobClassMap[mob.types.chicken.index] = clientDodo
end

return mod
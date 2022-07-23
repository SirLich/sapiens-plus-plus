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
	mj:log("S++: Added clientDodo to mobClassMap")
	clientMob.mobClassMap[mob.types.dodo.index] = clientDodo
	mj:log(clientMob.mobClassMap)
end

return mod
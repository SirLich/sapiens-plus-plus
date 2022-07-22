-- Sapiens++: mob.lua

local mod = {
	loadOrder = 1,
}

-- Base
local typeMaps = mjrequire "common/typeMaps"

-- Sapiens++
local mobDodo = mjrequire "sapiens-pp/dodo/mobDodo"

function mod:onload(mob)
	local super_load = mob.load
	mob.load = function (self, gameObject)
		mj:log("S++: Mob.lua Loaded")

		super_load(mob, gameObject)


		mobDodo:load(mob, gameObject)

		mob.validTypes = typeMaps:createValidTypesArray("mob", mob.types)

	end
end

-- Module Return
return mod
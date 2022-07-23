-- Sapiens++: mob.lua

local mod = {
	loadOrder = 1,
	gameObject = nil
}

-- Base
local typeMaps = mjrequire "common/typeMaps"
local typeMaps = mjrequire "common/typeMaps"
local notification = mjrequire "common/notification"
-- Sapiens++
local mobDodo = mjrequire "sapiens-pp/dodo/mobDodo"

-- Local State
local typeIndexMap = typeMaps.types.mob

function mod:onload(mob)
	local super_load = mob.load
	mob.load = function (self, gameObject)
		mj:log("S++: Mob.lua Loaded")
		mod.gameObject = gameObject
		mobDodo:load(mob, gameObject)
		super_load(mob, gameObject)
	end

	local super_addType = mob.addType
	mob.addType = function (self, key, info)
		mod:custom_addType(key, info, mob)
	end
end





function mod:custom_addType(key, info, mob)
	--- A special custom redefinition of addType
	--- This intentionally doesn't call super!

	local mobTypeIndex = typeIndexMap[key]
	if mob.types[key] then
		mj:log("WARNING: overwriting mob type:", key)
	end

	info.key = key
	info.index = mobTypeIndex
	mob.types[key] = info
	mob.types[mobTypeIndex] = info

	if info.addGameObjectInfo then
		local addGameObjectInfo = info.addGameObjectInfo
		addGameObjectInfo.mobTypeIndex = mobTypeIndex

		info.name = addGameObjectInfo.name
		info.plural = addGameObjectInfo.plural

		info.gameObjectTypeIndex = mod.gameObject:addGameObject(key, addGameObjectInfo)
	end

	info.addGameObjectInfo = nil
	
	return mobTypeIndex
end

return mod

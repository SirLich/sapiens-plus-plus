local mod = {
	loadOrder = 1
}

-- Base
local resource = mjrequire "common/resource"
local snapGroup = mjrequire "common/snapGroup"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local normalize = mjm.normalize

function mod:onload(gameObject)
	mj:log("S++: Adding Palm Leaf Game Object")

	gameObject:addGameObject("palmFrond", {
		modelName = "palmFrond",
		name = "Palm Leaf",
		plural = "Palm Leaves",
		scale = 1.0,
		hasPhysics = true,
		resourceTypeIndex = resource.types.palmFrond.index,
		objectViewRotationFunction = function(object) 
			return mat3Rotate(mat3Identity, 0.1, vec3(1.0, 0.0, 0.0))
		end,
		markerPositions = {
			{ 
				worldOffset = vec3(0.0, mj:mToP(0.2), 0.0)
			}
		},
	})

	gameObject:addGameObject("build_palmFrondHut", {
		modelName = "palmFrondHut",
		scale = 1.0,
		hasPhysics = true,
		isInProgressBuildObject = true,
		preventShiftOnTerrainSurfaceModification = true,
		preventGrassAndSnow = true,
		femaleSnapPoints = snapGroup.femalePoints.roofFemaleSnapPoints,
		objectViewRotationFunction = function(object) 
			return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
		end,
		objectViewOffsetFunction = function(object)
			return vec3(0.5,-1.5,1.0)
		end,
		markerPositions = {
			{ 
				localOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			},
			{ 
				localOffset = vec3(0.0, mj:mToP(-0.8), 0.0)
			}
		}
	})

	gameObject:addGameObject("palmFrondHut", {
		modelName = "palmFrondHut",
		scale = 1.0,
		hasPhysics = true,
		isBuiltObject = true,
		preventShiftOnTerrainSurfaceModification = true,
		preventGrassAndSnow = true,
		isPathFindingCollider = true,
		blocksRain = false,
		femaleSnapPoints = snapGroup.femalePoints.roofFemaleSnapPoints,

		objectViewRotationFunction = function(object)
			return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
		end,
		objectViewOffsetFunction = function(object)
			return vec3(0.5,-1.5,1.0)
		end,
		markerPositions = {
			{
				localOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			},
			{ 
				localOffset = vec3(0.0, mj:mToP(-0.8), 0.0)
			}
		},
	})
end

return mod
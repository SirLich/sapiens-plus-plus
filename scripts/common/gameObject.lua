local mod = {
	loadOrder = 1
}

-- Base
local resource = mjrequire "common/resource"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local mat3Inverse = mjm.mat3Inverse

function mod:onload(gameObject)
	mj:log("SPP: Adding Game Object")

	gameObject:addGameObject("palmLeaf", {
		modelName = "palmLeaf",
		scale = 1.0,
		hasPhysics = true,
		resourceTypeIndex = resource.types.palmLeaf.index,
		objectViewRotationFunction = function(object) 
			return mat3Rotate(mat3Identity, 0.1, vec3(1.0, 0.0, 0.0))
		end,
		markerPositions = {
			{ 
				worldOffset = vec3(0.0, mj:mToP(0.2), 0.0)
			}
		},
	})
end

return mod
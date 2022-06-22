local mod = {
	loadOrder = 1
}

-- Base
local typeMaps = mjrequire "common/typeMaps"

function mod:onload(resource)
	resource:addResource('palmLeaf', {
		name ="Palm Leaf",
		plural = "Palm Leaves",
		displayGameObjectTypeIndex = typeMaps.types.gameObject.palmLeaf,
	})
end

return mod
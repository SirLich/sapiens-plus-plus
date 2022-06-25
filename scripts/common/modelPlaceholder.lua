--- Shadow of modelPlaceholder.lua
-- @Author SirLich


local mod = {
	loadOrder = 1
}

-- Base
local model = mjrequire "common/model"

function mod:onload(modelPlaceholder)
	addModel("thatchRoof", {
		{ 
			multiKeyBase = "branch",
			multiCount = 4, 
			defaultModelName = "branchLong",
			resourceTypeIndex = resource.types.branch.index,
			placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
				return getModelIndexForStandardRemaps(placeholderInfo, longBranchRemaps[objectTypeIndex], placeholderContext)
			end
		},
		{ 
			multiKeyBase = "hay",
			multiCount = 8, 
			defaultModelName = "thatchWideTaller",
			resourceTypeIndex = resource.types.hay.index,
			defaultModelShouldOverrideResourceObject = true,
		},
		{
			key = "branch_store",
			offsetToStorageBoxWalkableHeight = true,
		},
		{
			key = "hay_store",
			offsetToStorageBoxWalkableHeight = true,
		},
	})
end

return mod


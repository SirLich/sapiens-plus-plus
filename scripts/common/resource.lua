local mod = {
	loadOrder = 1
}

-- Base
local typeMaps = mjrequire "common/typeMaps"

function mod:onload(resource)
	mj:log("S++: Adding Palm Leaf Resource.")

	local super_mjInit = resource.mjInit

	resource.mjInit = function(self)
		super_mjInit()

		resource:addResource('palmFrond', {

			-- TODO: Can these somehow be infered?
			name ="Palm Leaf",
			plural = "Palm Leaves",
			displayGameObjectTypeIndex = typeMaps.types.gameObject.palmFrond,
		})

	end
end

return mod
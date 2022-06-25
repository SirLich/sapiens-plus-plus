local mod = {
	loadOrder = 1
}

-- Base
local gameObject = mjrequire "common/gameObject"

function mod:onload(evolvingObject)
	mj:log("S++: Adding Palm Leaf as evolving object.")

	local super_init = evolvingObject.init

	evolvingObject.init = function(self, dayLength, yearLength)
		super_init(evolvingObject, dayLength, yearLength)

		evolvingObject:addEvolvingObject('palmFrond', {
			minTime = 5.0,
			toType = gameObject.types.flaxDried.index,
			categoryIndex = evolvingObject.categories.dry.index,
		})
	end
end

return mod
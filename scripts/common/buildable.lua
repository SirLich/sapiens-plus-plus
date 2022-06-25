local mod = {
	loadOrder = 1
}

-- Base
local resource = mjrequire "common/resource"
local snapGroup = mjrequire "common/snapGroup"
local skill = mjrequire "common/skill"
local action = mjrequire "common/action"
local constructable = mjrequire "common/constructable"

local clearObjectsAndTerrainSequence = {
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearTerrain.index
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.clearObjects.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringResources.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.bringTools.index,
    },
    {
        constructableSequenceTypeIndex = constructable.sequenceTypes.moveComponents.index,
    },
}

function mod:onload(buildable)
	mj:log("S++: Adding PalmFrondHut")

	buildable:addBuildable("palmFrondHut", {
		modelName = "palmFrondHut",
		inProgressGameObjectTypeKey = "build_palmFrondHut",
		finalGameObjectTypeKey = "palmFrondHut",
		name = "Palm Frond Hut",
		plural = "Palm Frond Huts",
		summary = "A cozy, one-sapien, tropical hut.",
		
		classification = constructable.classifications.build.index,
		
		skills = {
			-- TODO: Should we try creating our own skills?
			required = skill.types.thatchBuilding.index,
		},
		
		allowYTranslation = true,
		allowXZRotation = true,
	
		buildSequence = clearObjectsAndTerrainSequence,
		
		maleSnapPoints = snapGroup.malePoints.roofMaleSnapPoints,
	
		requiredResources = {
			{
				type = resource.types.branch.index,
				count = 4,
				afterAction = {
					actionTypeIndex = action.types.inspect.index,
					durationWithoutSkill = 10.0,
				}
			},
			{
				type = resource.types.hay.index,
				count = 8,
				afterAction = {
					actionTypeIndex = action.types.inspect.index,
					durationWithoutSkill = 10.0,
				}
			},
		}
	})
end

return mod

--- Sapiens++: serverDodo.lua
--- @author SirLich

local serverDodo = {
    serverGOM = nil,
    serverMob = nil,
    serverWorld = nil,
}

-- Base
local gameObject = mjrequire "common/gameObject"
local mob = mjrequire "common/mob/mob"


local function infrequentUpdate(objectID, dt, speedMultiplier)
    serverDodo.serverMob:infrequentUpdate(objectID, dt, speedMultiplier)
end


local function dodoSapienProximity(objectID, sapienID, distance2, newIsClose)
    serverDodo.serverMob:mobSapienProximity(objectID, sapienID, distance2, newIsClose)
end

function serverDodo:init(serverGOM, serverWorld, serverMob)
    serverDodo.serverGOM = serverGOM
    serverDodo.serverMob = serverMob
    serverDodo.serverWorld = serverWorld

    mj:log("S++: serverDodo:init called.")
    mj:log(serverDodo.serverMob)

    serverDodo.serverGOM:addObjectLoadedFunctionForTypes({ gameObject.types.dodo.index }, function(object)
        mj:log("S++: serverDodo adding 'dodo' to ObjectSet 'dodos'.")
        serverDodo.serverGOM:addObjectToSet(object, serverDodo.serverGOM.objectSets.interestingToLookAt)
        serverDodo.serverGOM:addObjectToSet(object, serverDodo.serverGOM.objectSets.dodos)
        serverDodo.serverMob:mobLoaded(object)
    end)
    
    local reactDistance = mob.types.dodo.reactDistance
    
    serverDodo.serverGOM:setInfrequentCallbackForGameObjectsInSet(serverDodo.serverGOM.objectSets.dodos, "update", 5.0, infrequentUpdate)
    serverDodo.serverGOM:addProximityCallbackForGameObjectsInSet(serverDodo.serverGOM.objectSets.dodos, serverDodo.serverGOM.objectSets.sapiens, reactDistance, dodoSapienProximity)
end

return serverDodo
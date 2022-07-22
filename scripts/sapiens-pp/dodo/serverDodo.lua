--- Sapiens++: serverDodo.lua
--- @author SirLich

local serverDodo = {}

-- Base
local gameObject = mjrequire "common/gameObject"
local mob = mjrequire "common/mob/mob"

-- Hammerstone
local logger = mjrequire "hammerstone/logging"

-- Local State
local serverGOM = nil
local serverMob = nil


local function infrequentUpdate(objectID, dt, speedMultiplier)
    serverMob:infrequentUpdate(objectID, dt, speedMultiplier)
end


local function dodoSapienProximity(objectID, sapienID, distance2, newIsClose)
    serverMob:mobSapienProximity(objectID, sapienID, distance2, newIsClose)
end

function serverDodo:init(serverGOM_, serverWorld_, serverMob_)
    
    serverGOM = serverGOM_
    serverMob = serverMob_

    serverGOM:addObjectLoadedFunctionForTypes({ gameObject.types.chicken.index }, function(object)
        serverGOM:addObjectToSet(object, serverGOM.objectSets.interestingToLookAt)
        serverGOM:addObjectToSet(object, serverGOM.objectSets.chickens)
        serverMob:mobLoaded(object)
    end)
    
    local reactDistance = mob.types.chicken.reactDistance
    
    serverGOM:setInfrequentCallbackForGameObjectsInSet(serverGOM.objectSets.chickens, "update", 5.0, infrequentUpdate)-- this needs to be called frequently enough for the walk speed to only cover 4.5 meters, or mob will pause every update. Max of 4.5/speed
    serverGOM:addProximityCallbackForGameObjectsInSet(serverGOM.objectSets.chickens, serverGOM.objectSets.sapiens, reactDistance, dodoSapienProximity)
end

return serverDodo
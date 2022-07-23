--- Sapiens++: clientDodo.lua
--- @author SirLich

local clientDodo = {}

clientDodo.serverUpdate = function(object, notifications, pos, rotation, scale, incomingServerStateDelta)
end

clientDodo.objectWasLoaded = function(object, pos, rotation, scale)
end

function clientDodo:update(object, dt, speedMultiplier)
end


function clientDodo:init(clientGOM_)
	mj:log("S++: clientDodo:init called.")
end

return clientDodo
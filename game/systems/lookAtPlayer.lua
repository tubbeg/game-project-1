
local Ut = require "systems/utility"

local function lookAtSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local playerEntity =  Ut.getPlayerEntity(world)
    local w,h = playerEntity.image:getDimensions()
    w,h = w * 0.65, h * 0.5
    local camera = Ut.getCameraEntity(world)
    camera.cam:lookAt(playerEntity.position.x + w, playerEntity.position.y + h)
end

local function addLookAtSystem(world)
    world:addSystem(lookAtSystem)
end

return addLookAtSystem
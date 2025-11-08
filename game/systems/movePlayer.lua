
local Ut = require "systems/utility"

local function calcPosition(entity)
    local direction = entity.direction
    local position = {x=entity.position.x, y=entity.position.y}
    if direction[1] == "LEFT" then
        position.x = position.x - 1
    end
    if direction[1] == "RIGHT" then
        position.x = position.x + 1
    end
    if direction[2] == "DOWN" then
        position.y = position.y + 1
    end
    if direction[2] == "UP" then
        position.y = position.y - 1
    end
    entity.position = position
end

local function moveSystem(world, dt, filter)
    if filter ~= "logic" then return end
    calcPosition(Ut.getPlayerEntity(world))
end

local function addMoveSystem(world)
    world:addSystem(moveSystem)
end

return addMoveSystem
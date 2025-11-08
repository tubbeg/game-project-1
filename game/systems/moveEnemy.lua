
local Ut = require "systems/utility"

local function calculatePlayerDirection(world, entity)
    local direction = {"NONE","NONE"}
    local position = Ut.getPlayerEntity(world).position
    local yDiff = position.y - entity.position.y
    local xDiff = position.x - entity.position.x
    if yDiff > 0 then
        direction[2] = "UP"
    end
    if xDiff > 0 then
        direction[1] = "LEFT"
    end
    if yDiff < 0 then
        direction[2] = "DOWN"
    end
    if xDiff < 0 then
        direction[1] = "RIGHT"
    end
    return direction
end

local function moveSystem(world, dt, filter)
    if filter ~= "logic" then return end
    for _,e in pairs(Ut.getEnemyEntities(world)) do
        local direction = calculatePlayerDirection(world, e)
        if direction[1] == "LEFT" then
            e.position.x = e.position.x + 0.1
        end
        if direction[1] == "RIGHT" then
            e.position.x = e.position.x - 0.1
        end
        if direction[2] == "UP" then
            e.position.y = e.position.y + 0.1
        end
        if direction[2] == "DOWN" then
            e.position.y = e.position.y - 0.1
        end
    end
end

local function addMoveSystem(world)
    world:addSystem(moveSystem)
end

return addMoveSystem
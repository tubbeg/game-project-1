

-- TODO
-- add these constants as entities maybe?
-- less manual work is better
local function clamp(entity)
    if entity.position.y >= 500 then
        entity.position.y = 500
    end
    if entity.position.x >= 500 then
        entity.position.x = 500
    end
    if entity.position.x <= -1000 then
        entity.position.x = -1000
    end
    if entity.position.y <= -1000 then
        entity.position.y = -1000
    end
end

local predicate = function (entity)
    return entity.position and entity.player
end

local function getPlayerEntity(world)
    local ents = world:query(function (entity) return entity.player end)
    return ents[1]
end

local getDirection = function (world)
    return getPlayerEntity(world).direction
end


local function calcPosition(direction, entity)
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
    return position
end

local function moveSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = world:query(predicate)
    local direction = getDirection(world)
    for _,e in pairs(ents) do
        e.position = calcPosition(direction, e)
    end
end

local function addMoveSystem(world)
    world:addSystem(moveSystem)
end

return addMoveSystem
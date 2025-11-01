

-- TODO
-- add these constants as entities maybe?
-- less manual work is better
local function clampPosition(position)
    if position.y >= 0 then
        position.y = 0
    end
    if position.x >= 0 then
        position.x = 0
    end
    if position.x <= -1000 then
        position.x = -1000
    end
    if position.y <= -1000 then
        position.y = -1000
    end
end

local predicate = function (entity)
    return entity.position and not entity.player
end

local function getPlayerEntity(world)
    local ents = world:query(function (entity) return entity.player end)
    return ents[1]
end

local getDirection = function (world)
    return getPlayerEntity(world).direction
end

-- the player isn't actually moving here, everything else is
local function moveSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = world:query(predicate)
    local direction = getDirection(world)
    for _,e in pairs(ents) do
        if direction[1] == "LEFT" then
            e.position.x = e.position.x + 1
        end
        if direction[1] == "RIGHT" then
            e.position.x = e.position.x - 1
        end
        if direction[2] == "UP" then
            e.position.y = e.position.y + 1
        end
        if direction[2] == "DOWN" then
            e.position.y = e.position.y - 1
        end
        clampPosition(e.position)
    end
end

local function addMoveSystem(world)
    world:addSystem(moveSystem)
end

return addMoveSystem
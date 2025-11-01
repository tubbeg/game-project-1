

-- TODO
-- add these constants as entities maybe?
-- less manual work is better
local function clampBackgroundPosition(entity)
    if not entity.board then return end
    if entity.position.y >= 2000 then
        entity.position.y = 2000
    end
    if entity.position.x >= 2000 then
        entity.position.x = 2000
    end
    if entity.position.x <= -2000 then
        entity.position.x = -2000
    end
    if entity.position.y <= -2000 then
        entity.position.y = -2000
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
        clampBackgroundPosition(e)
    end
end

local function addMoveSystem(world)
    world:addSystem(moveSystem)
end

return addMoveSystem
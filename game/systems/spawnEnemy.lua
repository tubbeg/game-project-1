
-- replace this with a system later
local dummyDifficulty = 2


local function getPlayerEntity(world)
    local entities = world:query(function(entity) return entity.player end)
    return entities[1]
end

local function positionIsNotNear(pos1, pos2)
    local xDiff = pos1.x - pos2.x
    local yDiff = pos1.y - pos2.y
    local dist = math.sqrt(math.pow(xDiff, 2) + math.pow(yDiff, 2))
    return dist > 100
end

-- this should not be a constant
-- fix later

local function generateRandomPosition(playerPos)
    local position = {x=playerPos.x,y=playerPos.y}
    while not positionIsNotNear(position, playerPos) do
        position.x = playerPos.x + math.random(-150, 150)
        position.y = playerPos.y + math.random(-150, 150)
    end
    return position
end

local function calculatePosition(world)
    local position = getPlayerEntity(world).position
    return generateRandomPosition(position)
end


local function getImagesEntity(world)
    local entities = world:query(function(entity) return entity.images end)
    return entities[1]
end


local function createEnemyEntity(world)
    local entity =
        {
            enemy = true,
            position = calculatePosition(world),
            image = getImagesEntity(world).images.banana,
            z = 10
        }
    print("spawning enemy at", entity.position)
    world:addEntity(entity)
end

local predicate = function (entity) return entity.timer end

local function addSpawnSystem(world)
    local function drawSystem(e, dt)
        e.timer.current = e.timer.current + dt
        if e.timer.current > e.timer.limit(dummyDifficulty) then
            e.timer.current = 0
            createEnemyEntity(world)
        end
    end
    world:addForeachSystem(predicate, drawSystem, "logic")
end


return addSpawnSystem
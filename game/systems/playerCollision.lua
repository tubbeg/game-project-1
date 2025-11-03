


local function linesOverlap(lineStart1, lineEnd1, lineStart2, lineEnd2)
    return
        lineStart1 < lineStart2 + lineEnd2 and
        lineStart1 + lineEnd1 > lineStart2
end


-- right now the hitboxes are way too big
-- aabb collision is pretty simple and it works really well, but
-- if I need something complex then this won't do
local function aabb(player, enemy)
    local pW, pH = player.image:getDimensions()
    local eW, eH = enemy.image:getDimensions()
    return
        linesOverlap(player.position.x, pW, enemy.position.x, eW) and
        linesOverlap(player.position.y, pH, enemy.position.y, eH)
end

local predicate = function (entity)
    return entity.enemy and entity.position and entity.image
end

local playerPredicate = function (entity)
    return entity.player and entity.position and entity.image
end

local function getPlayerEntity(world)
    local ents = world:query(playerPredicate)
    return ents[1]
end

-- should i run this system at certain intervals, or
-- should i give the player some invincibility afterward
-- collision?
local function collisionSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = world:query(predicate)
    local player = getPlayerEntity(world)
    for _,e in pairs(ents) do
        if aabb(player, e) then
            player.health = player.health - 1
            if player.health < 0 then
                print("player is dead :(")
            end
        end
    end
end

local function addCollSystem(world)
    world:addSystem(collisionSystem)
end

return addCollSystem
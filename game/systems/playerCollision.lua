

local Ut = require "systems/utility"


local function linesOverlap(lineStart1, lineEnd1, lineStart2, lineEnd2)
    return
        lineStart1 < lineStart2 + lineEnd2 and
        lineStart1 + lineEnd1 > lineStart2
end

-- i might replace this with a proper 3rd-party physics library later
local function aabb(player, enemy)
    return
        linesOverlap(player.position.x, player.hitbox.w, enemy.position.x, enemy.hitbox.w) and
        linesOverlap(player.position.y, player.hitbox.h, enemy.position.y, enemy.hitbox.h)
end


local function updateTimer(playerEntity, dt)
    playerEntity.collisionTimer.current = playerEntity.collisionTimer.current + dt
    if playerEntity.collisionTimer.current > playerEntity.collisionTimer.limit then
        playerEntity.collisionTimer.current = 0
    end
end

local function isTimeForCollision(playerEntity)
    return playerEntity.collisionTimer.current == 0
end

-- triggers at intervals
local function collisionSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = Ut.getEnemyEntities(world)
    local player = Ut.getPlayerEntity(world)
    updateTimer(player, dt)
    if isTimeForCollision(player) then
        for _,e in pairs(ents) do
            if aabb(player, e) then
                print(player.health, "player health")
                player.health = player.health - 1
                if player.health < 0 then
                    print("player is dead :(")
                end
            end
        end
    end
end

local function addCollSystem(world)
    world:addSystem(collisionSystem)
end

return addCollSystem
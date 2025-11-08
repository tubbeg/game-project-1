
local Ut = require "systems/utility"

local function setDirection(player)
    player.direction[1] = "NONE"
    player.direction[2] = "NONE"
    if love.keyboard.isDown("w") then
        player.direction[2] = "UP"
    end
    if love.keyboard.isDown("a") then
        player.direction[1] = "LEFT"
    end
    if love.keyboard.isDown("s") then
        player.direction[2] = "DOWN"
    end
    if love.keyboard.isDown("d") then
        player.direction[1] = "RIGHT"
    end
end

local function controlSystem(e, dt)
    setDirection(e)
end

local function addControlSystem(world)
    world:addForeachSystem(Ut.playerPredicate, controlSystem, "logic")
end


return addControlSystem
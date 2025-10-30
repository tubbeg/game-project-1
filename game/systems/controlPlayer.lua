

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

local function addControlSystem(world)
    local moveSystem = Tiny.processingSystem()
    moveSystem.logicSystem = true
    moveSystem.filter = Tiny.requireAll("player", "position", "direction")
    function moveSystem:process(e, dt) setDirection(e) end
    Tiny.addSystem(world, moveSystem)
end


return addControlSystem
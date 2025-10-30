

local function addMoveSystem(world)
    local moveSystem = Tiny.processingSystem()
    moveSystem.logicSystem = true
    moveSystem.filter = Tiny.requireAll("player", "position", "direction")
    function moveSystem:process(e, dt)
        if e.direction[1] == "LEFT" then
            e.position.x = e.position.x - 1
        end
        if e.direction[1] == "RIGHT" then
            e.position.x = e.position.x + 1
        end
        if e.direction[2] == "UP" then
            e.position.y = e.position.y - 1
        end
        if e.direction[2] == "DOWN" then
            e.position.y = e.position.y + 1
        end
    end
    Tiny.addSystem(world, moveSystem)
end



return addMoveSystem
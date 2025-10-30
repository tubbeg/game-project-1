
local function addDrawSystem(world)
    local moveSystem = Tiny.processingSystem()
    moveSystem.graphicSystem = true
    moveSystem.filter = Tiny.requireAll("player", "position", "direction",  "image")
    function moveSystem:process(e, dt)
        love.graphics.draw(e.image, e.position.x, e.position.y)
    end
    Tiny.addSystem(world, moveSystem)
end




return addDrawSystem
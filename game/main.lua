Board = require "board"
Tiny = require "tiny-ecs/tiny"

local WIDTH = 800
local HEIGHT = 600

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end

local world = Tiny.world()
local logicSystem = Tiny.requireAll("logicSystem")
local graphicSystem = Tiny.rejectAll("logicSystem")

--[[
Idea for a game: survivorlike

just a silly sideproject
nothing serious
just for fun :) 
]]

--[[
Prioritize getting a working prototype.
Ignore problems such as:
    * rescaling
    * resolution
    * save state
    * UI

For now
]]


local function addSystems(world)
    local moveSystem = Tiny.processingSystem()
    moveSystem.logicSystem = true
    moveSystem.filter = Tiny.requireAll("player", "position", "direction")
    function moveSystem:process(e, dt)
        print("Here is my logic ECS system", dt)
        print(e.direction)
    end
    Tiny.addSystem(world, moveSystem)
end


local function addPlayerEntity(world)
    local position = {x=10,y=50}
    local direction = {hello="there"}
    local entity = {player=true, position=position, direction=direction}
    Tiny.addEntity(world, entity)
end


function love.load()
    love.window.setMode( WIDTH, HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    addSystems(world)
    addPlayerEntity(world)
    --Images.banana = love.graphics.newImage("assets/banana.png")
end

function love.keypressed(key)
    for i,entity in ipairs(world.entities) do
        if entity.player then
            if key == "a" then
                if entity then
                    entity.direction = "LEFT"
                end
            end
        end
    end
end

function love.update(dt)
    world:update(dt, logicSystem)
end

function love.draw()
    world:update(love.timer.getDelta(), graphicSystem)
    --love.graphics.draw(Images.banana, 300, 200, 0, 3,3)
end
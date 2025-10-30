Tiny = require "tiny-ecs/tiny"
local addMoveSys = require "systems/movePlayer"
local addDrawSys = require "systems/drawPlayer"
local addCtrlSys = require "systems/controlPlayer"

local WIDTH = 800
local HEIGHT = 600

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end

local w = Tiny.world()
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
    addMoveSys(world)
    addDrawSys(world)
    addCtrlSys(world)
end


local function addPlayerEntity(world)
    local position = {x=10,y=50}
    local direction = {[1]="NONE",[2]="NONE"}
    local image = love.graphics.newImage("assets/banana.png")
    local entity = 
        {
            image=image,
            player=true,
            position=position,
            direction=direction
        }
    Tiny.addEntity(world, entity)
end


function love.load()
    love.window.setMode( WIDTH, HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    addSystems(w)
    addPlayerEntity(w)
end

--[[
function love.keypressed(key)
    for i,entity in ipairs(w.entities) do
        if entity.player then
            if key == "w" then
                entity.direction = "UP"
            elseif key == "a" then
                entity.direction = "LEFT"
            elseif key == "s" then
                entity.direction = "DOWN"
            elseif key == "d" then
                entity.direction = "RIGHT"
            else
                entity.direction = {}
            end
        end
    end
end]]

function love.update(dt) w:update(dt, logicSystem) end

function love.draw() w:update(love.timer.getDelta(), graphicSystem) end
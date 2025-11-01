Min = require "min-ecs/min-ecs"
local addMoveSys = require "systems/movePlayer"
local addDrawSys = require "systems/drawImage"
local addCtrlSys = require "systems/controlPlayer"

local WIDTH = 800
local HEIGHT = 600

local function defaultPosition()
    return {x=WIDTH/2, y=HEIGHT/2}
end

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end

local minWorld = Min:new()

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
    local position = defaultPosition()
    local direction = {[1]="NONE",[2]="NONE"}
    local image = love.graphics.newImage("assets/banana.png")
    local entity =
        {
            image=image,
            player=true,
            position=position,
            direction=direction,
            z = 0
        }
    world:addEntity(entity)
end


local function addBoardEntity(world)
    local position = {x=-1000,y=-1000}
    local image = love.graphics.newImage("assets/background.png")
    local entity =
        {
            image=image,
            board=true,
            position=position,
            z = 100
        }
    world:addEntity(entity)
end



function love.load()
    love.window.setMode( WIDTH, HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    addSystems(minWorld)
    addPlayerEntity(minWorld)
    addBoardEntity(minWorld)
end

function love.update(dt) minWorld:update(dt, "logic") end

function love.draw() minWorld:update(love.timer.getDelta(), "draw") end
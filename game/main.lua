Min = require "min-ecs/min-ecs"
local addMoveSys = require "systems/movePlayer"
local addEnMoveSys = require "systems/moveEnemy"
local addDrawSys = require "systems/drawImage"
local addCtrlSys = require "systems/controlPlayer"
local spawnE = require "systems/spawnEnemy"
local lookAt = require "systems/lookAtPlayer"
local initEnts = require "initEntities"

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
    * balance
    * UI

For now
]]


local function addSystems(world)
    addMoveSys(world)
    addDrawSys(world)
    addCtrlSys(world)
    spawnE(world)
    addEnMoveSys(world)
    lookAt(world)
end


function love.load()
    love.window.setMode(initEnts.WIDTH, initEnts.HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    addSystems(minWorld)
    initEnts.addImagesEntity(minWorld)
    initEnts.addPlayerEntity(minWorld)
    initEnts.addBoardEntity(minWorld)
    initEnts.addEnemyTimerEntity(minWorld)
    initEnts.addCameraEntity(minWorld)
end

local function getCameraEntity(world)
    local ents = world:query(function (entity) return entity.cam end)
    return ents[1]
end


function love.update(dt)
    minWorld:update(dt, "logic")
end

function love.draw()
    local c = getCameraEntity(minWorld)
    c.cam:attach()
        minWorld:update(love.timer.getDelta(), "draw")
    c.cam:detach()
end
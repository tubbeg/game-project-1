
local Camera = require "camera/camera"

local InitEntities = {}

InitEntities.WIDTH = 800
InitEntities.HEIGHT = 600

local function getImagesEntity(world)
    local entities = world:query(function(entity) return entity.images end)
    return entities[1]
end

local function defaultPosition()
    return {x=InitEntities.WIDTH/2, y=InitEntities.HEIGHT/2}
end

function InitEntities.addImagesEntity(world)
    local entity =
        {
            images =
                {
                    banana = love.graphics.newImage("assets/banana.png"),
                    background = love.graphics.newImage("assets/background.png")
                }
        }
    world:addEntity(entity)
end

function InitEntities.getImagesEntity(world)
    local entities = world:query(function(entity) return entity.images end)
    return entities[1]
end

function InitEntities.addPlayerEntity(world)
    local image = getImagesEntity(world).images.banana
    local position = defaultPosition()
    local w,h = image:getDimensions()
    position.x = position.x - (w * 0.7)
    position.y = position.y - (h * 0.5)
    local direction = {[1]="NONE",[2]="NONE"}
    local entity =
        {
            image=image,
            player=true,
            position=position,
            direction=direction,
            z = 0,
            health = 100,
            collisionTimer = {limit=0.5, current=0},
            hitbox = {w=w*0.5,h=h*0.5}
        }
    world:addEntity(entity)
end


function InitEntities.addEnemyTimerEntity(world)
    local entity =
        {
            timer =
                {
                    current = 0,
                    limit = function (difficulty) return difficulty * 0.5 end
                }
        }
    world:addEntity(entity)
end


function InitEntities.addBoardEntity(world)
    local position = {x=-1000,y=-1000}
    local image = getImagesEntity(world).images.background
    local entity =
        {
            image=image,
            board=true,
            position=position,
            z = 100
        }
    world:addEntity(entity)
end


function InitEntities.addCameraEntity(world)

    local entity =
        {
            cam = Camera()
        }
    world:addEntity(entity)
end


return InitEntities

local Ut = require "systems/utility"

local function getBackgroundEntity(world)
    local ents = world:query(function (entity) return entity.board end)
    return ents[1]
end


local function clampCameraSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local cam = Ut.getCameraEntity(world).cam
    local be = getBackgroundEntity(world)
    local beW, beH = be.image:getDimensions()
    local width, height = love.graphics.getWidth(), love.graphics.getHeight()
    if width/3 > cam.x then
        cam.x = width/3
    end
    if height/3 > cam.y then
        cam.y = height/3
    end
    if beW/3 < cam.x then
        cam.x = beW/3
    end
    if beH/3 < cam.y then
        cam.y = beH/3
    end

end

local function addclampSystem(world)
    world:addSystem(clampCameraSystem)
end

return addclampSystem
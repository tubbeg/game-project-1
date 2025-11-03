local predicate = function (entity)
    return entity.cam
end

local function getBackgroundEntity(world)
    local ents = world:query(function (entity) return entity.board end)
    return ents[1]
end


local function clampCameraSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = world:query(predicate)
    local be = getBackgroundEntity(world)
    local beW, beH = be.image:getDimensions()
    local width, height = love.graphics.getWidth(), love.graphics.getHeight()
    for _,e in pairs(ents) do
        if width/3 > e.cam.x then
            e.cam.x = width/3
        end
        if height/3 > e.cam.y then
            e.cam.y = height/3
        end
        if beW/3 < e.cam.x then
            e.cam.x = beW/3
        end
        if beH/3 < e.cam.y then
            e.cam.y = beH/3
        end
    end
end

local function addclampSystem(world)
    world:addSystem(clampCameraSystem)
end

return addclampSystem
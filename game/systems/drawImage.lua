



local predicate = function (entity)
    return entity.position and entity.image
end

local sortFn = function (entity1, entity2)
    return entity1.z > entity2.z
end

local function addImageSystem(world)
    local function drawSystem(e, dt)
        local w,h = e.image:getDimensions()
        w,h = w * 0.5, h * 0.5
        love.graphics.draw(e.image, e.position.x, e.position.y)
    end
    world:addForeachSystem(predicate, drawSystem, "draw", sortFn)
end


return addImageSystem
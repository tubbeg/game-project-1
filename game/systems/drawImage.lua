



local predicate = function (entity)
    return entity.position and entity.image
end

local sortFn = function (entity1, entity2)
    return entity1.z > entity2.z
end


local function drawPlayer(playerEntity)

    love.graphics.draw(playerEntity.image, playerEntity.position.x, playerEntity.position.y)
    --local w,h = playerEntity.image:getDimensions()
    --w,h = w * 0.65, h * 0.5
    --love.graphics.draw(playerEntity.image, playerEntity.position.x, playerEntity.position.y, nil, 1, 1, w, h)
end



local function addImageSystem(world)
    local function drawSystem(e, dt)
        if e.player then
            drawPlayer(e)
        else
            love.graphics.draw(e.image, e.position.x, e.position.y)
        end
    end
    world:addForeachSystem(predicate, drawSystem, "draw", sortFn)
end


return addImageSystem

local Ut = require "systems/utility"

local sortFn = function (entity1, entity2)
    return entity1.z > entity2.z
end

local function addImageSystem(world)
    local function drawSystem(e, dt)
        love.graphics.draw(e.image, e.position.x, e.position.y)
    end
    world:addForeachSystem(Ut.imagePredicate, drawSystem, "draw", sortFn)
end


return addImageSystem

local predicate = function (entity)
    return entity.cam
end

local function getPlayerEntity(world)
    local ents = world:query(function (entity) return entity.player end)
    return ents[1]
end

local function lookAtSystem(world, dt, filter)
    if filter ~= "logic" then return end
    local ents = world:query(predicate)
    local playerEntity =  getPlayerEntity(world)
    local w,h = playerEntity.image:getDimensions()
    w,h = w * 0.65, h * 0.5
    for _,e in pairs(ents) do
        e.cam:lookAt(playerEntity.position.x + w, playerEntity.position.y + h)
    end
end

local function addLookAtSystem(world)
    world:addSystem(lookAtSystem)
end

return addLookAtSystem
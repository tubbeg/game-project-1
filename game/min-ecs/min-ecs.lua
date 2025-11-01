-- minimal ecs
local Min = {}


--[[
    TODO:
        * Add method for removing entities
        * Add method for removing systems
    ]]

-- creates (instantiates) a new min-ecs
function Min:new()
    local ecs =
        {
            entities={},
            systems={}
        }
    setmetatable(ecs, self)
    self.__index = self
    return ecs
end

-- returns a list of entities where the predicate returns true.
-- The predicate is a function which takes a parameter entity
-- and returns a boolean
function Min:query(pred)
    local entities = {}
    for i,entity in ipairs(self.entities) do
        if entity then
            if pred(entity) then
                table.insert(entities, entity)
            end
        end
    end
    return entities
end

-- a system is a function which takes
-- two parameters:
--  * the ECS world reference
--  * dt - delta time
--  * filter - a string for filtering systems. For example with Love2D, if you only need
--    to trigger a function during love.draw then you can add a "draw-system" string as your
--    and filter that in your function (system)
function Min:addSystem(system) table.insert(self.systems, system) end

-- adds a particuliar type of system which iterates over every entity
-- this type of system is great when you don't need to compare entities
-- sortFn is an optional parameter which is used to sort the entities
function Min:addForeachSystem(pred, fun, filter, sortFn)
    local function f(world, dt, fltr)
        if fltr ~= filter then return end
        local ents = world:query(pred)
        if sortFn then
            table.sort(ents, sortFn)
        end
        for i, entity in ipairs(ents) do
            fun(entity, dt)
        end
    end
    self:addSystem(f)
end

-- an entity in min-ecs is just a Lua table
function Min:addEntity(entity) table.insert(self.entities, entity) end

-- iterates through the list of systems and executes each system (function)
function Min:update(dt, filter)
    for i,system in ipairs(self.systems) do
        system(self, dt, filter)
    end
end

return Min
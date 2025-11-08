

local Utility = {}


Utility.playerPredicate = function (entity) return entity.player and entity.position and entity.image end
Utility.enemyPredicate = function (entity) return entity.enemy and entity.position and entity.image end
Utility.cameraPredicate = function (entity) return entity.cam  end
Utility.imagePredicate = function (entity) return entity.position and entity.image end


function Utility.getPlayerEntity(world)
    local entities = world:query(Utility.playerPredicate)
    return entities[1]
end

function Utility.getCameraEntity(world)
    return world:query(Utility.cameraPredicate)[1]
end

function Utility.getEnemyEntities(world)
    return world:query(Utility.enemyPredicate)
end

function Utility.playerIsNotDead(world)
    local player = Utility.getPlayerEntity(world)
    return player.health >= 1
end

return Utility
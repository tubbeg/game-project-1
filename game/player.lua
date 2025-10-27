
Player = {}

function Player:new()
    local p = {}
    setmetatable(p, self)
    self.__index = self
    return p
end




return Player

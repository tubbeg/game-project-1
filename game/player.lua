
Player = {}

function Player:new(x,y)
    local p = {texture="", image=nil, position={x=x,y=y}}
    setmetatable(p, self)
    self.__index = self
    return p
end

function Player:load()
    self.image = love.graphics.newImage("assets/banana.png")
end

function Player:move(x,y)
    self.position.x = x
    self.position.y = y
end

function Player:draw()
    love.graphics.draw(self.image, self.position.x, self.position.y, 0, 1.5,1.2)
end

return Player

Player = require("board")

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end


Images = {}
MyBoard = Player:new(100,100)


--[[
Idea for a game: survivorlike

just a silly sideproject
nothing serious
just for fun :) 
]]



--[[
I know that an ECS would be the most performant
method to implement this game, but I'll try OOP
as long as I can.
]]

function love.load()
    --love.graphics.setDefaultFilter("linear", "linear")
    love.graphics.setDefaultFilter("nearest", "nearest")
    Images.banana = love.graphics.newImage("assets/banana.png")
end

function love.update(dt)
    print(dt)
end

function love.draw()
    love.graphics.draw(Images.banana, 300, 200, 0, 3,3)
end
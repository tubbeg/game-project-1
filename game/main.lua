Board = require("board")

WIDTH = 800
HEIGHT = 600

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end

Images = {}
MyBoard = Board:new(100,100)

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

--[[
Prioritize getting a working prototype.
Ignore problems such as:
    * rescaling
    * resolution
    * save state
    * UI

For now
]]

function love.load()
    --love.graphics.setDefaultFilter("linear", "linear")
    love.window.setMode( WIDTH, HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    Images.banana = love.graphics.newImage("assets/banana.png")
    MyBoard:load()
end

--[[
function love.keypressed(key)
    if key == "s" then
        MyBoard:movePlayer("DOWN")
    elseif key == "a" then
    end
    print(key == "s")
end]]




function love.update(dt)
    MyBoard:update(dt)
    if love.keyboard.isDown("a") then
        print("down")
    end
end

function love.draw()
    love.graphics.draw(Images.banana, 300, 200, 0, 3,3)
    MyBoard:draw()
end

Msg = "hello"
List = {Msg,Msg,Msg}
for i,v in pairs(List) do
    print(v)
end


Images = {}


--[[
Idea for a game: survivorlike

just a silly sideproject
nothing serious
just for fun :)

]]


function love.load()
    --love.graphics.setDefaultFilter("linear", "linear")
    love.graphics.setDefaultFilter("nearest", "nearest")
    Images.banana = love.graphics.newImage("banana.png")
end

function love.draw()
    love.graphics.draw(Images.banana, 300, 200, 0, 3,3)
end
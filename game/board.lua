Player = require "player"
Timer = require "timer"
Board = {}


local function UpdateState(board)
    print("updating board", board.width)
end

function Board:new(x,y)
    local board =
        {
            width=x,
            height=y,
            player = Player:new(0,0)
        }
    board.timer = Timer:new((1/2), function() UpdateState(board) end)
    setmetatable(board, self)
    self.__index = self
    return board
end


-- board updates every 1/2 second
function Board:update(dt)
    self.timer:update(dt)
end


function Board:movePlayer(dirX, dirY)
    if not dirX and not dirY then
        return
    end
    if dirX == "DOWN" then
    end
    if dir  == "UP" then
    end
end


function Board:load()
    self.player:load()
end

function Board:draw()
    self.player:draw()
end




return Board

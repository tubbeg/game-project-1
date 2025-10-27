
Board = {}

function Board:new(x,y)
    local board = {width=x, height=y}
    setmetatable(board, self)
    self.__index = self
    return board
end




return Board

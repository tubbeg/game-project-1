local Timer = {}

function Timer:new(limit, callback)
    local timer =
        {
            limit = limit,
            current = 0,
            cb = callback
        }
    setmetatable(timer, self)
    self.__index = self
    return timer
end


function Timer:update(dt)
    if self.current >= self.limit then
        self.cb()
        self.current = 0
    else
        self.current = self.current + dt
    end
end


return Timer

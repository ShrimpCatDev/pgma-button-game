local bg={}

function bg:init(parent,bounds)
    self.parent=parent
    self.bounds=bounds
end

function bg:update(dt)

end

function bg:draw()
    love.graphics.clear(color("#f68181"))
end

return bg
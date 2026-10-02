local bg={}

function bg:init(parent,bounds)
    self.parent=parent
    self.bounds=bounds
end

function bg:update(dt)

end

function bg:draw()
    love.graphics.clear(color("#4d9be6"))
end

return bg
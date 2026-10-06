local fish={}

function fish:init(parent)
    self.fish={}
    parent:get("fish",function(data,x,y)
        table.insert(self.fish,{x=x*8,y=y*8})
    end)
end

function fish:update(dt)

end

function fish:draw()
    for k,v in ipairs(self.fish) do
        sheet:draw(32,v.x,v.y)
    end
end

return fish
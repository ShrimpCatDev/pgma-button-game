local deco={}

function deco:init(parent,map)
    self.map=map
    self.parent=parent

    self.leaves={}
    for k,v in ipairs(self.map.layers.leaves.objects) do
        local l=setmetatable({}, {__index=require("entity.tree")})
        l:init(parent,v.x,v.y)
        table.insert(self.leaves,l)
    end

    local d=map.layers.leaves
    d.draw=function()
        --map:drawObjectLayer(d)
        for k,v in ipairs(self.leaves) do
            v:draw()
        end
    end

end

function deco:update(dt)
    for k,v in ipairs(self.leaves) do
        v:update(dt)
    end
end

function deco:draw()
    
end

return deco
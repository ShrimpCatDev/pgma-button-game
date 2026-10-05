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
end

function deco:update(dt)
    for k,v in ipairs(self.leaves) do
        v:update(dt)
    end
end

function deco:draw()
    for k,v in ipairs(self.leaves) do
        v:draw()
    end
end

return deco
local items={}

function items:get(kind,func,layer)
    local l=layer or "items"
    local map=self.map
    for x=0,map.width-1 do
        for y=0,map.height-1 do
            local data=map:getTileProperties(l,x+1,y+1)
            if data.kind==kind then
                func(data,x,y)
                map:setLayerTile(l,x+1,y+1,0)
            end
        end
    end
end

function items:init(parent,map)
    self.map=map
    self.parent=parent

    require "lib/require"
    self.items=require.tree("entity.items")

    for k,v in pairs(self.items) do
        if v.init then v:init(self) end
    end

    local d=map.layers.items
    d.draw=function()
        for k,v in pairs(self.items) do
            if v.draw then v:draw() end
        end
    end
end

function items:update(dt)
    for k,v in pairs(self.items) do
        if v.update then v:update(dt) end
    end
end

return items
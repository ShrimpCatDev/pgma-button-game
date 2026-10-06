local fish={}
local anim=require("lib.anim")

function fish:init(parent)
    self.parent=parent
    self.fish={}
    self.anim=anim.new({32,33,34,35,34,33},120,"loop")
    parent:get("fish",function(data,x,y)
        table.insert(self.fish,{x=x*8,y=y*8-3,gid=#self.fish})
    end)
end

function fish:update(dt)
    self.anim:update(dt)
    local r={}
    local pl=self.parent.parent.player
    for k,v in ipairs(self.fish) do
        if math.collision(v.x+1,v.y+1,6,6,pl.x,pl.y,pl.w,pl.h) then
            table.insert(r,k)
        end
    end
    for k,v in ipairs(r) do
        table.remove(self.fish,v)
    end
end 

function fish:draw()
    for k,v in ipairs(self.fish) do
        sheet:draw(self.anim:get(),v.x,v.y+math.cos(love.timer.getTime()*8+(v.gid*0.7))*2)
    end
end

return fish
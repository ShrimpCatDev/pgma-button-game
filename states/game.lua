local game={}

function game:enter()
    shove.createLayer("terrain")
    self.world=require("utils/world")

    self.player=require("entity/player")
    self.player:init(0,0,self)

    self.map=sti("assets/map/test.lua",{"bump"})
    self.map:bump_init(self.world)

    self.camera=require("utils/camera")
    self.camera:init(0,0,conf.gw,conf.gh)
    self.camera:setTarget(self.player)

    --world:add({platform=true},0,128-8,144,8)
end

function game:update(dt)
    self.player:update(dt)
    self.camera:update(dt)  
end

function game:draw()
    shove.beginDraw()
        shove.beginLayer("terrain")
            self.camera:push()
                self.map:draw(-self.camera.x,-self.camera.y)
                self.player:draw()
            self.camera:pop()
        shove.endLayer()
    shove.endDraw()
end

return game
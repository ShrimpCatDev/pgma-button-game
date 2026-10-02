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
    self.camera:setBounds(0,0,self.map.width*self.map.tilewidth,self.map.height*self.map.tileheight)

    --world:add({platform=true},0,128-8,144,8)
    self.outline=love.graphics.newCanvas(conf.gw,conf.gh)
end

function game:update(dt)
    self.player:update(dt)
    self.map:update(dt)
    
    for k,v in ipairs(self.map.layers.bounds.objects) do
        if math.collision(v.x,v.y,v.width,v.height,self.player.x,self.player.y,self.player.w,self.player.h) then
            self.camera:setBounds(v.x,v.y,v.width,v.height)
        end
    end

    self.camera:update(dt)  
end

function game:draw()
    love.graphics.setCanvas(self.outline)
        love.graphics.clear()
        self.camera:push()
            self.map:draw(-self.camera.dx,-self.camera.dy)
            self.player:draw()
        self.camera:pop()
    love.graphics.setCanvas()

    shove.beginDraw()
        shove.beginLayer("terrain")
            love.graphics.clear(color("#4d9be6"))

            love.graphics.setColor(0,0,0,1)
                love.graphics.draw(self.outline,-1,0)
                love.graphics.draw(self.outline,1,0)
                love.graphics.draw(self.outline,0,-1)
                love.graphics.draw(self.outline,0,1)

                love.graphics.draw(self.outline,-1,1)
                love.graphics.draw(self.outline,1,1)
                love.graphics.draw(self.outline,-1,-1)
                love.graphics.draw(self.outline,1,-1)
            love.graphics.setColor(1,1,1,1)

            love.graphics.draw(self.outline,0,0)
        shove.endLayer()
    shove.endDraw()
end

return game
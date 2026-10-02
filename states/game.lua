local game={}

function game:enter()
    --just making the rendering layer(s)
    shove.createLayer("terrain")

    --physics world
    self.world=require("utils/world")

    --loading the player
    self.player=require("entity/player")
    self.player:init(0,0,self)

    --loading up the map
    self.map=sti("assets/map/test.lua",{"bump"})
    self.map:bump_init(self.world)

    --loading the camera
    self.camera=require("utils/camera")
    self.camera:init(0,0,conf.gw,conf.gh)

    self.camera:setTarget(self.player)
    self.camera:setBounds(0,0,self.map.width*self.map.tilewidth,self.map.height*self.map.tileheight)

    --the outline canvas for devious outlining things
    self.outline=love.graphics.newCanvas(conf.gw,conf.gh)
end

function game:update(dt)
    self.player:update(dt) --self explanitory lol
    self.map:update(dt) --makes it so the map can have animations and stuffs
    
    --setting the camera bounds to particulat areas of the map,
    --if you want to add your own bounds add a rectangle to the bounds layer in tiled!
    for k,v in ipairs(self.map.layers.bounds.objects) do
        if math.collision(v.x,v.y,v.width,v.height,self.player.x,self.player.y,self.player.w,self.player.h) then
            self.camera:setBounds(v.x,v.y,v.width,v.height) --there's probably a much better way to do this but im lazy so i dont care haha
        end
    end

    self.camera:update(dt)  --camera follow player yes
end

function game:draw()
    --the outline canvas
    love.graphics.setCanvas(self.outline)
        
        love.graphics.clear()--i forgot this at one point and everything looked cursed

        --apply everything to the camera position
        self.camera:push()
            self.map:draw(-self.camera.dx,-self.camera.dy) --draw the map (gonna replace this with a more reliable function soon)
            self.player:draw() --draw the player
        self.camera:pop()

    love.graphics.setCanvas()


    --begin the screen scaling renderer thing idk
    shove.beginDraw()
        --terrain layer
        shove.beginLayer("terrain")
            --will change this with a better background trust the process :3
            love.graphics.clear(color("#4d9be6"))

            --probably should just make a shader instead qwp
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

            --draw the ouline canvas to the layer (this one is just the normal one)
            love.graphics.draw(self.outline,0,0)
        shove.endLayer()
    shove.endDraw()
end

return game
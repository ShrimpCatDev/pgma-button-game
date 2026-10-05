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

    require "lib/require"
    --background system
    self.bgs=require.tree("backgrounds")
    self.bg={
        canvas=love.graphics.newCanvas(conf.gw,conf.gh),
        overlayCanvas=love.graphics.newCanvas(conf.gw,conf.gh),
        fade=0,
        paused=false,
        timer=timer.new()
    }

    self.deco=require("deco")
    self.deco:init(self,self.map)
end

function game:update(dt)
    self.deco:update(dt)
    self.player:update(dt) --self explanitory lol
    self.map:update(dt) --makes it so the map can have animations and stuffs

    self.bg.timer:update(dt)

    local e
    for k,v in ipairs(self.map.layers.bounds.objects) do
        if math.collision(v.x,v.y,v.width,v.height,self.player.x+4,self.player.y+4,1,1) then
            e=v
            break
        end
    end

    if e~=self.activeBounds then
        self.activeBounds=e
        if e then
            self.camera:setBounds(e.x,e.y,e.width,e.height)
            self:bounds(e)
        else
            self.camera:setBounds(0,0,self.map.width*self.map.tilewidth,self.map.height*self.map.tileheight)
        end
    end

    self.camera:update(dt)  --camera follow player yes
    if self.bg.current and self.bg.current.update then self.bg.current:update(dt) end
end

--change background image when bounds is changed
function game:bounds(bounds)
    local b=self.bgs[bounds.properties.bg]
    if b then
        self.bg.timer:tween(0.2,self.bg,{fade=1},"out-cubic",function()
            self.bg.current=nil
            self.bg.current=b
            love.graphics.setCanvas(self.bg.canvas)
            love.graphics.clear()
            love.graphics.setCanvas(self.bg.overlayCanvas)
            love.graphics.clear()
            love.graphics.setCanvas()
            self.bg.current:init(self,bounds)

            self.bg.timer:tween(0.2,self.bg,{fade=0},"out-cubic")
        end)
    end
end

function game:draw()
    --the background canvas
    love.graphics.setCanvas(self.bg.canvas)
    if self.bg.current and self.bg.current.draw then self.bg.current:draw() end

    love.graphics.setCanvas(self.bg.overlayCanvas)
    if self.bg.current and self.bg.current.overlay then self.bg.current:overlay() end

    --the outline canvas
    
    love.graphics.setCanvas(self.outline)
        
        love.graphics.clear()--i forgot this at one point and everything looked cursed

        --apply everything to the camera position
        self.camera:push()
            --draw the map 
            for _, layer in ipairs(self.map.layers) do
                if layer.visible and layer.opacity > 0 then
                self.map:drawLayer(layer)
                end
            end
            self.deco:draw()
            self.player:draw() --draw the player
        self.camera:pop()
    
    love.graphics.setCanvas()

    --begin the screen scaling renderer thing idk
    shove.beginDraw()
        --terrain layer
        shove.beginLayer("terrain")
            --draw the background canvas
            love.graphics.draw(self.bg.canvas,0,0)

            --draw bg fade overlay
            local f=self.bg.fade
            love.graphics.setColor(0,0,0,f)
                love.graphics.rectangle("fill",0,0,conf.gw,conf.gh)
            love.graphics.setColor(1,1,1,1)

            love.graphics.setColor(0,0,0,0.5)
                love.graphics.draw(self.outline,2,2)

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

            local f=self.bg.fade
            love.graphics.setColor(1,1,1,1-f)
            love.graphics.draw(self.bg.overlayCanvas,0,0)
            love.graphics.setColor(1,1,1,1)
        shove.endLayer()
    shove.endDraw()
end

return game
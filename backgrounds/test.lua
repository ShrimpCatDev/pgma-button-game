local bg={}

function bg:init(parent,bounds)
    self.parent=parent
    self.bounds=bounds
    self.img=love.graphics.newImage("assets/bgs/mountains.png")
    self.reflection=love.graphics.newCanvas(self.img:getWidth(),self.img:getHeight())

    self.shader=love.graphics.newShader("assets/shaders/wave.glsl")

    self.shader:send("ampX",0.03)
    self.shader:send("ampY",0.0)
    self.shader:send("freqX",80.0)
    self.shader:send("freqY",0.0)
    self.shader:send("speedX",3.0)
    self.shader:send("speedY",0.0)

    self.shader:send("col",{0.3,0.6,1.0,1.0})
end

function bg:update(dt)
    self.shader:send("time",love.timer.getTime())
end

function bg:draw()
    love.graphics.clear(color("#4d9be6"))
    love.graphics.draw(self.img)

    love.graphics.setShader(self.shader)
        love.graphics.draw(self.img,0,self.img:getHeight(),0,1,-1)
    love.graphics.setShader()
    
end

function bg:overlay()
    --love.graphics.rectangle("fill",50,50,16,16)
end

return bg
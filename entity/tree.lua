local tree={}

function tree:init(parent,x,y)
    print("i made a new tree hi lol",x,y)
    self.parent=parent
    self.shader=love.graphics.newShader("assets/shaders/wave.glsl")
    self.img=love.graphics.newImage("assets/map/leaves.png")

    self.shader:send("ampX",0.01)
    self.shader:send("ampY",0.02)
    self.shader:send("freqX",10)
    self.shader:send("freqY",5)
    self.shader:send("speedX",3)
    self.shader:send("speedY",3)

    self.x,self.y=x,y
end

function tree:update(dt)
    self.shader:send("time",love.timer.getTime())
end

function tree:draw()
    love.graphics.setShader(self.shader)
    love.graphics.draw(self.img,self.x,self.y,0,1,1,self.img:getWidth()/2,self.img:getHeight()-3)
    love.graphics.setShader()
end

return tree
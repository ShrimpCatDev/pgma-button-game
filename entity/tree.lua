local tree={}

function tree:init(parent,x,y)
    print("i made a new tree hi lol",x,y)
    self.parent=parent
    self.shader=love.graphics.newShader("assets/shaders/wave.glsl")
    self.img=love.graphics.newImage("assets/map/leaves.png")

    self.shader:send("ampX",0.01)
    self.shader:send("ampY",0.02)
    self.shader:send("freqX",10.0)
    self.shader:send("freqY",5.0)
    self.shader:send("speedX",3.0)
    self.shader:send("speedY",3.0)
    self.shader:send("col",{1.0,1.0,1.0,1.0})

    self.x,self.y=x,y

    self.leaves={}
    self.remove={}
    self.lt=0
    self.mlt=0.9
    self.spos=math.random(1,80)*0.1
end

function tree:update(dt)
    self.shader:send("time",love.timer.getTime()+self.spos)

    if math.dist(self.parent.player.x,self.parent.player.y,self.x,self.y)<=conf.gw then
        self.lt=self.lt+dt
        if self.lt>=self.mlt then
            table.insert(self.leaves,{x=math.random(self.x-16,self.x+12),y=math.random(self.y-18,self.y),vx=0,vy=0,type=math.random(0,2),gain=math.random(5,20)})
            self.lt=0
        end
    end

    self.remove={}
    for k,v in ipairs(self.leaves) do
        v.vx=v.vy+v.gain*dt
        v.x=v.x+v.vx
        v.y=v.y+10*dt
        if v.y>self.parent.camera.y+conf.gh then
            table.insert(self.remove,k)
        end
    end
    for k,v in ipairs(self.remove) do
        table.remove(self.leaves,v)
    end
end

function tree:draw()
    for k,v in ipairs(self.leaves) do
        sheet:draw(v.type,v.x,v.y)
    end

    love.graphics.setShader(self.shader)
    love.graphics.draw(self.img,self.x,self.y,0,1,1,self.img:getWidth()/2,self.img:getHeight()-3)
    love.graphics.setShader()
end

return tree
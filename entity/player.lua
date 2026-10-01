local player={}

function player:init(x,y,world)
    self.world=world
    self.x=x or 0
    self.y=y or 0
    self.w=8
    self.h=8

    world:add(self,self.x,self.y,self.w,self.h)

    self.vx=0
    self.vy=0
    self.img=love.graphics.newImage("assets/sprites/player.png")
end

function player:update(dt)
    self.vy=self.vy+self.world.gravity*dt
    self.y=self.y+self.vy*dt

    local ax,ay=self.world:move(self,self.x,self.y)
    self.x,self.y=ax,ay
end

function player:draw()
    love.graphics.setColor(1,1,1,0.5)
    love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
    love.graphics.setColor(1,1,1,1)

    love.graphics.draw(self.img,self.x,self.y-(self.img:getHeight()-self.h))
end

return player
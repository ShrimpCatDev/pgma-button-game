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
    self.jump=false
    self.jumpHeight=64

    self.img=love.graphics.newImage("assets/sprites/player.png")
end

function player:update(dt)
    self.jump=false
    self.vy=self.vy+self.world.gravity*dt
    self.y=self.y+self.vy*dt

    local ax,ay,col,len=self.world:move(self,self.x,self.y)
    self.x,self.y=ax,ay

    for k,v in ipairs(col) do
        if v.other.platform and v.normal.y<0 then
            self.vy=0
            self.jump=true
        end
    end
end

function player:draw()
    love.graphics.setColor(1,1,1,0.5)
    love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
    love.graphics.setColor(1,1,1,1)

    love.graphics.draw(self.img,self.x,self.y-(self.img:getHeight()-self.h))
end

return player
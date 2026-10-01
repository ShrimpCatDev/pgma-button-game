local player={}

function player:init(x,y,parent)
    self.parent=parent
    self.x=x or 0
    self.y=y or 0
    self.w=8
    self.h=8

    self.parent.world:add(self,self.x,self.y,self.w,self.h)

    self.vx=0
    self.vy=0
    self.jump=false
    self.jumpHeight=90

    self.dir=1
    self.drawDir=self.dir

    self.speed=80

    self.img=love.graphics.newImage("assets/sprites/player.png")
end

function player:update(dt)
    self.jump=false
    self.vy=self.vy+self.parent.world.gravity*dt
    self.y=self.y+self.vy*dt

    if input:down("right") then
        self.vx=self.speed
        self.dir=1
    elseif input:down("left") then
        self.vx=-self.speed
        self.dir=-1
    else
        self.vx=0
    end

    self.drawDir=math.lerp(self.drawDir,self.dir,12,dt)

    self.x=self.x+self.vx*dt

    local ax,ay,col,len=self.parent.world:move(self,self.x,self.y)
    self.x,self.y=ax,ay

    for k,v in ipairs(col) do
        if (v.other.properties and v.other.properties.platform) and v.normal.y<0 then
            self.vy=0
            self.jump=true
        end
    end

    if self.jump then
        if input:pressed("jump") then
            self.vy=-self.jumpHeight
        end
    end
end

function player:draw()
    local dx,dy=math.round(self.x+self.w/2),math.round(self.y-(self.img:getHeight()-self.h))

    local a=math.abs(self.drawDir)+0.25
    
    love.graphics.setColor(a,a,a,1)
        love.graphics.draw(self.img,dx,dy,0,self.drawDir,1,self.img:getWidth()/2,0)
    love.graphics.setColor(1,1,1,1)
end

return player
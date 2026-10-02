local player={}

function player:init(x,y,parent)
    --the parent stuff makes it easier to access the world
    self.parent=parent
    self.x=x or 0
    self.y=y or 0
    self.w=8
    self.h=8

    self.parent.world:add(self,self.x,self.y,self.w,self.h) --add the player to the physics world

    self.vx=0
    self.vy=0
    self.jump=false --variable to chjeck if the player can jump/is on a platform
    self.jumpHeight=90

    self.dir=1
    self.drawDir=self.dir --this one adds the fancy flipping animation when you turn around

    self.speed=80 --player speed

    --load the players animations
    self.img=love.graphics.newImage("assets/sprites/player.png")
    local anim8=require("lib/anim8")
    local grid=anim8.newGrid(8,16,self.img:getWidth(),self.img:getHeight())
    self.anim={
        idle=anim8.newAnimation(grid("1-2",1),0.4),
        run=anim8.newAnimation(grid("3-7",1),0.08)
    }

    self.anim.current=self.anim.idle
    --honestly there HAS to be a better way to do animations
end

function player:update(dt)
    self.jump=false --haha player cant jump

    --gravity issac law edition or something
    self.vy=self.vy+self.parent.world.gravity*dt
    self.y=self.y+self.vy*dt

    --player input
    if input:down("right") then
        self.vx=self.speed
        self.dir=1
        self.anim.current=self.anim.run
    elseif input:down("left") then
        self.vx=-self.speed
        self.dir=-1
        self.anim.current=self.anim.run
    else
        self.vx=0
        self.anim.current=self.anim.idle
    end

    self.drawDir=math.lerp(self.drawDir,self.dir,12,dt) --smoothly animate the turning/flipping of le player

    self.x=self.x+self.vx*dt --move the players x by its velocity

    local ax,ay,col,len=self.parent.world:move(self,self.x,self.y) --update the players position in the physics world
    self.x,self.y=ax,ay

    for k,v in ipairs(col) do
        --check if player is on platform, if so, allow them to jump and reset the velocity
        if (v.other.properties and v.other.properties.platform) and v.normal.y<0 then
            self.vy=0
            self.jump=true
        end
    end

    --jumping
    if self.jump then
        if input:pressed("jump") then
            self.vy=-self.jumpHeight
        end
    end

    --update the players animation
    self.anim.current:update(dt)
end

function player:draw()
    local dx,dy=math.floor(self.x+self.w/2),math.floor(self.y-(self.img:getHeight()-self.h)) --the players draw position

    local a=math.abs(self.drawDir)+0.25 --shadow color for when player spins/flips
    
    love.graphics.setColor(a,a,a,1)
        self.anim.current:draw(self.img,dx,dy,0,self.drawDir,1,self.w/2,0) --draw player (with animation) hi lol
    love.graphics.setColor(1,1,1,1)
end

return player
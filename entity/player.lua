local player={}

function player.filter(item,other)
    local p = other.properties
    if not p then
        return "cross"
    end
    if p.jumpthru and p.platform then
        if item.vy>=0 and other.y>=item.prevY+item.h then
            return "slide"
        else
            return nil
        end
    else
        return "slide"
    end
end

local SEQ_WINDOW = 0.2       -- max gap between release and next press
local HOLD_THRESHOLD = 0.35  -- how long until a press counts as a hold
local ACTION_BUFFER = 0.15   -- how long a resolved key waits to be consumed
local outputMapping = {
    ["press"] = "a",
    ["press,press"] = "b",
    ["hold"] = "x",
    ["hold,press"] = "x",
    ["press,hold"] = "y"
}

-- can this sequence still grow into a longer mapping?
local function hasExtension(seqStr)
    local prefix = seqStr .. ","
    for k in pairs(outputMapping) do
        if k:sub(1, #prefix) == prefix then return true end
    end
    return false
end

function player:init(x,y,parent)
    --the parent stuff makes it easier to access the world
    self.parent=parent
    self.x=x or 0
    self.y=y or 0 
    self.w=8
    self.h=8

    self.seq = {}
    self.spaceWasDown = false
    self.heldTime = 0
    self.holdFired = false
    self.gapTimer = nil
    self.action = nil
    self.actionTimer = 0

    self.dashSpeed=260 --how fast the dash is
    self.dashTime=0.15 --how long the dash lasts
    self.dashTimer=0

    self.parent.world:add(self,self.x,self.y,self.w,self.h) --add the player to the physics world

    self.vx=0
    self.vy=0
    self.jump=false --variable to chjeck if the player can jump/is on a platform
    self.jumpHeight=120

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

    self.anim.current=self.anim.run
    --honestly there HAS to be a better way to do animations

    self.point={x=self.x,y=self.y,w=self.w,h=self.h}
end

function player:update(dt)
    self.jump=false --haha player cant jump

    --gravity issac law edition or something
    self.prevY=self.y
    self.vy=self.vy+self.parent.world.gravity*dt
    self.y=self.y+self.vy*dt

    --player input
    --[[if input:down("right") then
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
    end]]

    self:updateInput(dt)




    self.drawDir=math.lerp(self.drawDir,self.dir,12,dt) --smoothly animate the turning/flipping of le player

    -- self.x=self.x+(self.speed*self.dir)*dt --move the players x by its velocity
    --dashing
    if self.dashTimer<=0 and self:consume("b") then
        self.dashTimer=self.dashTime
    end

    local moveSpeed=self.speed
    if self.dashTimer>0 then
        self.dashTimer=self.dashTimer-dt
        moveSpeed=self.dashSpeed
        self.vy=0 --hang in the air while dashing
    end

    self.x=self.x+(moveSpeed*self.dir)*dt --move the players x by its velocity

    
    local ax,ay,col,len=self.parent.world:move(self,self.x,self.y,self.filter) --update the players position in the physics world
    self.x,self.y=ax,ay

    for k,v in ipairs(col) do
        --check if player is on platform, if so, allow them to jump and reset the velocity
        if (v.other.properties and v.other.properties.platform) and v.normal.y<0 then
            self.vy=0
            self.jump=true

        end

        if (v.other.properties and v.other.properties.platform) and v.normal.y>0 and not v.other.properties.jumpthru then
            self.vy=0
        end

        if (v.other.properties and v.other.properties.platform) and v.normal.x~=0 and v.normal.y==0 then
            self.dir=v.normal.x
        end
    end

    --jumping
    if self.jump then
        if self:consume("a") then
            self.vy=-self.jumpHeight
        end
    end

    --update the players animation
    self.anim.current:update(dt)

    self.point.x=math.floor(self.x+4+(32*self.dir))
    self.point.y=math.floor(self.y+4)
end

function player:draw()
    local dx,dy=math.floor(self.x+self.w/2),math.floor(self.y-(self.img:getHeight()-self.h)) --the players draw position

    local a=math.abs(self.drawDir)+0.25 --shadow color for when player spins/flips
    
    love.graphics.setColor(a,a,a,1)
        self.anim.current:draw(self.img,dx,dy,0,self.drawDir,1,self.w/2,0) --draw player (with animation) hi lol
    love.graphics.setColor(1,1,1,1)
end

function player:updateInput(dt)
    local down = love.keyboard.isDown("space")
    local pressed = down and not self.spaceWasDown
    local released = not down and self.spaceWasDown

    if pressed then
        self.heldTime = 0
        self.holdFired = false
        self.gapTimer = nil -- an input is in progress, don't resolve yet
    end

    if down then
        self.heldTime = self.heldTime + dt
        if not self.holdFired and self.heldTime >= HOLD_THRESHOLD then
            self.holdFired = true
            self:pushInput("hold") -- fires while held, not on release
        end
    end

    if released and not self.holdFired then
        self:pushInput("press")
    end

    if not down and self.gapTimer then
        self.gapTimer = self.gapTimer - dt
        if self.gapTimer <= 0 then
            self.seq = {}        -- already fired in pushInput, just discard
            self.gapTimer = nil
        end
    end

    if self.action then
        self.actionTimer = self.actionTimer - dt
        if self.actionTimer <= 0 then
            self.action = nil
        end
    end

    self.spaceWasDown = down
end

function player:pushInput(kind)
    table.insert(self.seq, kind)
    local seqStr = table.concat(self.seq, ",")
    if hasExtension(seqStr) then
        -- fire what we have right now, upgrade later if more input comes
        local key = outputMapping[seqStr]
        if key then
            self.action = key
            self.actionTimer = ACTION_BUFFER
        end
        self.gapTimer = SEQ_WINDOW
    else
        self:resolveInput() -- nothing longer possible, fire now
    end
end

function player:resolveInput()
    local key = outputMapping[table.concat(self.seq, ",")]
    if key then
        self.action = key
        self.actionTimer = ACTION_BUFFER
    end
    self.seq = {}
    self.gapTimer = nil
end

-- returns true once if key is pending, then clears it
function player:consume(key)
    if self.action == key then
        -- self.action = nil
        return true
    end
    return false
end

return player
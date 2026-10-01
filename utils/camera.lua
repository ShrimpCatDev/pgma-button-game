local camera={}

function camera:init(x,y,w,h)
    self.x=x or 0
    self.y=y or 0
    self.w=w or conf.gw
    self.h=h or conf.gh

    self.dx=self.x
    self.dy=self.y
end

function camera:setBounds(x,y,w,h)
    self.bounds={x=x,y=y,w=w,h=h}
end

function camera:setTarget(entity)
    self.target=entity
end

function camera:update(dt)
    if self.target then
        self.x=self.target.x+self.target.w/2-self.w/2
        self.y=self.target.y+self.target.h/2-self.h/2
    end
    if self.bounds then
        
        self.x=math.clamp(self.x,self.bounds.x,self.bounds.x+self.bounds.w-self.w)
        self.y=math.clamp(self.y,self.bounds.y,self.bounds.y+self.bounds.h-self.h)
    end

    local a=1-math.exp(-12*dt)
    self.dx=self.dx+(self.x-self.dx)*a
    self.dy=self.dy+(self.y-self.dy)*a
end

function camera:push()
    love.graphics.push()
    love.graphics.translate(math.round(-self.dx),math.round(-self.dy))
end

function camera:pop()
    love.graphics.pop()
end

return camera
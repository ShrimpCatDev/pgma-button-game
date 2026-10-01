local camera={}

function camera:init(x,y,w,h)
    self.x=x or 0
    self.y=y or 0
    self.w=w or conf.gw
    self.h=h or conf.gh
end

function camera:setTarget(entity)
    self.target=entity
end

function camera:update(dt)
    if self.target then
        self.x=self.target.x+self.target.w/2-self.w/2
        self.y=self.target.y+self.target.h/2-self.h/2
    end
end

function camera:push()
    love.graphics.push()
    love.graphics.translate(math.round(-self.x),math.round(-self.y))
end

function camera:pop()
    love.graphics.pop()
end

return camera
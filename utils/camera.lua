local camera={}
--jake sorry if my code sucks im not the best at making camera systems TwT

--self explanitory
function camera:init(x,y,w,h)
    self.x=x or 0
    self.y=y or 0
    self.w=w or conf.gw
    self.h=h or conf.gh

    self.dx=self.x
    self.dy=self.y
end

--set the camera's bounds to a rectangle so the camera ALWAYS stays inside it
--use camera.bounds=nil to remove this restriction ofc
function camera:setBounds(x,y,w,h)
    self.bounds={x=x,y=y,w=w,h=h}
end

--honestly didnt need to make a function for this
function camera:setTarget(entity)
    self.target=entity
end

--yes
function camera:update(dt)
    --set the cameras root position to the target if there is one
    if self.target then
        self.x=self.target.x+self.target.w/2-self.w/2
        self.y=self.target.y+self.target.h/2-self.h/2
    end

    --clamp to the bounds if there is one
    if self.bounds then
        self.x=math.clamp(self.x,self.bounds.x,self.bounds.x+self.bounds.w-self.w)
        self.y=math.clamp(self.y,self.bounds.y,self.bounds.y+self.bounds.h-self.h)
    end

    --smoothly move to the position ya lol
    local a=1-math.exp(-10*dt)
    self.dx=self.dx+(self.x-self.dx)*a
    self.dy=self.dy+(self.y-self.dy)*a
end

--starts the cameras translation
function camera:push()
    love.graphics.push()
    love.graphics.translate(math.floor(-self.dx),math.floor(-self.dy))
end

--finishes it
function camera:pop()
    love.graphics.pop()
end

return camera
local game={}

function game:enter()
    shove.createLayer("terrain")
    world=require("utils/world")

    self.player=require("entity/player")
    self.player:init(0,0,world)

    world:add({platform=true},0,128-8,144,8)
end

function game:update(dt)
    self.player:update(dt)
end

function game:draw()
    shove.beginDraw()
        shove.beginLayer("terrain")
            self.player:draw()
        shove.endLayer()
    shove.endDraw()
end

return game
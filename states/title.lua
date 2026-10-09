local title={}

function title:enter()
    shove.createLayer("title")
end

function title:update(dt)
    if input:pressed("start") then
        gs.switch(states.game)
    end
end

function title:draw()
    shove.beginDraw()
        shove.beginLayer("title")
            love.graphics.print("Very cool game idk")
            love.graphics.print("Press enter",0,font:getHeight()+4)
        shove.endLayer()
    shove.endDraw()
end

return title
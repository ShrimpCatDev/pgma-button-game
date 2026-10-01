function love.load()
    conf=require("conf")
    shove=require("lib/shove")
    shove.setResolution(conf.gw,conf.gh,{renderMode = "layer",scalingFilter = "nearest"})

    shove.setWindowMode(conf.gw*4,conf.gh*4,{
        resizable=true
    })

    shove.createLayer("terrain")

    sti=require("lib/sti")
    map=sti("assets/map/test.lua")
end

function love.update(dt)

end

function love.draw()
    shove.beginDraw()
        shove.beginLayer("terrain")
            map:draw()
        shove.endLayer()
    shove.endDraw()
end
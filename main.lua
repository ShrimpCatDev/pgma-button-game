function love.load()
    conf=require("conf")
    shove=require("lib/shove")
    shove.setResolution(conf.gw,conf.gh,{renderMode = "layer",scalingFilter = "nearest"})

    shove.setWindowMode(conf.gw*4,conf.gh*4,{
        resizable=true
    })

    sti=require("lib/sti")

    gs=require("lib/hump/gamestate")
    gs.registerEvents()
    gs.switch(require("states/game"))
end

function love.update(dt)

end

function love.draw()

end
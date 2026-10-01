function love.load()
    require("utils.func")
    conf=require("conf")
    color=require("lib/hex2color")
    shove=require("lib/shove")
    shove.setResolution(conf.gw,conf.gh,{renderMode = "layer",scalingFilter = "nearest"})

    shove.setWindowMode(conf.gw*4,conf.gh*4,{
        resizable=true
    })

    sti=require("lib/sti")

    local baton=require("lib/baton")
    input=baton.new(require("input"))

    gs=require("lib/hump/gamestate")
    gs.registerEvents()
    gs.switch(require("states/game"))
end

function love.update(dt)
    input:update()
end

function love.draw()

end
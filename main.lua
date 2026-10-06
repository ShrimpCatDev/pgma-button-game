unpack=unpack or table.unpack

function love.load()
    --utility functions
    require("utils.func")

    --load config
    conf=require("conf")

    --hexidecimal color values to love2d rgb values
    color=require("lib/hex2color")

    --resolution stuff
    shove=require("lib/shove")
    shove.setResolution(conf.gw,conf.gh,{renderMode = "layer",scalingFilter = "nearest"})

    shove.setWindowMode(conf.gw*4,conf.gh*4,{
        resizable=true
    })

    --map loading
    sti=require("lib/sti")

    --font
    font=require("assets/font/capy")
    love.graphics.setFont(font)

    --spritesheet
    sheet=require("lib/sheet")
    sheet:init(love.graphics.newImage("assets/map/tileset.png"),8,8)

    --input manager
    local baton=require("lib/baton")
    input=baton.new(require("input"))

    --timer manager
    timer=require("lib/hump/timer")

    --gamestate manager
    gs=require("lib/hump/gamestate")
    gs.registerEvents()
    gs.switch(require("states/game")) --gonna replace this with a better state system eventually once i add more states :3
end

function love.update(dt)
    input:update()
    timer.update()
end

function love.draw()

end
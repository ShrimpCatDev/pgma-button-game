--probably didnt need to make a seperate file for this but cleanliness is next to godliness or wtvr they say

local bump=require 'lib.bump'
local world=bump.newWorld(8)

world.gravity=240

return world
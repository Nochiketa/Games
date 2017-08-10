-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tap_count = 0
local background_img = display.newImageRect("backgroun.jpg", 360, 570)

background_img.x = display.contentCenterX
background_img.y = display.contentCenterY
local score_text = display.newText(tap_count, display.contentCenterX-80,15,native.systemFont,30)


local platform = display.newImageRect("platform.jpg", 300, 50)

platform.x = display.contentCenterX
platform.y = display.contentHeight-15

local ball = display.newImageRect("8.png", 120 , 120)

ball.x = display.contentCenterX
ball.y = display.contentCenterY

local physics = require("physics")
physics.start()
physics.addBody(ball, "dynamic",{bounce = 0.8})
physics.addBody(platform, "static")

local function pushBallUp()
ball:applyLinearImpulse(0,-0.60, ball.x, ball.y)
tap_count = tap_count+1
score_text.text = tap_count
end

ball:addEventListener("tap", pushBallUp)
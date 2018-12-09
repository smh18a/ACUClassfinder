local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local building = require("building")

local navHeight = 44
local bg
local img
local titleText
local shadowText
local desciptionText
local menuBtn

function scene:create(e)
		local index = e.params.index
		local buildings = building[index]
		local brownGradientFill = {
		type = "gradient",
		color1 = {
			87/255,
			37/255,
			230/255,
			1
		},
		color2 = {
			38/255,
			16/255,
			0/255,
			1
		},
		direction = "down" --this can me down left right up
	}
	bg = display.newRect(0, 0, _SCREEN.WIDTH, _SCREEN.HEIGHT)
	bg.x = _SCREEN.CENTER.x
	bg.y = _SCREEN.CENTER.y
	bg.fill = brownGradientFill

	img = display.newImageRect(buildings.image, 320, 400)
	img.anchorX = 0
	img.anchorY = 0
	img.y = navheight

	titleText = display.newText(buildings.name, 0, 0,native.systemFont, 24 )
	titleText.anchorX = 0
	titleText.anchorY = 1
	titleText.x = 12
	titleText.y = img.y + img.height - 12

	shadowText = display.newText(buildings.name, 0, 0, native.systemFont, 24)
	shadowText.anchorX = 0
	shadowText.anchorY = 1
	shadowText.x = titleText.x + 1
	shadowText.y = titleText.y + 1
	shadowText.fill = {0,0,0,1}



	descriptionText = display.newText({
		text = buildings.description,
		width = _SCREEN.WIDTH - 24,
		font = native.systemFont,
		fontSize = 20
		})
	descriptionText.anchorX = 0
	descriptionText.anchorY = 0
	descriptionText.x = 12
	descriptionText.y = img.y + img.height + 12

	menuBtn = display.newText("< Buildings", 0, 0, native.systemFont, 18)
	menuBtn.anchorX = 0
	menuBtn.x = 12
	menuBtn.y = navHeight * 0.5

	self.view:insert(bg)
	self.view:insert(img)
	self.view:insert(shadowText)
	self.view:insert(titleText)
	self.view:insert(descriptionText)
	self.view:insert(menuBtn)
end

function scene:show(e)
	if(e.phase == "will") then
		function menuBtn:tap(e)
			composer.gotoScene("inventory", {effect="slideRight"})
		end
		menuBtn:addEventListener("tap", menuBtn)
	end
end

function scene:hide(e)
	if(e.phase == "will") then
		composer.removeScene("detail")
	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene
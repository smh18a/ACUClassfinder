local composer = require("composer")
local scene = composer.newScene()

local bg
local building
local titleText
local inventoryText
local titleGroup

function scene:create(e)
	local brownGradientFill = {
		type = "gradient",
		color1 = {
			200/255,
			0/255,
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


	building = display.newImageRect("images/logo.png", 220, 170)
	building.alpha = 1


	local font = "AmericanTypewriter-Bold" or native.systemFont
	titleText = display.newText("", 0, 0, font, 23)
	titleText.aplha = 0


	inventoryText = display.newText("Go to Buildings", 0, 0, font, 25)
	inventoryText.alpha = 0


	titleGroup = display.newGroup()

	titleGroup:insert(building)
	titleGroup:insert(titleText)
	titleGroup:insert(inventoryText)


	titleText.y = building.height + 0.5 + 36


	inventoryText.y = titleText.y + inventoryText.height + -20


	titleGroup.x = _SCREEN.CENTER.x
	titleGroup.y = _SCREEN.CENTER.y - 48

	self.view:insert(bg)
	self.view:insert(titleGroup)


	transition.from(building,{
		time = 1000,
		yScale = 0.1,
		xScale = 0.1,
		transition = easing.outBounce,
		onComplete = function()
			print("building complete")
		end
	})
	transition.to(building,{
		time = 1000,
		aplha = 1,
		transition = easing.outQuad,
		onComplete = function()
			print("building complete")
		end
	})
	transition.to(titleText,{
		time = 1000,
		delay = 750,
		alpha = 1,
		transition = easing.outQuad,
		onComplete = function()
			inventoryText.alpha = 1
		end
	})
end


function scene:show(e)
	if(e.phase == "will") then
		function inventoryText:tap(e)
			composer.gotoScene("inventory", {effect = "slideLeft"})
			composer.gotoScene("memu - Copy", {effect = "slideRight"})
		end
		inventoryText:addEventListener("tap", inventoryText)
	end
end

function scene:hide(e)
	if(e.phase == "will") then
		composer.removeScene("menu")
	end 
end
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)


return scene
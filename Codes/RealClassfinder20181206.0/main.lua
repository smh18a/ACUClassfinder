_SCREEN = { 
	HEIGHT = display.contentHeight,
	WIDTH = display.contentWidth
}

_SCREEN.CENTER = {
	x = display.contentCenterX,
	y = display.contentCenterY
}

display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
composer.gotoScene("menu")

local composer = require ("composer")
local scene = composer.newScene()

local widget = require("widget")

local building = require("building")

local navHeight = 44
local bg
local tableView
local menuBtn

local function onRowRender(e)
	local row = e.row
	local rowIndex = row.index
	local rowLabel
	local rowThumbnail

	rowLabel = e.row.params.title
	rowThumbnail = e.row.params.thumbnail

	row.rowThumbnail = display.newImageRect(rowThumbnail, 60, 60)
	row.rowThumbnail.anchorX = 0
	row.rowThumbnail.x = 12
	row.rowThumbnail.y = row.height * 0.5

	row.rowText = display.newText(rowLabel, 0, 0, display.systemFont, 12)
	row.rowText.anchorX = 0
	row.rowText.x = row.rowThumbnail.width + row.rowThumbnail.x + 12
	row.rowText.y = row.height * 0.5
	row.rowText.fill = {0,0,0,1}

	row:insert(row.rowThumbnail)
	row:insert(row.rowText)
end

local function onRowTouch(e)
	if(e.phase == "tap") then
		if(e.target.params) then
			composer.gotoScene("detail",{
				effect = "slideLeft",
				params = {
					index = e.target.params.index
				}
			})
		end
	end
end

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

	menuBtn = display.newText("< Home", 0, 0, native.systemFont, 18)
	menuBtn.anchorX = 0
	menuBtn.x = 12
	menuBtn.y = navHeight * 0.5



	local tableView = widget.newTableView({
		left = 0,
		top = navHeight,
		height = _SCREEN.HEIGHT - navHeight,
		width = _SCREEN.HEIGHT,

		onRowRender = onRowRender,
		onRowTouch = onRowTouch

		--onRowTouch = onRowTouch
	})

	self.view:insert(bg)
	self.view:insert(tableView)
	self.view:insert(menuBtn)

	for i = 1, #building do
		local buildings =building[i].name
		local thumbnail =building[i].thumbnail
		local params = {
			isCategory = false,
			rowHeight = 60,
			rowColor = {
				default = {1,1,1,1},
				over = {1,1,1,1}
			},
			params = {
				title = buildings,
				thumbnail = thumbnail,
				index = i
			}	
		}

		tableView:insertRow(params)
	end
end

function scene:show(e)
	if(e.phase == "will") then
		function menuBtn:tap(e)
			composer.gotoScene("menu", {effect="slideRight"})
		end
		menuBtn:addEventListener("tap", menuBtn)
	end
end

function scene:hide(e)
	if(e.phase == "will") then
		composer.removeScene("inventory")
	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene
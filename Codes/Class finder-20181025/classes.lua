local composer = require( "composer" )
 
local scene = composer.newScene()

local widget = require("widget")
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local width = display.actualContentWidth
    local height = display.actualContentHeight

    local background = display.newRect(sceneGroup, 64, 79,  width, height)
    background.x = 160
    background.y = 240

    local function onStartTouch(event)
        if(event.phase == "ended") then
            composer.gotoScene("home", "slideDown")
        end
    end

     local arrow_start = widget.newButton {
         defaultFile = "arrow.png",
         overFile = "arrow.png",
         onEvent = onStartTouch
      }
      arrow_start.x = 23
      arrow_start.y = -15
      sceneGroup:insert(arrow_start)

      local function onRowRender(e)
        local row = e.row
        local rowIndex = row.rowindex

        local rowText = display.newText("# " .. rowIndex, 0, 0, system.nativeFont, 12)
        rowText.anchorX =0
        rowText.x = 12
        rowText.y = rw.height * 0.5
        rowText.fill = {0,0,0,1}
        row:insert(rowText)
    end
end
    local tableView = widget.newTableView({
    left = 0,
    top = 0,
    height = display.actualContentHeight,
    width = display.actualContentWidth,
    onRowRender = onRowRender
})


for i = 1,10 do
    tableView:insertRow({
        rowHeght = 60,
        rowColor = {
            default = {1,1,1,1},
            over = {1,0,0,1}
    }
        })
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
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
    local logo = display.newImageRect(sceneGroup, "classfinder.png", 270, 140)
    logo.x = 158
    logo.y = 205


    local function onStartTouch(event)
        if(event.phase == "ended") then
            composer.gotoScene("map", "slideLeft")
        end
     end

     local map_start = widget.newButton {
         defaultFile = "mapbutton1.png",
         overFile = "mapbutton1.png",
         onEvent = onStartTouch
      }
      map_start.x = 235
      map_start.y = 390
      sceneGroup:insert(map_start)
      

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
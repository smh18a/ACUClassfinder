local composer = require( "composer" )
 
local scene = composer.newScene()
 
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

    local function onMenuTouch(event)
        if(event.phase == "ended") then
        composer.gotoScene("home", "slideRight") 
    end
 end

 local background = display.newRect(sceneGroup, 64, 79,  width, height)
    background.x = 160
    background.y = 240

    background:setFillColor(1, 1, 1)

    local logo = display.newImageRect(sceneGroup, "search.png", 320, 590)
    logo.x = 160
    logo.y = 240

    txt_menu = display.newText(sceneGroup,"home", 0, 0, native.systemFont, 18)
    txt_menu.x = 280
    txt_menu.y = -15
    txt_menu:setFillColor(0.1,0.1,0.1)
    txt_menu:addEventListener("touch", onMenuTouch)
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
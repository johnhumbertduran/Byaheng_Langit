
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function replay6()
    storyboard.removeScene( "level6" )
	storyboard.purgeScene( "level6" )
	storyboard.gotoScene (  "level6", "fade", 1500 )
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
    
    bg = display.newImageRect( "im/lvl6_bg.jpg", 480, 320 )
	bg.x = 240
    bg.y = 160

    load = display.newText("Loading objects...", display.contentWidth / 2, display.contentHeight / 2, "native.systemFontBold", 35)
    
    group:insert(bg)
    group:insert(load)

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

    replay = timer.performWithDelay( 500, replay6 )
    
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

    -- local result = timer.cancel(replay)
    
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

    
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene
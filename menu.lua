-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	storyboard.gotoScene( "levels", "fade", 500 )
	
	return true	-- indicates successful touch
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- display a background image
	local background = display.newImageRect( "im/menu_background.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "im/background_logo.png", 500, 100 )
	titleLogo.x = -200
	titleLogo.y = 100
	titleLogo.alpha = 0
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		defaultFile="im/btn1.png",
		overFile="im/btn2.png",
		width=140, height=60,
		onRelease = onPlayBtnRelease
		}
		playBtn.x = 240
		playBtn.y = 250
		playBtn.alpha = 0


		local function berto( )
			
			
			local function alphaBtn( )
			
			tweeningsBert2 = transition.to( playBtn, { alpha=1, delay=200} )

				local function menuAnimation( )
					local mscaleUp = function( )
					mstartButtonTween = transition.to( playBtn, { xScale=1, yScale=1, onComplete=menuAnimation } )
					end
					mstartButtonTween1 = transition.to( playBtn, { xScale=0.89, yScale=0.89, onComplete=mscaleUp } )
					end
					menuAnimation( )	
			end
			
			local function scaleBert( )
			local tweeningsBert1 = transition.to( titleLogo, { transition = easing.inExpo, xScale= 1, yScale= 1, x=display.viewableContentWidth / 2, y=100, onComplete=alphaBtn })
				-- if musicon.isVisible == true then
				-- audio.play(popSound1)
				-- end


			end
			tweeningsBert2 = transition.to( titleLogo, { transition = easing.inExpo, x= 230, time = 1000, delay =0, alpha=1, onComplete=scaleBert} )
			end
			berto( )

			-- local sheet = graphics.newImageSheet("im/sp.png", { width = 350, height =340, numFrames = 2} )

			-- -- create sprite instance
			-- local instance = display.newSprite ( sheet, { name = "man", start = 1, count = 2, time = 800 } )
			-- instance.x = 70
			-- instance.y = 230
		
			-- instance:scale(.4,.4)
			-- instance:play()


	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( titleLogo )
	group:insert( playBtn )
	-- group:insert( instance )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()



--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

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

	beg = "began"

	-- create a grey rectangle as the backdrop
	bg1 = display.newImageRect( "im/lvl1_bg.jpg", 480, 320 )
	bg1.x = 240
	bg1.y = 160
	
	bg2 = display.newImageRect( "im/lvl1_bg.jpg", 480, 320 )
	bg2.x = bg1.width + 240
	bg2.y = 160
	

	local grclShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }

	grcl1 = display.newImageRect( "im/ground_clouds.png", 480, 60 )
	grcl1.x = 240
	grcl1.y = 290
	physics.addBody( grcl1, "static", { friction=0.1 } )

	grcl2 = display.newImageRect( "im/ground_clouds.png", 480, 60 )
	grcl2.x = bg1.width + 240
	grcl2.y = 290
	physics.addBody( grcl2, "static", { friction=0.1 } )

	go = display.newImageRect("im/game_over.png", 140, 60)
	go.x = -100
	go.y = display.contentHeight /2
	go.alpha = 0
	go.xScale = .5
	go.yScale = .5

	ws = display.newRect(240, 160, 480, 320)
	ws:setFillColor(255)
	ws.alpha = 0
	
	
	-- pit = display.newImageRect( "im/pit.png", 85, 65 )
	-- pit.x = 240
	-- pit.y = 290
	
	
	
	-- -- make a crate (off-screen), position it, and rotate slightly
	-- local crate = display.newImageRect( "crate.png", 90, 90 )
	-- crate.x, crate.y = 160, -100
	-- crate.rotation = 15
	
	-- -- add physics to the crate
	-- physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.3 } )
	
	-- -- create a grass object and add physics (with custom shape)
	-- local grass = display.newImageRect( "grass.png", screenW, 82 )
	-- grass.anchorX = 0
	-- grass.anchorY = 1
	-- grass.x, grass.y = 0, display.contentHeight
	
	-- -- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	-- local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	-- physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )

	local playoptions =
{
	frames = require("player").frames,
}

	-- local sheet = graphics.newImageSheet("im/character.png", { width = 100, height =98, numFrames = 2} )
	local sheet = graphics.newImageSheet("im/character.png", playoptions )

	-- create sprite instance
	local playshape1 = { -15,-20, 0,-40, 15,-30, 15,-20, 5,-10, 15,5, -10,5, -5,-10 }
	local playshape2 = { 48,5, 50,30, 30,50, -30,50, -50,27, -50,10, -30,0, -5,0 }
	instance = display.newSprite ( sheet, { name = "man", start = 1, count = 2, time = 800 } )
	instance.x = 75
	instance.y = 210
	instance.ngaean = "player"
	physics.addBody( instance,
	 { density=0.2, --[[ friction=0, ]] bounce=0, shape=playshape1 },
	 { density=2.2, --[[ friction=0, ]] bounce=0, shape=playshape2 } 
	)

	-- instance:scale(.8,.8)
	instance:play()


	local holesheet = graphics.newImageSheet("im/hole_sprite.png", { width = 53, height =123, numFrames = 3} )

	-- create sprite instance
	hole = display.newSprite ( holesheet, { name = "hole", start = 1, count = 3, time = 800 } )
	hole.x = 375
	hole.y = 230
	hole.ngaean = "buho"
	-- local holeShape = { 5,-30, 12,-9, 13,4, 10,20, 5,30, -5,30, -10,20, -12,0 }
	local holeShape = { 5,-30, 13,-9, 13,10, 5,31, -5,31, -13,10, -13,-9, -5,-30 }
	physics.addBody( hole, "static", { density=1.2, friction=0, bounce=0, shape=holeShape } )

	hole:scale(.5,.5)
	hole:play()

	-- physics.setDrawMode("hybrid")
	physics.setGravity( 0, 17 )
	
	-- all display objects must be inserted into group
	group:insert( bg1 )
	group:insert( bg2 )
	group:insert( grcl1 )
	group:insert( grcl2 )
	-- group:insert( grass)
	-- group:insert( crate )
	group:insert( instance )
	group:insert( hole )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	physics.start()


	-- ##################__________jump kara it player_______##################
	function jump(event)

		if (event.phase == beg) then

			if instance.y <= 206 then

				-- instance:play()
			else
				instance:pause()
		instance:applyLinearImpulse( 0, -130, instance.x, instance.y )

			end
		end


	end

	Runtime:addEventListener("touch", jump)

	-- ##################__________check if naka tugpa eon maw sa ground clouds__________##################
	function checkGround()

		print(instance.y)
		if instance.y >= 202 then
			instance:play()
		end

	end
	-- checkGround()

	Runtime:addEventListener("enterFrame", checkGround)

	-- ##################__________Animate background kara__________##################
	local function gbAnim()
		bg1.x = bg1.x - 5
		bg2.x = bg2.x - 5
		
		if (bg1.x < -240) then
			bg1.x = bg2.x + bg1.width
			print("bg1")
		end
		
		if (bg2.x < -240) then
			bg2.x = bg1.x + bg2.width
			print("bg2")
		end
	end
	
	Runtime:addEventListener("enterFrame", gbAnim)


	-- ##################__________Animate cloud ground kara__________##################
	local function animateGrcl()
		grcl1.x = grcl1.x - 10
		grcl2.x = grcl2.x - 10
		
		if (grcl1.x < -240) then
			grcl1.x = grcl2.x + grcl1.width
			print("grcl1")
		end
		
		if (grcl2.x < -240) then
			grcl2.x = grcl1.x + grcl2.width
			print("grcl2")
		end
	end
	
	Runtime:addEventListener("enterFrame", animateGrcl)


	-- local function pitX()
	-- 	pit.x = pit.x - 10
		
	-- 	if (pit.x < -240) then
	-- 		pit.x = 100 * 5
	-- 		print("pit")
	-- 	end
	-- end
	
	-- Runtime:addEventListener("enterFrame", pitX)
	
	-- ##################__________Animate holes kara__________##################
	function holeX()

		holeRandPos = math.random(450,1500)
		holeRandNeg = math.random(0,500)

		hole.x = hole.x - 7
		
		if (hole.x <= -10) then
			hole.x = holeRandPos * 2
			print("hole")
		end
		
	end
	
	Runtime:addEventListener("enterFrame", holeX)


	function bunggo(event)


		phase = event.phase


		if (phase == beg) then
			
			hayhay = event.object1
			hoyhoy = event.object2

			if ((hayhay.ngaean == "player" and hoyhoy.ngaean == "buho") or
				(hayhay.ngaean == "buho" and hoyhoy.ngaean == "player") )
			then

				function ws2()
					ws1 = transition.to( ws, {alpha = 0, time=250})
				end
				ws1 = transition.to( ws, {alpha = 1, time=0, onComplete=ws2})

				display.remove( hayhay )
				display.remove( hoyhoy )
				Runtime:removeEventListener("enterFrame", gbAnim)
				Runtime:removeEventListener("enterFrame", animateGrcl)
				Runtime:removeEventListener("enterFrame", checkGround)
				Runtime:removeEventListener("enterFrame", holeX)
				Runtime:removeEventListener("touch", jump)

			-- function gameOver()
			function scaleUp()

				gameOv2 = transition.to( go, { xScale = 1.5, yScale = 1.5, time=500, delay=200 } )
				

			end

			gameOv1 = transition.to( go, { transition = easing.inExpo, x = display.contentWidth /2, alpha=1, time=1000, onComplete=scaleUp} )

				-- go.alpha = 1
				-- go.x = display.contentWidth /2

			-- end
			-- gameOver()

			end


		end

	end

	Runtime:addEventListener( "collision", bunggo )


	group:insert(bg1)
	group:insert(bg2)
	group:insert(grcl1)
	group:insert(grcl2)
	-- group:insert( grass)
	-- group:insert( crate )
	group:insert(instance)
	group:insert(hole)
	group:insert(ws)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	physics.stop()
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	package.loaded[physics] = nil
	physics = nil
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
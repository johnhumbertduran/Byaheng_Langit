
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local settings = require( "lib.settings" ) -- settings
local util     = require( "lib.util" ) -- util
local physics = require "physics"
-- physics.start();
-- physics.pause()
local widget = require( "widget" )
local coinTable1 = {}
local score = 0
local scoreText
local currentLevel = settings.currentLevel
--------------------------------------------

function buttonHit(event)
	settings.currentLevel = currentLevel+1
	util.save(settings, "settings.json")
	storyboard.removeScene( "level1" )
	storyboard.purgeScene( "lvls" )
	storyboard.gotoScene (  "lvls", {effect = "slideUp"} )
   
	--return true
end

local function unlockLevel()
	i = tonumber(currentLevel)

	if(currentLevel <= 1) then
	  settings.levels[i] = 3
	  settings.levels[i+1] = 1
	  print( i )
  util.save(settings, "settings.json")
  buttonHit()
	end

  end

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
	physics.start()

	beg = "began"

	scoreText = display.newText("0", display.contentWidth / 2, 20, "verdana", 35)
	scoreText.x = display.contentWidth / 2
	scoreText.y = 20
	
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
	instance.objectType = "player"
	physics.addBody( instance,
	 { density=0.2, friction=5, shape=playshape1 },
	 { density=2.2, friction=5, shape=playshape2 } 
	)

	instance:play()


	local holesheet = graphics.newImageSheet("im/hole_sprite.png", { width = 53, height =123, numFrames = 3} )

	-- create sprite instance
	hole = display.newSprite ( holesheet, { name = "hole", start = 1, count = 3, time = 800 } )
	hole.x = 375
	hole.y = 230
	hole.objectType = "buho"
	-- local holeShape = { 5,-30, 12,-9, 13,4, 10,20, 5,30, -5,30, -10,20, -12,0 }
	local holeShape = { 5,-30, 13,-9, 13,10, 5,31, -5,31, -13,10, -13,-9, -5,-30 }
	physics.addBody( hole, "static", { density=1.2, friction=0, bounce=0, shape=holeShape } )

	hole:scale(.5,.5)
	hole:play()

	gate1 = display.newImageRect("im/gate1.png", 198, 221)
	gate1.x = 2000
	gate1.y = display.contentHeight / 2
	gate1.objectType = "gate1"
	physics.addBody( gate1, "static", { density=1.2, friction=0, bounce=0 } )


	-- physics.setDrawMode("hybrid")
	physics.setGravity( 0, 17 )
	
	group:insert(bg1)
	group:insert(bg2)
	group:insert(grcl1)
	group:insert(grcl2)
	group:insert(hole)
	group:insert(ws)
	group:insert(gate1)
	group:insert(instance)
	group:insert(go)
	group:insert(scoreText)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	physics.start()


	-- ##################__________jump kara it player_______##################
	function jump(event)

		if (event.phase == beg) then

			if (instance.y <= 206) then

				-- instance:play()
			else
				instance:pause()
		instance:applyLinearImpulse( 0, -130, instance.x, instance.y )
		-- payerCollisionRect:applyLinearImpulse( 0, -130, payerCollisionRect.x, payerCollisionRect.y )


			end
		end


	end

	Runtime:addEventListener("touch", jump)


	-- ##################__________check if naka tugpa eon maw sa ground clouds__________##################
	function checkGround()

		-- print(instance.y)
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
			-- print("bg1")
		end
		
		if (bg2.x < -240) then
			bg2.x = bg1.x + bg2.width
			-- print("bg2")
		end
	end
	
	Runtime:addEventListener("enterFrame", gbAnim)


	-- ##################__________Animate cloud ground kara__________##################
	local function animateGrcl()
		grcl1.x = grcl1.x - 10
		grcl2.x = grcl2.x - 10
		
		if (grcl1.x < -240) then
			grcl1.x = grcl2.x + grcl1.width
			-- print("grcl1")
		end
		
		if (grcl2.x < -240) then
			grcl2.x = grcl1.x + grcl2.width
			-- print("grcl2")
		end
	end
	
	Runtime:addEventListener("enterFrame", animateGrcl)

	
	-- ##################__________Animate holes kara__________##################
	function holeX()

		holeRandPos = math.random(450,1500)
		holeRandNeg = math.random(0,500)

		hole.x = hole.x - 7
		
		if (hole.x <= -10) then
			hole.x = holeRandPos * 2
			-- print("hole")
		end
		
	end
	
	Runtime:addEventListener("enterFrame", holeX)


	function gateDestination()

		gate1.x = gate1.x - 7
		
	end
	
	Runtime:addEventListener("enterFrame", gateDestination)

	function ubraCoin()

		local coin = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin )
		physics.addBody( coin, "static", { isSensor=true } )
		coin.isBullet = true
		coin.objectType = "coin"
		coin.x = -100
		physics.alpha = 0


		local coin2 = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin2 )
		physics.addBody( coin2, "static", { isSensor=true } )
		coin2.isBullet = true
		coin2.objectType = "coin2"
		coin2.x = -100
		physics.alpha = 0


		local coin3 = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin3 )
		physics.addBody( coin3, "static", { isSensor=true } )
		coin3.isBullet = true
		coin3.objectType = "coin3"
		coin3.x = -100
		physics.alpha = 0

		local saya = math.random( 3 )
		coinRanY = math.random(50,90)
		coinRanY2 = math.random(70,150)
		coinRanX = math.random(1500,2500)

		if ( saya == 1 ) then
		
			coin.x = 500
			coin.y = coinRanY
			transition.to( coin, { x=-140, time=coinRanX,
			onComplete = function() display.remove( coin ) end
		} )
			-- coin:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
			coin.alpha = 1

			print("coint1")
			
		elseif ( saya == 2 ) then
			
			coin2.x = 600
			coin2.y = coinRanY2
			transition.to( coin2, { x=-140, time=coinRanX,
			onComplete = function() display.remove( coin2 ) end
		} )
			-- coin2:setLinearVelocity( math.random( -40,40 ), math.random( 40,120 ) )
			coin2.alpha = 1

			print("coint2")
	
		elseif ( saya == 3 ) then
			
			coin3.x = 490
			coin3.y = coinRanY2
			transition.to( coin3, { x=-140, time=coinRanX,
			onComplete = function() display.remove( coin3 ) end
		} )
			-- coin3:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
			coin3.alpha = 1

			print("coint3")
	
		end

	end

	function coinLoop()
		ubraCoin()
	end
	
	coinLoopTimer = timer.performWithDelay( 500, coinLoop, 0 )

	local function onCollision( event )

		if ( event.phase == "began" ) then
	
			local obj1 = event.object1
			local obj2 = event.object2
	
			if ( ( obj1.objectType == "player" and obj2.objectType == "buho" ) or
				 ( obj1.objectType == "buho" and obj2.objectType == "player" ) )
			then
				
				function ws2()
					ws1 = transition.to( ws, {alpha = 0, time=250})
				end
				ws1 = transition.to( ws, {alpha = 1, time=0, onComplete=ws2})

				display.remove( obj1 )
				display.remove( obj2 )
				-- physics.stop()
				-- stopTime = timer.cancel(coinLoop)
				-- timer1 = timer.performWithDelay( 2000, listener )  -- wait 2 seconds
 
				-- sometime later...
				local result = timer.cancel( coinLoopTimer )
				Runtime:removeEventListener("enterFrame", gbAnim)
				Runtime:removeEventListener("enterFrame", animateGrcl)
				Runtime:removeEventListener("enterFrame", checkGround)
				Runtime:removeEventListener("enterFrame", holeX)
				Runtime:removeEventListener("touch", jump)
				Runtime:removeEventListener("enterFrame", gateDestination)
				-- print("bunggo buho")

			-- function gameOver()
			function scaleUp()

				gameOv2 = transition.to( go, { xScale = 1.5, yScale = 1.5, time=500, delay=200 } )
				

			end

			gameOv1 = transition.to( go, { transition = easing.inExpo, x = display.contentWidth /2, alpha=1, time=1000, onComplete=scaleUp} )

	
			elseif ( ( obj1.objectType == "player" and obj2.objectType == "coin" ) or
					 ( obj1.objectType == "coin" and obj2.objectType == "player" ) )
			then

				display.remove( obj2 )
				-- display.remove( obj2 )
				for i = #coinTable1, 1, -1 do
					if ( coinTable1[i] == obj1 or coinTable1[i] == obj2 ) then
						table.remove( coinTable1, i)
						score = score + 10
						scoreText.text = score
						print("bunggo Coin1")
						break
					end
				end

			-- end


		elseif ( ( obj1.objectType == "player" and obj2.objectType == "coin2" ) or
					 ( obj1.objectType == "coin2" and obj2.objectType == "player" ) )
			then

				display.remove( obj2 )
				-- display.remove( obj2 )
				for i = #coinTable1, 1, -1 do
					if ( coinTable1[i] == obj1 or coinTable1[i] == obj2 ) then
						table.remove( coinTable1, i)
						score = score + 15
						scoreText.text = score
						print("bunggo Coin2")
						break
					end
				end
		
		
		elseif ( ( obj1.objectType == "player" and obj2.objectType == "coin3" ) or
					 ( obj1.objectType == "coin3" and obj2.objectType == "player" ) )
			then

				display.remove( obj2 )
				-- display.remove( obj2 )
				for i = #coinTable1, 1, -1 do
					if ( coinTable1[i] == obj1 or coinTable1[i] == obj2 ) then
						table.remove( coinTable1, i)
						score = score + 20
						scoreText.text = score
						print("bunggo Coin3")
						break
					end
				end


		elseif ( ( obj1.objectType == "player" and obj2.objectType == "gate1" ) or
					 ( obj1.objectType == "gate1" and obj2.objectType == "player" ) )
			then

				function removePhysicsBody()
				physics.removeBody(gate1)
				physics.removeBody(instance)
				end

				removeBody = timer.performWithDelay(500, removePhysicsBody) 

				-- display.remove( obj2 )
				-- display.remove( obj2 )
				-- instance:pause()
				-- physics.addBody( instance, "static")
				local result = timer.cancel( coinLoopTimer )
				Runtime:removeEventListener("enterFrame", gbAnim)
				Runtime:removeEventListener("enterFrame", animateGrcl)
				Runtime:removeEventListener("enterFrame", checkGround)
				Runtime:removeEventListener("enterFrame", holeX)
				Runtime:removeEventListener("touch", jump)
				Runtime:removeEventListener("enterFrame", gateDestination)


				function enterRainbow()
					enters = transition.to(gate1,{xScale=5, yScale=5, alpha=0, time=1000})
				end
				sakaGate1 = transition.to(instance,{x=200,y=150,alpha=0, time=1000, delay=500, onComplete=enterRainbow})


				print("hep, Success!")

			end
			
		end
	end
	
	Runtime:addEventListener( "collision", onCollision )	

	-- function clickGameOver()
	-- 	unlockLevel()
	-- end

	-- go:addEventListener("tap", clickGameOver)


	group:insert(bg1)
	group:insert(bg2)
	group:insert(grcl1)
	group:insert(grcl2)
	group:insert(hole)
	group:insert(ws)
	group:insert(gate1)
	group:insert(instance)
	group:insert(go)
	group:insert(scoreText)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	physics.stop()
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	-- package.loaded[physics] = nil
	-- physics = nil
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
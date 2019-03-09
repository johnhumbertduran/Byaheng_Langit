
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
local highScore = settings.levelScore
local coinSound = audio.loadSound("sound/coin.wav")
lvl7Sound = audio.loadSound("sound/lvl7.mp3")
--------------------------------------------

function nextLevel(event)

	if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
	-- settings.currentLevel = currentLevel+1
	-- util.save(settings, "settings.json")
	-- storyboard.removeScene( "level7" )
	storyboard.purgeScene( "lvls" )
	storyboard.gotoScene (  "lvls", {effect = "fade"} )
   
	--return true
end


function onReplayBtnRelease(event)

	if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
	storyboard.purgeScene( "rep7" )
	storyboard.gotoScene (  "rep7", "fade", 500 )

end

function menuView(event)

	if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
	storyboard.purgeScene( "lvls" )
	storyboard.gotoScene (  "lvls", "fade", 500 )

end

local function unlockLevel()
	i = tonumber(currentLevel)

	if(currentLevel <= 7) then
	  settings.levels[i] = 3
	  settings.levels[i+1] = 1
	  highScore[7] = score
	  print( i )
  util.save(settings, "settings.json")
  nextLevel()
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
	
	bg1 = display.newImageRect( "im/lvl7_bg.jpg", 480, 320 )
	bg1.x = 240
	bg1.y = 160
	
	bg2 = display.newImageRect( "im/lvl7_bg.jpg", 480, 320 )
	bg2.x = bg1.width + 240
	bg2.y = 160
	

	local grclShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }

	grcl1 = display.newImageRect( "im/ground_cloud7.png", 480, 60 )
	grcl1.x = 240
	grcl1.y = 290
	physics.addBody( grcl1, "static", { friction=100 } )

	grcl2 = display.newImageRect( "im/ground_cloud7.png", 480, 60 )
	grcl2.x = bg1.width + 240
	grcl2.y = 290
	physics.addBody( grcl2, "static", { friction=100 } )

	go = display.newImageRect("im/game_over.png", 140, 60)
	go.x = -100
	go.y = 90
	go.alpha = 0
	go.xScale = .5
	go.yScale = .5
	
		replay = widget.newButton{
		defaultFile="im/rep1.png",
		overFile="im/rep2.png",
		width=70, height=70,
		onRelease = onReplayBtnRelease
		}
		replay.x = 180
		replay.y = 180
		replay.alpha = 0


		menu = widget.newButton{
		defaultFile="im/menu1.png",
		overFile="im/menu2.png",
		width=70, height=70,
		onRelease = menuView
		}
		menu.x = 300
		menu.y = 180
		menu.alpha = 0

		menu2 = widget.newButton{
		defaultFile="im/menu1.png",
		overFile="im/menu2.png",
		width=70, height=70,
		onRelease = menuView
		}
		menu2.x = display.contentWidth / 2
		menu2.y = 180
		menu2.alpha = 0


		nextBtn = widget.newButton{
		defaultFile="im/heaven1.png",
		overFile="im/heaven2.png",
		width=150, height=34,
		onRelease = unlockLevel
		}
		nextBtn.x = display.contentWidth / 2
		nextBtn.y = 180
		nextBtn.alpha = 0

	ws = display.newRect(240, 160, 480, 320)
	ws:setFillColor(255)
	ws.alpha = 0

	local playoptions =
{
	frames = require("player").frames,
}

	-- local sheet = graphics.newImageSheet("im/character.png", { width = 100, height =98, numFrames = 2} )
	local sheet = graphics.newImageSheet("im/character7.png", playoptions )

	-- create sprite instance
	local playshape1 = { -5,-10, -10,-10, -10,-40, 15,-40, 15,-10, 5,-10, 5,5, -5,5 }
	local playshape2 = { 48,5, 48,30, 40,50, -40,50, -48,30, -48,5 }
	-- local playshape1 = { -5,-10, -15,-20, 0,-40, 15,-30, 15,-20, 5,-10, 15,5, -10,5 }
	-- local playshape2 = { 48,5, 50,30, 30,50, -30,50, -50,27, -50,10, -30,0, -5,0 }
	instance = display.newSprite ( sheet, { name = "man", start = 1, count = 2, time = 800 } )
	instance.x = 75
	instance.y = 210
	instance.objectType = "player"
	physics.addBody( instance,
	 { density=0.2, friction=100, shape=playshape1 },
	 { density=2.2, friction=100, shape=playshape2 } 
	)

	instance:play()


	local holesheet = graphics.newImageSheet("im/fire_boss.png", { width = 53, height =123, numFrames = 3} )

	-- create sprite instance
	hole = display.newSprite ( holesheet, { name = "hole", start = 1, count = 3, time = 800 } )
	hole.x = 600
	hole.y = 230
	hole.objectType = "buho"
	-- local holeShape = { 5,-30, 12,-9, 13,4, 10,20, 5,30, -5,30, -10,20, -12,0 }
	local holeShape = { -15,-50, 15,-50, 20,31, -20,31 }
	physics.addBody( hole, "static", { density=1.2, friction=0, bounce=0, shape=holeShape } )

	-- hole:scale(.5,.5)
	hole:play()

	gate1 = display.newImageRect("im/gate7.png", 198, 221)
	gate1.x = 45000
	gate1.y = display.contentHeight / 2
	gate1.objectType = "gate1"
	physics.addBody( gate1, "static", { density=1.2, friction=0, bounce=0 } )

	star1 = display.newImageRect("im/star.png", 80, 80)
	star1.x = display.contentWidth / 3
	star1.y = 120
	star1.alpha = 0

	star2 = display.newImageRect("im/star.png", 80, 80)
	star2.x = display.contentWidth / 2
	star2.y = 100
	star2.alpha = 0

	star3 = display.newImageRect("im/star.png", 80, 80)
	star3.x = (display.contentWidth / 2) + 80
	star3.y = 120
	star3.alpha = 0

	ray = display.newImageRect("im/rays.png",display.contentWidth,display.contentHeight)
	ray.x = display.contentWidth / 2
	ray.y = display.contentHeight / 2

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
	group:insert(replay)
	group:insert(menu)
	group:insert(menu2)
	group:insert(star1)
	group:insert(star2)
	group:insert(star3)
	group:insert(ray)
	group:insert(nextBtn)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	if pauseSound.isVisible == true then
		audio.play( lvl7Sound, { channel=1, loops=-1 } )
	end

	coinGroup = display.newGroup()
	
	physics.start()

	function kulong( object )
		if object.x < object.width - 30 then
		object.x = object.width - 30
	end
	if object.x >  object.width then
		object.x = object.width - 20
	end
	end
	-- kulong(instance)

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

	function keepKulong()
		kulong(instance)
	end
	Runtime:addEventListener("enterFrame", keepKulong)


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
		bg1.x = bg1.x - 9
		bg2.x = bg2.x - 9
		
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

		hole.x = hole.x - 12
		
		if (hole.x <= -10) then
			hole.x = holeRandPos * 2
			-- print("hole")
		end
		
	end
	
	Runtime:addEventListener("enterFrame", holeX)


	function gateDestination()

		gate1.x = gate1.x - 7

		if (gate1.x == hole.x + 100) or (gate1.x == hole.x - 100) then
			display.remove(hole)
		end
		
	end
	
	Runtime:addEventListener("enterFrame", gateDestination)

	function ubraCoin()

		local coin = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin )
		physics.addBody( coin, "static", { isSensor=true } )
		coin.isBullet = true
		coin.objectType = "coin"
		coin.x = -100
		coin.alpha = 0
		coinGroup:insert(coin)


		local coin2 = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin2 )
		physics.addBody( coin2, "static", { isSensor=true } )
		coin2.isBullet = true
		coin2.objectType = "coin2"
		coin2.x = -100
		coin2.alpha = 0
		coinGroup:insert(coin2)


		local coin3 = display.newImageRect("im/coin.png", 30, 30)
		table.insert( coinTable1, coin3 )
		physics.addBody( coin3, "static", { isSensor=true } )
		coin3.isBullet = true
		coin3.objectType = "coin3"
		coin3.x = -100
		coin3.alpha = 0
		coinGroup:insert(coin3)

		local saya = math.random( 3 )
		coinRanY = math.random(80,100)
		coinRanY2 = math.random(70,150)
		coinRanX = math.random(1500,2000)

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
				
				if pauseSound.isVisible == true then
					audio.pause(lvl7Sound)
					audio.play(lose)
				end

				if pauseSound.isVisible == true then
					audio.play(lose)
				end
				function ws2()
					ws1 = transition.to( ws, {alpha = 0, time=250})
				end
				ws1 = transition.to( ws, {alpha = 1, time=0, onComplete=ws2})

				display.remove( obj1 )
				display.remove( obj2 )
				-- sometime later...
				local result = timer.cancel( coinLoopTimer )
				Runtime:removeEventListener("enterFrame", gbAnim)
				Runtime:removeEventListener("enterFrame", animateGrcl)
				Runtime:removeEventListener("enterFrame", checkGround)
				Runtime:removeEventListener("enterFrame", holeX)
				Runtime:removeEventListener("touch", jump)
				Runtime:removeEventListener("enterFrame", gateDestination)
				Runtime:removeEventListener("enterFrame", keepKulong)
				-- print("bunggo buho")


			function backAndReplay()
				showBack = transition.to( replay, { alpha=1, time=1000, delay=200} )
				showReplay = transition.to( menu, { alpha=1, time=1000, delay=200} )
			end

			function scaleUp()
				gameOv2 = transition.to( go, { xScale = 1.5, yScale = 1.5, time=500, delay=200, onComplete=backAndReplay } )
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
						if pauseSound.isVisible == true then
							audio.play(coinSound)
						end
						score = score + 30
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
						if pauseSound.isVisible == true then
							audio.play(coinSound)
						end
						score = score + 10
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
						if pauseSound.isVisible == true then
							audio.play(coinSound)
						end
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

				local result = timer.cancel( coinLoopTimer )
				Runtime:removeEventListener("enterFrame", gbAnim)
				Runtime:removeEventListener("enterFrame", animateGrcl)
				Runtime:removeEventListener("enterFrame", checkGround)
				Runtime:removeEventListener("enterFrame", holeX)
				Runtime:removeEventListener("touch", jump)
				Runtime:removeEventListener("enterFrame", gateDestination)


				function checkNextButton()

					if(currentLevel <= 7) then

						-- function NextButton()

							tweenNextBtn = transition.to( nextBtn, { alpha=1, delay=200} )
							
							local function nextBtnAnimation( )
								local nBtnscaleUp = function( )
									nextBtnTween = transition.to( nextBtn, { xScale=1.3, yScale=1.3, time=800, onComplete=nextBtnAnimation } )
								end
								nextBtnTween1 = transition.to( nextBtn, { xScale=1, yScale=1, time=800, onComplete=nBtnscaleUp } )
							end
							nextBtnAnimation()

							if (score > highScore[7]) then
								if (score >= 2800 and score < 3200) then
									function star1ReturnScale()
										star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )
								
								if pauseSound.isVisible == true then
									audio.play(getStar)
								end

								-- highScore[7] = score
								-- util.save(settings, "settings.json")
								
						
								elseif (score >= 3200 and score < 3600) then
									function star1ReturnScale()
										star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )
						
									function star2ReturnScale()
										star2Visible2 = transition.to( star2, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star2Visible = transition.to( star2, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=300, onComplete=star2ReturnScale} )
								
								if pauseSound.isVisible == true then
									audio.play(getStar)
								end

								-- if (score > highScore[7]) then
								-- highScore[7] = score
								-- util.save(settings, "settings.json")
								-- end
							
								elseif (score >= 3600) then
									function star1ReturnScale()
										star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )
						
									function star2ReturnScale()
										star2Visible2 = transition.to( star2, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star2Visible = transition.to( star2, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=300, onComplete=star2ReturnScale} )
									
									function star3ReturnScale()
										star3Visible2 = transition.to( star3, { transition=easing.inExpo, xScale=1, yScale=1} )
									end
								star3Visible = transition.to( star3, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=600, onComplete=star3ReturnScale} )
								
								if pauseSound.isVisible == true then
									audio.play(getStar)
								end

								-- if (score > highScore[7]) then
								-- highScore[7] = score
								-- util.save(settings, "settings.json")
								-- end
								
								end
								end
							
						else

							if (score > highScore[7]) then
							if (score >= 2800 and score < 3200) then
								function star1ReturnScale()
									star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )
							
							if pauseSound.isVisible == true then
								audio.play(getStar)
							end

							highScore[7] = score
							util.save(settings, "settings.json")

							elseif (score >= 3200 and score < 3600) then
								function star1ReturnScale()
									star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )

								function star2ReturnScale()
									star2Visible2 = transition.to( star2, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star2Visible = transition.to( star2, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=300, onComplete=star2ReturnScale} )
							
							if pauseSound.isVisible == true then
								audio.play(getStar)
							end

							-- if (score > highScore[7]) then
							highScore[7] = score
							util.save(settings, "settings.json")
							-- end
						
							elseif (score >= 3600) then
								function star1ReturnScale()
									star1Visible2 = transition.to( star1, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star1Visible = transition.to( star1, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, onComplete=star1ReturnScale} )

								function star2ReturnScale()
									star2Visible2 = transition.to( star2, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star2Visible = transition.to( star2, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=300, onComplete=star2ReturnScale} )
								
								function star3ReturnScale()
									star3Visible2 = transition.to( star3, { transition=easing.inExpo, xScale=1, yScale=1} )
								end
							star3Visible = transition.to( star3, { transition=easing.inExpo, xScale=3, yScale=3, alpha=1, delay=600, onComplete=star3ReturnScale} )
							
							if pauseSound.isVisible == true then
								audio.play(getStar)
							end
							
							-- if (score > highScore[7]) then
							highScore[7] = score
							util.save(settings, "settings.json")
							-- end
							
							end
							end
							menuButton = transition.to( menu2, { alpha=1, delay=200} )
							
					end
								--input kara ibalik sa levels
					--   end
				end


				

				function enterRainbow()
					enters = transition.to(gate1,{xScale=5, yScale=5, alpha=0, time=1000, onComplete=checkNextButton})
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
	group:insert(scoreText)
	group:insert(star1)
	group:insert(star2)
	group:insert(star3)
	group:insert(coinGroup)
	group:insert(ray)
	group:insert(replay)
	group:insert(menu)
	group:insert(menu2)
	group:insert(go)
	group:insert(nextBtn)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	physics.stop()
	audio.stop(1)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	audio.dispose(lvl7Sound)
	-- package.loaded[physics] = nil
	-- physics = nil
	replay = nil
	menu = nil
	menu2 = nil
	nextBtn = nil
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
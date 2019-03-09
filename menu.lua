
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require "widget"
local physics = require "physics"
local playBtn

local mainFX = audio.loadSound("sound/mainFX.mp3")
tapSound = audio.loadSound("sound/tap.wav")
lose = audio.loadSound("sound/lose.wav")
getStar = audio.loadSound("sound/star.wav")
dropName = audio.loadSound("sound/dropName.wav")

local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	audio.pause(mainFX)
	if pauseSound.isVisible == true then
		audio.play(tapSound)
	end
	-- storyboard.removeScene( "menu" )
	storyboard.purgeScene( "lvls" )
	storyboard.gotoScene( "lvls", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function creds()

	-- go to level1.lua scene
	audio.pause(mainFX)
	if pauseSound.isVisible == true then
		audio.play(tapSound)
	end
	
	-- storyboard.removeScene( "menu" )
	storyboard.purgeScene( "credits1" )
	storyboard.gotoScene( "credits1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function playSoundBtn()
	
	pauseSound.isVisible=true
	playSound.isVisible=false
	audio.play(mainFX)
	audio.play(tapSound)
	
	return true	-- indicates successful touch
end

local function pauseSoundBtn()
	
	pauseSound.isVisible=false
	playSound.isVisible=true
	audio.pause(mainFX)
	audio.play(tapSound)
	-- audio.play( mainFX, { channel=1, loops=-1 } )
	return true	-- indicates successful touch
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	display.setDefault( "background", 255/255, 255/255, 255/255 )

	local background = display.newImageRect( "im/menu_background.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	local titleLogo = display.newImageRect( "im/background_logo.png", 500, 100 )
	titleLogo.x = -200
	titleLogo.y = 100
	titleLogo.alpha = 0
	
	playBtn = widget.newButton{
		defaultFile="im/btn1.png",
		overFile="im/btn2.png",
		width=140, height=60,
		onRelease = onPlayBtnRelease
		}
		playBtn.x = 240
		playBtn.y = 250
		playBtn.alpha = 0

	credits = widget.newButton{
		defaultFile="im/cre1.png",
		overFile="im/cre2.png",
		width=60, height=60,
		onRelease = creds
		}
		credits.x = -200
		credits.y = 280
		credits.alpha = 0

	playSound = widget.newButton{
		defaultFile="im/play1.png",
		overFile="im/play2.png",
		width=60, height=60,
		onRelease = playSoundBtn
		}
		playSound.x = 40
		playSound.y = 280
		playSound.isVisible = false

	pauseSound = widget.newButton{
		defaultFile="im/pause1.png",
		overFile="im/pause2.png",
		width=60, height=60,
		onRelease = pauseSoundBtn
		}
		pauseSound.x = 40
		pauseSound.y = 280


		local function berto( )
			
			local function alphaBtn( )
			
			tweeningsBert2 = transition.to( playBtn, { alpha=1, delay=200} )
			cred = transition.to( credits, { transition = easing.inExpo, x=440, time=1000, delay=0, alpha=1} )

				local function menuAnimation( )
					local mscaleUp = function( )
					mstartButtonTween = transition.to( playBtn, { xScale=1, yScale=1, onComplete=menuAnimation } )
					end
					mstartButtonTween1 = transition.to( playBtn, { xScale=0.89, yScale=0.89, onComplete=mscaleUp } )
					end
					menuAnimation( )	
			end
			
			local function scaleBert( )
			local tweeningsBert1 = transition.to( titleLogo, { transition = easing.inExpo, x=display.viewableContentWidth / 2, y=100, onComplete=alphaBtn })
			end
			tweeningsBert2 = transition.to( titleLogo, { transition = easing.inExpo, x= 230, time = 1000, delay =0, alpha=1, onComplete=scaleBert} )
			end
			berto()

	group:insert( background )
	group:insert( titleLogo )
	group:insert( playBtn )
	group:insert( pauseSound )
	group:insert( playSound )
	group:insert( credits )


end

function scene:enterScene( event )
	local group = self.view

	if pauseSound.isVisible == true then
	audio.play( mainFX, { channel=1, loops=-1 } )
	end

	function goCirc(event)
			
	physics.start()

	randWH = math.random(10,30)
		
	if event.phase == "began"  then
	cout = 1
	end 

	if   cout == 1 and event.phase ==  "moved"  then
	circ = display.newImageRect( "im/cloud.png", randWH, randWH)
	circ.x = event.x
	circ.y = event.y
	physics.addBody( circ, { density=0, bounce=0.3, radius=10 } )

	goTrans1 = transition.to (circ, {alpha=0, y=10, time=3000})
	group:insert( circ )
	
	end

	if event.phase == "ended"  then
	cout = 0
	end 
	end 

		function goCirc2(event)

		physics.start()
		randWH2 = math.random(20,40)

		if event.phase == "began"  then
		cout2 = 1
		end 

		if   cout2 == 1  then
		circ2 = display.newImageRect( "im/cloud.png", randWH2, randWH2)
		circ2.x = event.x
		circ2.y = event.y
		physics.addBody( circ2, { density=0, bounce=0.3, radius=4 } )
		
		goTrans2 = transition.to (circ2, {alpha=0, y=10, time=3000})
		group:insert( circ2 )
		end

		if event.phase == "ended"  then
		cout2 = 0
		end
		end 
		-- physics.setDrawMode("hybrid")
Runtime:addEventListener("touch", goCirc)
Runtime:addEventListener("touch", goCirc2)


end

function scene:exitScene( event )
	local group = self.view
	audio.stop(1)
	
end

function scene:destroyScene( event )
	local group = self.view
	audio.dispose(mainFX)
	
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local widget = require( "widget" )


small_letter = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
"w", "x", "y", "z"
}
big_letter = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
"W", "X", "Y", "Z"
}

function backToMain()
    -- storyboard.purgeScene( "menu" )
    if pauseSound.isVisible == true then
		audio.play(tapSound)
	end
	storyboard.gotoScene (  "menu", {effect = "fade"} )
    return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local credsG = self.view

	local background = display.newImageRect( "im/credBg.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
    background.x, background.y = 0, 0
    
    prog = display.newText("Programmer:", display.contentWidth / 2, 50, "impact", 45)
    prog.xScale = 5
    prog.yScale = 5
    prog.alpha = 0

    function check()

        y = (display.contentHeight / 2 - 50)
        y1 = (display.contentHeight / 2) + 20
        y2 = (display.contentHeight / 2) + 80
        font = "cambria"
        s = 70
        t = 90
        t1 = 50
 
        -- #####################__________display "John"__________#####################
        myJ = display.newText(big_letter[10], 200, y, font, s)
        myJ:setFillColor(0/255)
        myJ.alpha = 0
        myO = display.newText(small_letter[15], 225, y, font, s)
        myO:setFillColor(0/255)
        myO.alpha = 0
        myH = display.newText(small_letter[8], 260, y, font, s)
        myH:setFillColor(0/255)
        myH.alpha = 0
        myN = display.newText(small_letter[14], 300, y, font, s)
        myN:setFillColor(0/255)
        myN.alpha = 0


        
        -- #####################__________display "Humbert"__________#####################
        myHBig = display.newText(big_letter[8], 130, y1, font, s)
        myHBig:setFillColor(0/255)
        myHBig.alpha = 0
        myU = display.newText(small_letter[21], 170, y1, font, s)
        myU:setFillColor(0/255)
        myU.alpha = 0
        myM = display.newText(small_letter[13], 220, y1, font, s)
        myM:setFillColor(0/255)
        myM.alpha = 0
        myB = display.newText(small_letter[2], 268, y1, font, s)
        myB:setFillColor(0/255)
        myB.alpha = 0
        myE = display.newText(small_letter[5], 303, y1, font, s)
        myE:setFillColor(0/255)
        myE.alpha = 0
        myR = display.newText(small_letter[18], 333, y1, font, s)
        myR:setFillColor(0/255)
        myR.alpha = 0
        myT = display.newText(small_letter[20], 363, y1, font, s)
        myT:setFillColor(0/255)
        myT.alpha = 0

        -- #####################__________display "Duran"__________#####################
        myD = display.newText(big_letter[4], 180, y2, font, s)
        myD:setFillColor(0/255)
        myD.alpha = 0
        myU2 = display.newText(small_letter[21], 220, y2, font, s)
        myU2:setFillColor(0/255)
        myU2.alpha = 0
        myR2 = display.newText(small_letter[18], 255, y2, font, s)
        myR2:setFillColor(0/255)
        myR2.alpha = 0
        myA = display.newText(small_letter[1], 290, y2, font, s)
        myA:setFillColor(0/255)
        myA.alpha = 0
        myN2 = display.newText(small_letter[14], 330, y2, font, s)
        myN2:setFillColor(0/255)
        myN2.alpha = 0

        -- ###############____________________Colors____________________###############
        function col24()

            col24 = transition.to(myN2, { myN2:setFillColor(216/255,45/255,97/255)})

        end
        
        function col23()

            col23 = transition.to(myA, { myA:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col24})

        end
        function col22()

            col22 = transition.to(myR2, { myR2:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col23})

        end
        
        function col21()

            col21 = transition.to(myU2, { myU2:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col22})

        end

        function col20()

            col20 = transition.to(myD, { myD:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col21})

        end
        
        function col19()

            col19 = transition.to(myT, { myT:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col20})

        end

        function col18()

            col18 = transition.to(myR, { myR:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col19})

        end
        
        function col17()

            col17 = transition.to(myE, { myE:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col18})

        end

        function col16()

            col16 = transition.to(myB, { myB:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col17})

        end
        
        function col15()

            col15 = transition.to(myM, { myM:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col16})

        end
        
        function col14()

            col14 = transition.to(myU, { myU:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col15})

        end
        
        function col13()

            col13 = transition.to(myHBig, { myHBig:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col14})

        end
        function col12()

            col12 = transition.to(myN, { myN:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col13})

        end
        
        function col11()

            col11 = transition.to(myH, { myH:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col12})

        end

        function col10()

            col10 = transition.to(myO, { myO:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col11})

        end
        
        function col9()

            col9 = transition.to(myJ, { myJ:setFillColor(216/255,45/255,97/255), time=t1, onComplete=col10})

        end       

        function colProg()

            colProg = transition.to(prog, { prog:setFillColor(50/255,97/255,214/255), time=t1, onComplete=col9})

        end       


        -- ###############____________________Duran____________________###############
        
        function enn2()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEnn2 = transition.to(myN2, {alpha=1, time=t, onComplete=colProg})

        end
        
        function eyy()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEyy = transition.to(myA, {alpha=1, time=t, onComplete=enn2})

        end
        
        function arr2()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoArr2 = transition.to(myR2, {alpha=1, time=t, onComplete=eyy})

        end
        
        function yuu2()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoYuu2 = transition.to(myU2, {alpha=1, time=t, onComplete=arr2})  
        end
        
        function dii()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoDii = transition.to(myD, {alpha=1, time=t, onComplete=yuu2})

        end

        -- ###############____________________Humbert____________________###############
        
        function tii()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoTii = transition.to(myT, {alpha=1, time=t, onComplete=dii})

        end
        
        function arr()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoArr = transition.to(myR, { alpha=1, time=t, onComplete=tii})
            
        end
        
        function eee()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEee = transition.to(myE, { alpha=1, time=t, onComplete=arr})
            
        end
        
        function bii()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoBii = transition.to(myB, { alpha=1, time=t, onComplete=eee})
            
        end
        
        function emm()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEmm = transition.to(myM, { alpha=1, time=t, onComplete=bii})
            
        end
        
        function yuu()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoYuu = transition.to(myU, { alpha=1, time=t, onComplete=emm})
            
        end
        
        function eychBig()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEychBig = transition.to(myHBig, { alpha=1, time=t, onComplete=yuu})
            
        end

        -- ###############____________________John____________________###############
        
        function enn()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEnn = transition.to(myN, { alpha=1, time=t, onComplete=eychBig})
            
        end
        
        function eych()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoEych = transition.to(myH, { alpha=1, time=t, onComplete=enn})
            
        end
        
        function oww()

        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
            miLliamoOw = transition.to(myO, { alpha=1, time=t, onComplete=eych})
            
        end
        --myName = display.newText(big_letter[10] .. small_letter[15], 100, y)
        function delSound()
        if pauseSound.isVisible == true then
            audio.play(dropName)
        end
        end

        delaySound = timer.performWithDelay(1500, delSound)

            miLliamo = transition.to(myJ, { alpha=1, time=t, delay=2000, onComplete=oww})
         
            
        end
        

check()

-- timer.performWithDelay(1000, check)

progTween = transition.to(prog, { transition=easing.inExpo, alpha=1, xScale=1, yScale=1, time=500, delay=1000})

credsG:insert(background)
credsG:insert(prog)
credsG:insert(myJ)
credsG:insert(myO)
credsG:insert(myH)
credsG:insert(myN)

credsG:insert(myHBig)
credsG:insert(myU)
credsG:insert(myM)
credsG:insert(myB)
credsG:insert(myE)
credsG:insert(myR)
credsG:insert(myT)

credsG:insert(myD)
credsG:insert(myU2)
credsG:insert(myR2)
credsG:insert(myA)
credsG:insert(myN2)

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local credsG = self.view
    
    backBtn = widget.newButton{
		defaultFile="im/bb1.png",
		overFile="im/bb2.png",
		width=60, height=60,
		onRelease = backToMain
        }
        backBtn.xScale = 5
        backBtn.yScale = 5
		backBtn.x = 40
		backBtn.y = 280
        backBtn.alpha = 0
        
bb = transition.to(backBtn, { transition=easing.inExpo, alpha=1, xScale=1, yScale=1, time=1000, delay=3000})

	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
    -----------------------------------------------------------------------------
    credsG:insert(backBtn)
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local credsG = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display credsG)
function scene:destroyScene( event )
	local credsG = self.view
	-- backBtn = nil
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene

local storyboard = require( "storyboard" )
local settings = require ("lib.settings")
local scene = storyboard.newScene()
local widget = require("widget")

lvls = {"im/lvls/lvl1.png","im/lvls/lvl2.png","im/lvls/lvl3.png","im/lvls/lvl4.png","im/lvls/lvl5.png","im/lvls/lvl6.png","im/lvls/lvl7.png"}
lvlsOv = {"im/lvls/lvl1Over.png","im/lvls/lvl2Over.png","im/lvls/lvl3Over.png","im/lvls/lvl4Over.png","im/lvls/lvl5Over.png","im/lvls/lvl6Over.png","im/lvls/lvl7Over.png"}

locks = { }

local lvlBtn2
local lvlBtn3
local lvlBtn4
local lvlBtn5
local lvlBtn6
local lvlBtn7


local locks2
local locks3
local locks4
local locks5
local locks6
local locks7

local maxLevel = 7
local highScore = settings.levelScore

xOffset = 50
yOffset = 60


-- stars = display.newImageRect("im/star.png", 80, 80)
stars = {}

function backToMain()
    if pauseSound.isVisible == true then
		audio.play(tapSound)
	end
	-- storyboard.purgeScene( "menu" )
	storyboard.gotoScene (  "menu", {effect = "fade"} )
    return true
end

function unlocklevel()
    -- for i = 2, maxLevel do
        if ( settings.levels[2] == 1 ) then
             transition.to( locks2,{time=0,alpha=0})
             lvlBtn2:setEnabled( true )
             
        elseif ( settings.levels[2] == 3 ) then
                locks2.alpha = 0
                lvlBtn2:setEnabled( true )
        end

        if ( settings.levels[3] == 1 ) then
             transition.to( locks3,{time=0,alpha=0})
             lvlBtn3:setEnabled( true )
             
        elseif ( settings.levels[3] == 3 ) then
                locks3.alpha = 0
                lvlBtn3:setEnabled( true )
        end

        if ( settings.levels[4] == 1 ) then
             transition.to( locks4,{time=0,alpha=0})
             lvlBtn4:setEnabled( true )
             
        elseif ( settings.levels[4] == 3 ) then
                locks4.alpha = 0
                lvlBtn4:setEnabled( true )
        end

        if ( settings.levels[5] == 1 ) then
             transition.to( locks5,{time=0,alpha=0})
             lvlBtn5:setEnabled( true )
             
        elseif ( settings.levels[5] == 3 ) then
                locks5.alpha = 0
                lvlBtn5:setEnabled( true )
        end

        if ( settings.levels[6] == 1 ) then
             transition.to( locks6,{time=0,alpha=0})
             lvlBtn6:setEnabled( true )
             
        elseif ( settings.levels[6] == 3 ) then
                locks6.alpha = 0
                lvlBtn6:setEnabled( true )
        end

        if ( settings.levels[7] == 1 ) then
             transition.to( locks7,{time=0,alpha=0})
             lvlBtn7:setEnabled( true )
             
        elseif ( settings.levels[7] == 3 ) then
                locks7.alpha = 0
                lvlBtn7:setEnabled( true )
        end

end


local function level_1(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene("level1")
    storyboard.purgeScene("level1")
    storyboard.gotoScene("level1","fade",1000 )
        return true
end

local function level_2(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level2" )
    storyboard.purgeScene( "level2" )
    storyboard.gotoScene( "level2", "fade", 1000 )
        return true
end

local function level_3(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level3" )
    storyboard.purgeScene( "level3" )
    storyboard.gotoScene( "level3", "fade", 1000 )
        return true
end

local function level_4(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level4" )
    storyboard.purgeScene( "level4" )
    storyboard.gotoScene( "level4", "fade", 1000 )
        return true
end

local function level_5(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level5" )
    storyboard.purgeScene( "level5" )
    storyboard.gotoScene( "level5", "fade", 1000 )
        return true
end

local function level_6(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level6" )
    storyboard.purgeScene( "level6" )
    storyboard.gotoScene( "level6", "fade", 1000 )
        return true
end

local function level_7(event)
    
    if pauseSound.isVisible == true then
		audio.play(tapSound)
    end
    
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.removeScene( "level7" )
    storyboard.purgeScene( "level7" )
    storyboard.gotoScene( "level7", "fade", 1000 )
        return true
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
    local lvlGroup = self.view
    
    starGroup = display.newGroup()
    buts = display.newGroup()
    lock = display.newGroup()

    local bg = display.newImageRect( "im/menu_background.jpg", display.contentWidth, display.contentHeight )
	bg.anchorX = 0
	bg.anchorY = 0
	bg.x, bg.y = 0

    lvlBtn1 = widget.newButton({
                id = tostring( 1 ),
                width = 95,
                height = 95,
                defaultFile = lvls[1],
                overFile = lvlsOv[1],
                onRelease = level_1
                }) 
    lvlBtn1.x = 350 / 3
    lvlBtn1.y = 55


    lvlBtn2 = widget.newButton({
                id = tostring( 2 ),
                width = 95,
                height = 95,
                defaultFile = lvls[2],
                overFile = lvlsOv[2],
                onRelease = level_2
                }) 
    lvlBtn2.x = (350 / 3) * 2
    lvlBtn2.y = 55


    lvlBtn3 = widget.newButton({
                id = tostring( 3 ),
                width = 95,
                height = 95,
                defaultFile = lvls[3],
                overFile = lvlsOv[3],
                onRelease = level_3
                }) 
    lvlBtn3.x = (350 / 3) * 3
    lvlBtn3.y = 55
    
    
    
    lvlBtn4 = widget.newButton({
                id = tostring( 4 ),
                width = 95,
                height = 95,
                defaultFile = lvls[4],
                overFile = lvlsOv[4],
                onRelease = level_4
                }) 
    lvlBtn4.x = (350 / 3)
    lvlBtn4.y = 160


    lvlBtn5 = widget.newButton({
                id = tostring( 5 ),
                width = 95,
                height = 95,
                defaultFile = lvls[5],
                overFile = lvlsOv[5],
                onRelease = level_5
                }) 
    lvlBtn5.x = (350 / 3) * 5 - 350
    lvlBtn5.y = 160


    lvlBtn6 = widget.newButton({
                id = tostring( 6 ),
                width = 95,
                height = 95,
                defaultFile = lvls[6],
                overFile = lvlsOv[6],
                onRelease = level_6
                }) 
    lvlBtn6.x = (350 / 3) * 6 - 350
    lvlBtn6.y = 160


    lvlBtn7 = widget.newButton({
                id = tostring( 7 ),
                width = 95,
                height = 95,
                defaultFile = lvls[7],
                overFile = lvlsOv[7],
                onRelease = level_7
                }) 
    lvlBtn7.x = (display.contentWidth / 2) - 5
    lvlBtn7.y = 265

    locks2 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks2.x = lvlBtn2.x
    locks2.y = lvlBtn2.y
    locks2.alpha = 1


    locks3 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks3.x = lvlBtn3.x
    locks3.y = lvlBtn3.y
    locks3.alpha = 1


    locks4 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks4.x = lvlBtn4.x
    locks4.y = lvlBtn4.y
    locks4.alpha = 1


    locks5 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks5.x = lvlBtn5.x
    locks5.y = lvlBtn5.y
    locks5.alpha = 1


    locks6 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks6.x = lvlBtn6.x
    locks6.y = lvlBtn6.y
    locks6.alpha = 1


    locks7 = display.newImageRect("im/lvls/unlock.png", 90, 90)
    locks7.x = lvlBtn7.x
    locks7.y = lvlBtn7.y
    locks7.alpha = 1

    if (locks2.alpha == 1) then
        lvlBtn2:setEnabled(false)
    end
    
    if (locks3.alpha == 1) then
        lvlBtn3:setEnabled(false)
    end
    
    if (locks4.alpha == 1) then
        lvlBtn4:setEnabled(false)
    end
    
    if (locks5.alpha == 1) then
        lvlBtn5:setEnabled(false)
    end
    
    if (locks6.alpha == 1) then
        lvlBtn6:setEnabled(false)
    end

    if (locks7.alpha == 1) then
        lvlBtn7:setEnabled(false)
    end

    unlocklevel()

    for x=1, 21 do
    stars[x] = display.newImageRect("im/star.png", 30, 30)
    -- stars[x].alpha = 0   
    -- starGroup:insert(stars[x])
    end

    --butang stars ag set to alpha
    --Level 1
    stars[1].x = lvlBtn1.x - 30
    stars[1].y = lvlBtn1.y + 35
    stars[1].alpha = 0

    stars[2].x = lvlBtn1.x + 3
    stars[2].y = lvlBtn1.y + 35
    stars[2].alpha = 0

    stars[3].x = lvlBtn1.x + 35
    stars[3].y = lvlBtn1.y + 35
    stars[3].alpha = 0

    --Level 2
    stars[4].x = lvlBtn2.x - 30
    stars[4].y = lvlBtn2.y + 35
    stars[4].alpha = 0

    stars[5].x = lvlBtn2.x + 3
    stars[5].y = lvlBtn2.y + 35
    stars[5].alpha = 0

    stars[6].x = lvlBtn2.x + 35
    stars[6].y = lvlBtn2.y + 35
    stars[6].alpha = 0

    --Level 3
    stars[7].x = lvlBtn3.x - 30
    stars[7].y = lvlBtn3.y + 35
    stars[7].alpha = 0

    stars[8].x = lvlBtn3.x + 3
    stars[8].y = lvlBtn3.y + 35
    stars[8].alpha = 0

    stars[9].x = lvlBtn3.x + 35
    stars[9].y = lvlBtn3.y + 35
    stars[9].alpha = 0
    
    --Level 4
    stars[10].x = lvlBtn4.x - 30
    stars[10].y = lvlBtn4.y + 35
    stars[10].alpha = 0

    stars[11].x = lvlBtn4.x + 3
    stars[11].y = lvlBtn4.y + 35
    stars[11].alpha = 0

    stars[12].x = lvlBtn4.x + 35
    stars[12].y = lvlBtn4.y + 35
    stars[12].alpha = 0
    
    --Level 5
    stars[13].x = lvlBtn5.x - 30
    stars[13].y = lvlBtn5.y + 35
    stars[13].alpha = 0

    stars[14].x = lvlBtn5.x + 3
    stars[14].y = lvlBtn5.y + 35
    stars[14].alpha = 0

    stars[15].x = lvlBtn5.x + 35
    stars[15].y = lvlBtn5.y + 35
    stars[15].alpha = 0

    --Level 6
    stars[16].x = lvlBtn6.x - 30
    stars[16].y = lvlBtn6.y + 35
    stars[16].alpha = 0

    stars[17].x = lvlBtn6.x + 3
    stars[17].y = lvlBtn6.y + 35
    stars[17].alpha = 0

    stars[18].x = lvlBtn6.x + 35
    stars[18].y = lvlBtn6.y + 35
    stars[18].alpha = 0

    --Level 7
    stars[19].x = lvlBtn7.x - 30
    stars[19].y = lvlBtn7.y + 35
    stars[19].alpha = 0

    stars[20].x = lvlBtn7.x + 3
    stars[20].y = lvlBtn7.y + 35
    stars[20].alpha = 0

    stars[21].x = lvlBtn7.x + 35
    stars[21].y = lvlBtn7.y + 35
    stars[21].alpha = 0

        -- check stars sa level 1
        if (highScore[1] >= 400 and highScore[1] < 800) then
            stars[1].alpha = 1
        elseif (highScore[1] >= 800 and highScore[1] < 1200) then
            stars[1].alpha = 1
            stars[2].alpha = 1
        elseif (highScore[1] >= 1200) then
            stars[1].alpha = 1
            stars[2].alpha = 1
            stars[3].alpha = 1
        end


        -- check stars sa level 2
        if (highScore[2] >= 800 and highScore[2] < 1200) then
            stars[4].alpha = 1
        elseif (highScore[2] >= 1200 and highScore[2] < 1600) then
            stars[4].alpha = 1
            stars[5].alpha = 1
        elseif (highScore[2] >= 1600) then
            stars[4].alpha = 1
            stars[5].alpha = 1
            stars[6].alpha = 1
        end

        -- check stars sa level 3
        if (highScore[3] >= 1200 and highScore[3] < 1600) then
            stars[7].alpha = 1
        elseif (highScore[3] >= 1600 and highScore[3] < 2000) then
            stars[7].alpha = 1
            stars[8].alpha = 1
        elseif (highScore[3] >= 2000) then
            stars[7].alpha = 1
            stars[8].alpha = 1
            stars[9].alpha = 1
        end

        -- check stars sa level 4
        if (highScore[4] >= 1600 and highScore[4] < 2000) then
            stars[10].alpha = 1
        elseif (highScore[4] >= 2000 and highScore[4] < 2400) then
            stars[10].alpha = 1
            stars[11].alpha = 1
        elseif (highScore[4] >= 2400) then
            stars[10].alpha = 1
            stars[11].alpha = 1
            stars[12].alpha = 1
        end


        -- check stars sa level 5
        if (highScore[5] >= 2000 and highScore[5] < 2400) then
            stars[13].alpha = 1
        elseif (highScore[5] >= 2400 and highScore[5] < 2800) then
            stars[13].alpha = 1
            stars[14].alpha = 1
        elseif (highScore[5] >= 2800) then
            stars[13].alpha = 1
            stars[14].alpha = 1
            stars[15].alpha = 1
        end

        -- check stars sa level 6
        if (highScore[6] >= 2400 and highScore[6] < 2800) then
            stars[16].alpha = 1
        elseif (highScore[6] >= 2800 and highScore[6] < 3200) then
            stars[16].alpha = 1
            stars[17].alpha = 1
        elseif (highScore[6] >= 3200) then
            stars[16].alpha = 1
            stars[17].alpha = 1
            stars[18].alpha = 1
        end

        -- check stars sa level 7
        if (highScore[7] >= 2800 and highScore[7] < 3200) then
            stars[19].alpha = 1
        elseif (highScore[7] >= 3200 and highScore[7] < 3600) then
            stars[19].alpha = 1
            stars[20].alpha = 1
        elseif (highScore[7] >= 3600) then
            stars[19].alpha = 1
            stars[20].alpha = 1
            stars[21].alpha = 1
        end


    lvlGroup:insert(bg)
    lvlGroup:insert(lvlBtn1)
    lvlGroup:insert(lvlBtn2)
    lvlGroup:insert(lvlBtn3)
    lvlGroup:insert(lvlBtn4)
    lvlGroup:insert(lvlBtn5)
    lvlGroup:insert(lvlBtn6)
    lvlGroup:insert(lvlBtn7)

    lvlGroup:insert(locks2)
    lvlGroup:insert(locks3)
    lvlGroup:insert(locks4)
    lvlGroup:insert(locks5)
    lvlGroup:insert(locks6)
    lvlGroup:insert(locks7)
    -- lvlGroup:insert(starGroup)

    lvlGroup:insert(stars[1])
    lvlGroup:insert(stars[2])
    lvlGroup:insert(stars[3])

    lvlGroup:insert(stars[4])
    lvlGroup:insert(stars[5])
    lvlGroup:insert(stars[6])

    lvlGroup:insert(stars[7])
    lvlGroup:insert(stars[8])
    lvlGroup:insert(stars[9])

    lvlGroup:insert(stars[10])
    lvlGroup:insert(stars[11])
    lvlGroup:insert(stars[12])

    lvlGroup:insert(stars[13])
    lvlGroup:insert(stars[14])
    lvlGroup:insert(stars[15])

    lvlGroup:insert(stars[16])
    lvlGroup:insert(stars[17])
    lvlGroup:insert(stars[18])

    lvlGroup:insert(stars[19])
    lvlGroup:insert(stars[20])
    lvlGroup:insert(stars[21])

    
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local lvlGroup = self.view
    
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
        
bb = transition.to(backBtn, { transition=easing.inExpo, alpha=1, xScale=1, yScale=1, time=500})


    -- unlocklevel()
    -- lvlGroup:insert(starGroup)
    lvlGroup:insert(stars[1])
    lvlGroup:insert(stars[2])
    lvlGroup:insert(stars[3])

    lvlGroup:insert(stars[4])
    lvlGroup:insert(stars[5])
    lvlGroup:insert(stars[6])

    lvlGroup:insert(stars[7])
    lvlGroup:insert(stars[8])
    lvlGroup:insert(stars[9])

    lvlGroup:insert(stars[10])
    lvlGroup:insert(stars[11])
    lvlGroup:insert(stars[12])

    lvlGroup:insert(stars[13])
    lvlGroup:insert(stars[14])
    lvlGroup:insert(stars[15])

    lvlGroup:insert(stars[16])
    lvlGroup:insert(stars[17])
    lvlGroup:insert(stars[18])

    lvlGroup:insert(stars[19])
    lvlGroup:insert(stars[20])
    lvlGroup:insert(stars[21])
    
    lvlGroup:insert(backBtn)


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local lvlGroup = self.view
	

    
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local lvlGroup = self.view
	

    
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene


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

xOffset = 50
yOffset = 60

function unlocklevel()
    -- for i = 2, maxLevel do
        if ( settings.levels[2] == 1 ) then
             transition.to( locks2,{time=300,alpha=0})
             lvlBtn2:setEnabled( true )
             
        elseif ( settings.levels[2] == 3 ) then
                locks2.alpha = 0
                -- lvlBtn2:setEnabled( false )
        end

        if ( settings.levels[3] == 1 ) then
             transition.to( locks3,{time=300,alpha=0})
             lvlBtn3:setEnabled( true )
             
        elseif ( settings.levels[3] == 3 ) then
                locks3.alpha = 1
                -- lvlBtn3:setEnabled( false )
        end

        if ( settings.levels[4] == 1 ) then
             transition.to( locks4,{time=300,alpha=0})
             lvlBtn4:setEnabled( true )
             
        elseif ( settings.levels[4] == 3 ) then
                locks4.alpha = 1
                -- lvlBtn4:setEnabled( false )
        end

        if ( settings.levels[5] == 1 ) then
             transition.to( locks5,{time=300,alpha=0})
             lvlBtn5:setEnabled( true )
             
        elseif ( settings.levels[5] == 3 ) then
                locks5.alpha = 1
                -- lvlBtn5:setEnabled( false )
        end

        if ( settings.levels[6] == 1 ) then
             transition.to( locks6,{time=300,alpha=0})
             lvlBtn6:setEnabled( true )
             
        elseif ( settings.levels[6] == 3 ) then
                locks6.alpha = 1
                -- lvlBtn6:setEnabled( false )
        end

        if ( settings.levels[7] == 1 ) then
             transition.to( locks7,{time=300,alpha=0})
             lvlBtn7:setEnabled( true )
             
        elseif ( settings.levels[7] == 3 ) then
                locks7.alpha = 1
                -- lvlBtn7:setEnabled( false )
        end

end


local function lvl1Hit(event)
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.purgeScene( "level1" )
    storyboard.gotoScene( "level1", "fade", 500 )
        return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local lvlGroup = self.view
    
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
                onRelease = lvl1Hit
                }) 
    lvlBtn1.x = 350 / 3
    lvlBtn1.y = 55


    lvlBtn2 = widget.newButton({
                id = tostring( 2 ),
                width = 95,
                height = 95,
                defaultFile = lvls[2],
                overFile = lvlsOv[2],
                -- onRelease = buttonHit
                }) 
    lvlBtn2.x = (350 / 3) * 2
    lvlBtn2.y = 55


    lvlBtn3 = widget.newButton({
                id = tostring( 3 ),
                width = 95,
                height = 95,
                defaultFile = lvls[3],
                overFile = lvlsOv[3],
                -- onRelease = buttonHit
                }) 
    lvlBtn3.x = (350 / 3) * 3
    lvlBtn3.y = 55
    
    
    
    lvlBtn4 = widget.newButton({
                id = tostring( 4 ),
                width = 95,
                height = 95,
                defaultFile = lvls[4],
                overFile = lvlsOv[4],
                -- onRelease = buttonHit
                }) 
    lvlBtn4.x = (350 / 3)
    lvlBtn4.y = 160


    lvlBtn5 = widget.newButton({
                id = tostring( 5 ),
                width = 95,
                height = 95,
                defaultFile = lvls[5],
                overFile = lvlsOv[5],
                -- onRelease = buttonHit
                }) 
    lvlBtn5.x = (350 / 3) * 5 - 350
    lvlBtn5.y = 160


    lvlBtn6 = widget.newButton({
                id = tostring( 6 ),
                width = 95,
                height = 95,
                defaultFile = lvls[6],
                overFile = lvlsOv[6],
                -- onRelease = buttonHit
                }) 
    lvlBtn6.x = (350 / 3) * 6 - 350
    lvlBtn6.y = 160


    lvlBtn7 = widget.newButton({
                id = tostring( 7 ),
                width = 95,
                height = 95,
                defaultFile = lvls[7],
                overFile = lvlsOv[7],
                -- onRelease = buttonHit
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

    
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local lvlGroup = self.view
    
    unlocklevel()
    
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

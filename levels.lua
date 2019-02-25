----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require("widget")

lvls = {"im/lvls/lvl1.png","im/lvls/lvl2.png","im/lvls/lvl3.png","im/lvls/lvl4.png","im/lvls/lvl5.png","im/lvls/lvl6.png","im/lvls/lvl7.png"}
lvlsOv = {"im/lvls/lvl1Over.png","im/lvls/lvl2Over.png","im/lvls/lvl3Over.png","im/lvls/lvl4Over.png","im/lvls/lvl5Over.png","im/lvls/lvl6Over.png","im/lvls/lvl7Over.png"}
lvlbtn = { }
-- lock = {"im/lvls/unlock.png"}
locks = { }

xOffset = 50
yOffset = 60


local function buttonHit(event)
    -- storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )   
    storyboard.gotoScene( "level1", "fade", 500 )
        return true
end

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



-- Called when the scene's view does not exist:
function scene:createScene( event )
    local lvlGroup = self.view
    
    buts = display.newGroup()
    lock = display.newGroup()

    local bg = display.newImageRect( "im/menu_background.jpg", display.contentWidth, display.contentHeight )
	bg.anchorX = 0
	bg.anchorY = 0
	bg.x, bg.y = 0

    -- for i = 1, 7 do

    --     -- lvlbtn[i] = display.newImageRect(lvls[i])

    --     -- lvlGroup:insert( lvlbtn[i] )

    --     lvlbtn[i] = widget.newButton({
    --         label = "Level"..tostring(i),
    --         labelColor = { default={ 1, 0, 1 }},
    --         font = "native.systemFontBold",
    --         fontSize = 15,
    --         labelYOffset = 55,
    --         width = 45,
    --         height = 45,
    --         defaultFile = lvls[i],
    --         -- onEvent = buttonHit
    --         }) 
    --     -- lvlbtn[i].destination = "level01"
    --     -- lvlbtn[i].x = xOffset
    --     -- lvlbtn[i].y = yOffset
    --     --lvlbtn[i].islock = skinlocked[i]
        
    --     lvlGroup:insert( lvlbtn[i] )
    -- end


    for i = 1, 7 do

        lvlbtn[i] = widget.newButton({
            id = tostring( i ),
            width = 95,
            height = 95,
            defaultFile = lvls[i],
            overFile = lvlsOv[i],
            onRelease = buttonHit
            }) 

        if (i <= 3) then
        lvlbtn[i].x = (350 / 3) * i
        lvlbtn[i].y = 55
        end

        if (i >= 4 and i < 7) then
        lvlbtn[i].x = (350 / 3) * i - 350
        lvlbtn[i].y = 160
        end


        if (i == 7) then
        lvlbtn[i].x = (display.contentWidth / 2) - 5
        lvlbtn[i].y = 265
        end

    -- io.write("\n")
    -- for j = i, 5 do
    -- io.write("*")
    
    buts:insert(lvlbtn[i])
    -- end
    
    end

    for x = 1, 7 do
    
        locks[x] = display.newImageRect("im/lvls/unlock.png", 90, 90)

        locks[1].alpha = 0

        if (x <= 3) then
            locks[x].x = (350 / 3) * x
            locks[x].y = 55
            end
    
            if (x >= 4 and x < 7) then
            locks[x].x = (350 / 3) * x - 350
            locks[x].y = 160
            end
    
    
            if (x == 7) then
            locks[x].x = (display.contentWidth / 2) - 5
            locks[x].y = 265
            end

    buts:insert(locks[x])
    
    end

    lvlGroup:insert(bg)
    lvlGroup:insert(buts)

    
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local lvlGroup = self.view

    
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local lvlGroup = self.view
	

    
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local lvlGroup = self.view
	

    
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

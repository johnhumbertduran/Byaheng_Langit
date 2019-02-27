coin = {}
coin_triang = display.newGroup()

function triang()
    
    for i = 1, 6 do
        
        coin[i] = display.newImageRect("im/coin.png", 20, 20)
        -- physics.addBody( coin[i], "static", { density=1.2, friction=0, bounce=0} )
        -- coin[i].ngaean = "koyn"

        randCoin1 = math.random(10)
        randCoin2 = math.random(20)
        randCoin3 = math.random(30)

        if (i == 1) then
            coin[i].x = 10 * i
            coin[i].y = 50
        end

        if (i == 2) then
            coin[i].x = -2 * i
            coin[i].y = 80
        end

        if (i == 3) then
            coin[i].x = 8 * i
            coin[i].y = 80
        end

        if (i > 3 and i <= 6) then
            coin[i].x = (-30 * i) + 160
            coin[i].y = 110
        end
        
        coin_triang:insert(coin[i])
        -- coin_triang.x = -100

        if (coin_triang.x <= -370) then
            physics.addBody( coin[i], "static")
    
                -- coin_triang.x = coinRandPos * 5
                -- print("hole")
            end

    end


end

Runtime:addEventListener("enterFrame", triang)

print(coin)



local composer = require( "composer" )
local scene = composer.newScene()
local game = require("game")
--
-- Use widget.newButton and widget.newScrollView
--
local widget = require( "widget" )
--
-- My "global" like data table, see http://coronalabs.com/blog/2013/05/28/tutorial-goodbye-globals/
--
-- This will contain relevent data for tracking the current level, max levels, number of stars earned
-- per level and score per level (Not used in this tutorial) as well as other settings
--
local myData = require( "mydata" )
--
-- Use a vector star for demo purposes, you probably would want a graphic for this.  Math courtesy of:
-- http://www.smiffysplace.com/stars.html
local starVertices = { 0,-8, 1.763,-2.427, 7.608,-2.472, 2.853, 0.927, 4.702, 6.472, 0.0, 3.0, -4.702, 6.472, -2.853, 0.927, -7.608,-2.472, -1.763, -2.427, }
--
-- Button handler to cancel the level selection and return to the menu
--

pixWidth = display.pixelWidth
pixHeight = display.pixelHeight


origXwidIphoneSixPlus = 1080 
origYheiIphoneSixPlus = 1920


conWidth = display.contentWidth
conHeight = display.contentHeight

conXdifNew = conWidth / origXwidIphoneSixPlus
conYdifNew = conHeight / origYheiIphoneSixPlus

origXwid = 320
origYhei = 568
conXdif = conWidth / origXwid
conYdif = conHeight / origYhei
--print( display.contentHeight )










--     switchVar = true
--     --gameLoop()
--local gameLoop = function()
--        if composer.getSceneName("current") == "levelselect" then
--        --print("Hey")
--        --if doneButton ~= nil then
--        --print("Hey")
--        if doneButton.alpha >= 1.00 then switchVar = true end
--        if doneButton.alpha <= 0.65 then switchVar = false end
--        if switchVar == true then doneButton.alpha = doneButton.alpha - .01 --end 
--        else doneButton.alpha = doneButton.alpha + .01 end
--            --print(doneButton.alpha)
--            --end
--        
--        
--            
--            
--            end
--        
--end
--
--local gameInit = function()
--        --if gameLoop ~= running then Runtime:addEventListener( "enterFrame", gameLoop ) end
--    Runtime:addEventListener( "enterFrame", gameLoop )
--end










--switchVar = true
--     --gameLoop()
--local gameLoop = function()
--        if composer.getSceneName("current") == "levelselect" then
--        --print("Hey")
--        --if doneButton ~= nil then
--        --print("Hey")
--        if buttons[myData.settings.unlockedLevels].alpha >= 1.00 then switchVar = true end
--        if buttons[myData.settings.unlockedLevels].alpha <= 0.65 then switchVar = false end
--        if switchVar == true then buttons[myData.settings.unlockedLevels].alpha = buttons[myData.settings.unlockedLevels].alpha - .01 --end 
--        else buttons[myData.settings.unlockedLevels].alpha = buttons[myData.settings.unlockedLevels].alpha + .01 end
--            --print(doneButton.alpha)
--            --end
--        
--        
--            
--            
--            end
--        
--end
--
--local gameInit = function()
--        --if gameLoop ~= running then Runtime:addEventListener( "enterFrame", gameLoop ) end
--    Runtime:addEventListener( "enterFrame", gameLoop )
--end
--gameInit()












--start loadlevels functions
local function loadlevel1( event )

    if ( "ended" == event.phase ) then
        composer.removeScene( "1", false )
        composer.gotoScene( "1", { effect = "crossFade", time = 333 } )
    end
end

--end loadlevels functions













local function handleCancelButtonEvent( event )
    if ( "ended" == event.phase ) then
        --composer.removeScene("game", true)
        --composer.removeScene("levelselect", true)
        --composer.removeScene( "game", false )
        --Runtime:removeEventListener( "enterFrame", gameLoop )
        blankCube[1].isVisible = false
        blankCube[2].isVisible = false
        blankCube[3].isVisible = false
        blankCube[4].isVisible = false
        blankCube[5].isVisible = false
        blankCube[6].isVisible = false
        blankCube[7].isVisible = false
        blankCube[8].isVisible = false
        blankCube[9].isVisible = false
        blankCube[10].isVisible = false
    phaseNum = 1
    phaseVar = 1
        composer.gotoScene( "game", { effect = "crossFade", time = 333 } )
    end
end













--
-- Button handler to go to the selected level
--
local xChangeVar = 5
local yChangeVar = 2
local buttonClickSound = audio.loadSound("buttonClickSound.mp3")
local function handleLevelSelect( event )
    if ("began" == event.phase ) then
        event.target.x = event.target.x + xChangeVar
        event.target.y = event.target.y - yChangeVar
        end
    if ("cancelled" == event.phase ) then
        event.target.x = event.target.x - xChangeVar
        event.target.y = event.target.y + yChangeVar
        end
    if ( "ended" == event.phase )  then
--        game.minusNuM = 0
--        game.minusNuM2 = 0
        --Runtime:removeEventListener("enterFrame", resetMist )
        --
        -- event.target is the button.  The ID is a number indicating the level going to.  
        -- the "game" scene will use this setting to determine which level to play.  This could
        -- be done by passing parameters too.
        --
        -- Also purge the game scene so we get a fresh start.
        --

        --print(event.target.id)
--        buttons[event.target.id].x = buttons[event.target.id].x + 10
--        buttons[event.target.id].y = buttons[event.target.id].y + 5
        event.target.x = event.target.x - xChangeVar -- resets back to original value
        event.target.y = event.target.y + yChangeVar -- resets back to original value
        
        blankCube[1].isVisible = false
        blankCube[2].isVisible = false
        blankCube[3].isVisible = false
        blankCube[4].isVisible = false
        blankCube[5].isVisible = false
        blankCube[6].isVisible = false
        blankCube[7].isVisible = false
        blankCube[8].isVisible = false
        blankCube[9].isVisible = false
        blankCube[10].isVisible = false
        
    phaseNum = 1
    phaseVar = 1
        
        audio.play(buttonClickSound)

        myData.settings.currentLevel = event.target.id
        --print(myData.settings.currentLevel)
        tmpScene = "" .. myData.settings.currentLevel
        SceneNum = 0 + myData.settings.currentLevel -- I added the 0 + ... so that it looks at this var as a NUM and not a STRING
        SceneAmount = 0 + myData.settings.unlockedLevels
        --print(SceneAmount)
        --print(tmpScene)
        --print(""..SceneNum-1)
        --if SceneNum > 1 then for i=1,SceneNum-1,1 do print(i) composer.removeScene(""..SceneNum-1,true) end end
        for i=1,SceneAmount,1 do if (SceneNum ~= i)and(myData.activeScenes[i]==true) then composer.removeScene(""..i,true) end end
        --myData.activeScenes[i] = false end end
        --composer.removeScene(""..1,true)
        --if SceneNum == 1 then composer.removeScene(""..SceneNum,true) end
        composer.removeScene( tmpScene, false )
        composer.gotoScene( tmpScene, { effect = "crossFade", time = 333 } )
        
--        composer.removeScene( "1", false )
--        composer.gotoScene( "1", { effect = "crossFade", time = 333 } )
      --Runtime:removeEventListener("enterFrame", resetMist )
--        game.minusNuM = 0
--        game.minusNuM2 = 0
        
    end
end






--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view
    --
    -- create your background here
    --
    local background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert(background)
    --
    
    
    
    
    
    
    
    
    local orangeCube = display.newImageRect("orangeCube.png", 200 * conXdifNew, 200 * conYdifNew)
    orangeCube.x = display.contentCenterX
    orangeCube.y = display.contentHeight * .15
    orangeCube.isVisible = false
    -- split
    local blueCube = display.newImageRect("blueCube.png", 200 * conXdifNew, 200 * conYdifNew)
    blueCube.x = display.contentCenterX
    blueCube.y = display.contentHeight * .15
    blueCube.isVisible = false
    -- split
    local darkerBlueCube = display.newImageRect("darkerBlueCube.png", 200 * conXdifNew, 200 * conYdifNew)
    darkerBlueCube.x = display.contentCenterX
    darkerBlueCube.y = display.contentHeight * .15
    darkerBlueCube.isVisible = false
    -- split
    local purpleCube = display.newImageRect("purpleCube.png", 200 * conXdifNew, 200 * conYdifNew)
    purpleCube.x = display.contentCenterX
    purpleCube.y = display.contentHeight * .15
    purpleCube.isVisible = false
    -- split
    local redCube = display.newImageRect("redCube.png", 200 * conXdifNew, 200 * conYdifNew)
    redCube.x = display.contentCenterX
    redCube.y = display.contentHeight * .15
    redCube.isVisible = false
    -- split
    local lightRedCube = display.newImageRect("lightRedCube.png", 200 * conXdifNew, 200 * conYdifNew)
    lightRedCube.x = display.contentCenterX
    lightRedCube.y = display.contentHeight * .15
    lightRedCube.isVisible = false
    -- split
    local pinkCube = display.newImageRect("pinkCube.png", 200 * conXdifNew, 200 * conYdifNew)
    pinkCube.x = display.contentCenterX
    pinkCube.y = display.contentHeight * .15
    pinkCube.isVisible = false
    -- split
    local greenCube = display.newImageRect("greenCube.png", 200 * conXdifNew, 200 * conYdifNew)
    greenCube.x = display.contentCenterX
    greenCube.y = display.contentHeight * .15
    greenCube.isVisible = false
    -- split
    local yellowCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
    yellowCube.x = display.contentCenterX
    yellowCube.y = display.contentHeight * .15
    yellowCube.isVisible = false
    -- split
    
    local blankCubeA = orangeCube
    blankCubeA.isVisible = true
    
    
    local fakeCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
    yellowCube.x = display.contentCenterX
    yellowCube.y = display.contentHeight * .15
    yellowCube.isVisible = false
    
    
--    local blankCube = {}
    blankCube = {}
    blankCube[1] = orangeCube
    blankCube[2] = blueCube
    blankCube[3] = darkerBlueCube
    blankCube[4] = purpleCube
    blankCube[5] = redCube
    blankCube[6] = lightRedCube
    blankCube[7] = pinkCube
    blankCube[8] = greenCube
    blankCube[9] = yellowCube
        blankCube[10] = fakeCube -- this isn't really used for anything 
    
    --blankCube[2].isVisible = true
    blankCube[1].isVisible = true
    
    
    local resetCubes = function()
--    blankCube[1] = orangeCube
--    blankCube[2] = blueCube
--    blankCube[3] = darkerBlueCube
--    blankCube[4] = purpleCube
--    blankCube[5] = redCube
--    blankCube[6] = lightRedCube
--    blankCube[7] = pinkCube
--    blankCube[8] = greenCube
--    blankCube[9] = yellowCube
        
        
--    blankCube[1].isVisible = true
--    blankCube[2].isVisible = false
--    blankCube[3].isVisible = false
--    blankCube[4].isVisible = false
--    blankCube[5].isVisible = false
--    blankCube[6].isVisible = false
--    blankCube[7].isVisible = false
--    blankCube[8].isVisible = false
--    blankCube[9].isVisible = false
        
        --transitionCube()
    
        
        end
    
    
    --local animeisOver = false
    phaseNum = 1
    phaseVar = 1
    local count = 1
--    local transitionCube = function()
    function transitionCube (event)
    
--    if phaseNum == 1 then transition.dissolve( orangeCube, blueCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 2 then transition.dissolve( blueCube, darkerBlueCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 3 then transition.dissolve( darkerBlueCube, purpleCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 4 then transition.dissolve( purpleCube, redCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 5 then transition.dissolve( redCube, lightRedCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 6 then transition.dissolve( lightRedCube, pinkCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 7 then transition.dissolve( pinkCube, greenCube, 2000, 200 ) phaseNum = phaseNum + 1 end
--    if phaseNum == 8 then transition.dissolve( greenCube, yellowCube, 2000, 200 ) phaseNum = 1 end
        
--    if phaseNum == 1 then transition.dissolve( blankCubeA, blueCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=blueCube end
--    if phaseNum == 2 then transition.dissolve( blankCubeA, darkerBlueCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=darkerBlueCube end
--    if phaseNum == 3 then transition.dissolve( blankCubeA, purpleCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=purpleCube end
--    if phaseNum == 4 then transition.dissolve( blankCubeA, redCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=redCube end
--    if phaseNum == 5 then transition.dissolve( blankCubeA, lightRedCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=lightRedCube end
--    if phaseNum == 6 then transition.dissolve( blankCubeA, pinkCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=pinkCube end
--    if phaseNum == 7 then transition.dissolve( blankCubeA, greenCube, 2000, 200 ) phaseNum = phaseNum + 1 blankCubeA=greenCube end
--    if phaseNum == 8 then transition.dissolve( blankCubeA, yellowCube, 2000, 200 ) phaseNum = 1 blankCubeA=yellowCube end
        
        
        
        --while count < 10 do
        --count = count + 1
        blankCube[9].isVisible = false
        phaseVar = 1
        if phaseNum == 9 then phaseVar = -8 end
        transition.dissolve( blankCube[phaseNum], blankCube[phaseNum+phaseVar], 2000, 0 ) -- original delay : 200 
        phaseNum = phaseNum + 1
--        if phaseNum == 9 then blankCube[9].isVisible = false phaseNum = 1 print("hey") end --resetCubes() end --animeisOver = true end
        if phaseNum == 9 then transition.dissolve( blankCube[9], blankCube[1], 2000, 0 )
            phaseNum = 1 end --print("hey") end --resetCubes() end --animeisOver = true end
            --end
        
        --transition.dissolve( blankCube[1], blankCube[2], 2000, 200 )
    end
    --transitionCube()
    
--    blankCube[1].isVisible = true
    
    local function spinImage (event)
        --transitionCube()
        --timer.performWithDelay( 2000, transitionCube )
        if composer.getSceneName("current") == "levelselect" then
        blankCube[1].isVisible = true
        
        transitionCube()
            end
--        if animeisOver == true then
        --transition.to( blankCube[1], { rotation = blankCube[1].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[2], { rotation = blankCube[2].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[3], { rotation = blankCube[3].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[4], { rotation = blankCube[4].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[5], { rotation = blankCube[5].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[6], { rotation = blankCube[6].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[7], { rotation = blankCube[7].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[8], { rotation = blankCube[8].rotation-360, time=2000, onComplete=spinImage } )
--        transition.to( blankCube[9], { rotation = blankCube[9].rotation-360, time=2000, onComplete=spinImage } )
        blankCube[10].isVisible = false
        transition.to( blankCube[10], { rotation = blankCube[10].rotation-360, time=2000, onComplete=spinImage } )
--            end
--        animeisOver = false
end
spinImage()
    
    
    
    
    
    
    transLoc = true
    LocChangeAmt = .20
    totalLocChange = 0
    local gameLoopE = function()
        if composer.getSceneName("current") == "levelselect" then

      --print("hey")

        if transLoc == true then
        blankCube[1].y = blankCube[1].y - LocChangeAmt
        blankCube[2].y = blankCube[2].y - LocChangeAmt
        blankCube[3].y = blankCube[3].y - LocChangeAmt
        blankCube[4].y = blankCube[4].y - LocChangeAmt
        blankCube[5].y = blankCube[5].y - LocChangeAmt
        blankCube[6].y = blankCube[6].y - LocChangeAmt
        blankCube[7].y = blankCube[7].y - LocChangeAmt
        blankCube[8].y = blankCube[8].y - LocChangeAmt
        blankCube[9].y = blankCube[9].y - LocChangeAmt
            totalLocChange = totalLocChange + LocChangeAmt
            end
        
        if transLoc == false then
        blankCube[1].y = blankCube[1].y + LocChangeAmt
        blankCube[2].y = blankCube[2].y + LocChangeAmt
        blankCube[3].y = blankCube[3].y + LocChangeAmt
        blankCube[4].y = blankCube[4].y + LocChangeAmt
        blankCube[5].y = blankCube[5].y + LocChangeAmt
        blankCube[6].y = blankCube[6].y + LocChangeAmt
        blankCube[7].y = blankCube[7].y + LocChangeAmt
        blankCube[8].y = blankCube[8].y + LocChangeAmt
        blankCube[9].y = blankCube[9].y + LocChangeAmt
            totalLocChange = totalLocChange + LocChangeAmt
            end
--        if totalLocChange >= 20000 then totalLocChange = 0.00 transLoc = !(transLoc) end
        --print(totalLocChange)
        if totalLocChange >= 21 then
            totalLocChange = 0.00
            if transLoc == true then transLoc = false else transLoc = true end 
        end
        
            
            
            end
        
end

local gameInitE = function()
    Runtime:addEventListener( "enterFrame", gameLoopE )
end
gameInitE()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
--    sceneGroup:insert(blankCube[1])
--    sceneGroup:insert(blankCube[2])
--    sceneGroup:insert(blankCube[3])
--    sceneGroup:insert(blankCube[4])
--    sceneGroup:insert(blankCube[5])
--    sceneGroup:insert(blankCube[6])
--    sceneGroup:insert(blankCube[7])
--    sceneGroup:insert(blankCube[8])
--    sceneGroup:insert(blankCube[9])
--    sceneGroup:insert(blankCube[10])
    
--    
--    local gameLoopB = function()
--        if composer.getSceneName("current") == "levelselect" then
--        transitionCube()
--            end
--        
--end
-- 
--
--local gameInitB = function()
--    Runtime:addEventListener( "enterFrame", gameLoopB )
--end
-- 
--    
--    
--    gameInitB()
    
    
    
    
    
    
    --orangeCube.transition = transition.to( blueCube, { delay=200, alpha=0} )
    
--    -- Fade in function
--local function fadeIn(target, after)
--  target.transition = transition.to( "blueCube.png", { delay=200, alpha=1, onComplete=after } )
--        print("working")
--end
--
---- Fade out function
--local function fadeOut(target, after)
--  target.transition = transition.to( "blueCube.png", { delay=200, alpha=0, onComplete=after } )
--end
--
--fadeOut(orangeCube, function() fadeIn(orangeCube) end)
    
    
    
    
    
    
    
    
    
    
    
    
    -- Use a widget.newScrollView to contain all the level button objects so you can support more than 
    -- a screen full of them.  Since this will only scroll vertically, lock the horizontal scrolling.
    --
--    levWid = (360 / 640) * pixWidth
--    levHei = (260 / 1136) * pixHeight
    
--    levWid = (360/origXwid) * conWidth
    levWid = (280/origXwid) * conWidth
    levHei = (260/origYhei) * conHeight
--    levWid = (360) * conXdif
--    levHei = (260) * conYdif
    --290
--    levScrollWid = (460 / 640) * pixWidth
--    levScrollHei = (800 / 1136) * pixHeight
    
--    levScrollWid = (460/origXwid) * conWidth
    levScrollWid = (460/origXwid) * conWidth
    levScrollHei = (800/origYhei) * conHeight
    local levelSelectGroup = widget.newScrollView({
        friction = 1.00,
        isBounceEnabled = true,
        width = levWid,
        height = levHei,
        scrollWidth = levScrollWid,
        scrollHeight = levScrollHei,
        verticalScrollDisabled = true

    })
    --
    -- xOffset, yOffset and cellCount are used to position the buttons in the grid.  Set their
    -- initial values.
    --
--    scaleXoff = (64 / 640) * pixWidth
--    scaleYoff = (24 / 1136) * pixHeight
    scaleXoff = (30/origXwid) * conWidth
    scaleYoff = (24/origYhei) * conHeight
--    scaleXoff = (64) * conXdif
--    scaleYoff = (24) * conYdif
    local xOffset = scaleXoff
    local yOffset = scaleYoff
    local cellCount = 1
    --
    -- define the array to hold each button
    --
--    local buttons = {}
    buttons = {}
    --
    -- Determine the maxLevels from the myData table.  This is where you determine how many
    -- levels your game supports.  Loop over them, generating one button, group for each.
    --
--    btnWidthX = (48 / 640) * pixWidth
--    btnHeightY = (32 / 1136) * pixHeight
    btnWidthX = (48)*conXdif
    btnHeightY = (32)*conYdif
    
    --btnfontSize = (btnWidthX + btnHeightY) / (40/9) -- 40/9 is the frac you get when you do the original ((height+width) / (18)) = 4.4444 or 40/9
    
--    btnfontSize = (pixWidth+pixHeight)/(640+1136) * 18
    btnfontSize = 18 * ((conXdif+conYdif)/2)
    btnfontSizeFloor = math.floor(btnfontSize)
--    btnCornerRadius = (pixWidth+pixHeight)/(640+1136) * 8 
    btnCornerRadius = 8 * ((conXdif+conYdif)/2)
    btnCornerRadiusFloor = math.floor(btnCornerRadius)
--    btnStrokeWidth = (pixWidth+pixHeight)/(640+1136) * 1.4
    
    for i = 1, myData.maxLevels do
        -- create the button
        buttons[i] = widget.newButton({
            label = tostring( i ),
            id = tostring( i ),
            onEvent = handleLevelSelect,
            emboss = false,
            --properties for a rounded rectangle button...
            shape="RoundedRect",
            width = btnWidthX,
            height = btnHeightY,
            font = native.systemFontBold,
            fontSize = btnfontSizeFloor,
            labelColor = { default = { 1, 1, 1}, over = { 0.5, 0.5, 0.5 }},
            cornerRadius = btnCornerRadiusFloor,
            labelYOffset = 0, 
--            fillColor = { default={ 0, 0.5, 1, 1 }, over={ 0.5, 0.75, 1, 1 } },
            fillColor = { default={ 228/255, 134/255, 100/255, 1 }, over={ 232/255, 112/255, 106/255, 1 } },
--            strokeColor = { default={ 0, 0, 1, 1 }, over={ 0.333, 0.667, 1, 1 } },
                strokeColor = { default={ 232/255, 112/255, 106/255, 1 }, over={ 228/255, 134/255, 100/255, 1 } },
            strokeWidth = 4.00 --1.4
        })
        -- position the button in the grid and add to the scrollView
        buttons[i].x = xOffset
        buttons[i].y = yOffset
        levelSelectGroup:insert(buttons[i])
        








        --
        -- Check to see if the player has achieved this level or not.  The .unlockedLevels
        -- value tracks the maximum level they have unlocked.  This lets them play previous
        -- levels if they wish to try and do better. 
        --
        -- However first, check to make sure this value has been set.  For a new user this
        -- value should be 1 if it's not been set.
        --
        -- If the level is locked, disable the button and fade the button out.
        -- 
        if myData.settings.unlockedLevels == nil then
            myData.settings.unlockedLevels = 1
        end
        if i <= myData.settings.unlockedLevels then
            buttons[i]:setEnabled( true )
            buttons[i].alpha = 1.0
        else
            buttons[i]:setEnabled( false )
            buttons[i].alpha = 0.5
        end
        --
        -- Now generate stars earned for each level but only if:
        -- a. the levels table exists
        -- b. There is a stars value inside of the levels table and
        -- c. The number of stars is greater than 0 (no need to draw 0 stars, eh?)
        --
        -- Generate the star and position it relative to the button it goes with.
     
        -- 
        -- Compute the position of the next button.  This is set to draw 5 wide.  It also spaces based on
        -- the button width and height + initial offset from the left.
        --
        yOffsetAdd = (45 / origYhei) * conHeight 
        xOffsetAdd = (75 / origXwid) * conWidth 
        otheryOffset = (24 / origYhei) * conHeight
        
        yOffset = yOffset + yOffsetAdd
        cellCount = cellCount + 1
        if cellCount > 5 then
            cellCount = 1
            yOffset = otheryOffset
            xOffset = xOffset + xOffsetAdd
        end
    end -- end long for loop
    --print(myData.settings.unlockedLevels)
    --print(buttons[2].alpha)
--    gameInit()
    
    
    
    
    
    
    
    
    
    --
    -- Load the scrollView into the scene and center it!
    --
    sceneGroup:insert(levelSelectGroup)
    levelSelectGroup.x = display.contentCenterX
    levelSelectGroup.y = display.contentCenterY
    --
    -- Create a cancel button to give the player a chance to go back to your menu scene.
    --
--    local doneButton = widget.newButton({
    doneButton = widget.newButton({
        id = "button1",
        label = "BACK",
        onEvent = handleCancelButtonEvent
    })
    --print(display.pixelHeight)
    doneButton.x = display.contentCenterX
    doneButton:scale(conXdif,conYdif)
    --print(conXdif)
    doneButton.alpha = 1.00
    
    
    
--    switchVar = true
--while composer.getSceneName("current") == "levelselect" do
----print("Hey")
----print(doneButton.alpha)
--if doneButton.alpha == 1.00 then switchVar = true end
--        if doneButton.alpha == 0.00 then switchVar = false end
--        if switchVar == true then doneButton.alpha = doneButton.alpha - .01 end 
--        --else doneButton.alpha = doneButton.alpha + .01 end
--        
--end
    
    
    


    
--local gameInit = function()
--        --if gameLoop ~= running then Runtime:addEventListener( "enterFrame", gameLoop ) end
--    Runtime:addEventListener( "enterFrame", gameLoop )
--end 
    
    
    --gameInit()  -- <-- active site
    
    
    
    --if gameLoop == running then print("is") end
    
--local gameInitRemove = function()
--        Runtime:removeEventListener( "enterFrame", gameLoop )
--        end
--    gameInitRemove()
        
    
    
    
    
    --print(doneButton.alpha)
--    minusHeight = (20 / 1136) * pixHeight
minusHeight = (20 / origYhei) * conHeight
    doneButton.y = display.contentHeight - minusHeight
    sceneGroup:insert( doneButton )
end



 





-- switchVar = true
    -- gameLoop()
--local gameLoop = function()
--        if composer.getSceneName("current") == "levelselect" then
--        --print("Hey")
--        if doneButton ~= nil then
--        print("Hey")
--        if doneButton.alpha == 1.00 then switchVar = true end
--        if doneButton.alpha == 0.00 then switchVar = false end
--        if switchVar == true then doneButton.alpha = doneButton.alpha - .01 end 
--        --else doneButton.alpha = doneButton.alpha + .01 end
--            end
--        
--            end
--        
--end

--switchVar = true
--while composer.getSceneName("current") == "levelselect" do
--print("Hey")
--print(doneButton.alpha)
--if doneButton.alpha == 1.00 then switchVar = true end
--        if doneButton.alpha == 0.00 then switchVar = false end
--        if switchVar == true then doneButton.alpha = doneButton.alpha - .01 end 
--        --else doneButton.alpha = doneButton.alpha + .01 end
--        
--end



--local gameInit = function()
--    Runtime:addEventListener( "enterFrame", gameLoop )
--end 
--    gameInit()
    
    
    





--
function scene:show( event )
    local sceneGroup = self.view
    --
    if event.phase == "did" then
    end
end
--
function scene:hide( event )
    local sceneGroup = self.view
    --
    if event.phase == "will" then
    end
end
--
function scene:destroy( event )
    local sceneGroup = self.view   
end
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene

display.setStatusBar(display.HiddenStatusBar)




local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "utility" )
local myData = require( "mydata" )


local conf = require("config")

local starVertices = { 0,-11, 2.7,-3.5, 10.5,-3.5, 4.3,1.6, 6.5,9.0, 0,4.5, -6.5,9.0, -4.3,1.5, -10.5,-3.5, -2.7,-3.5, }

local params





pixWidth = display.pixelWidth
pixHeight = display.pixelHeight

    pixXdif = pixWidth / 640
    pixYdif = pixHeight / 1136





conWidth = display.contentWidth
conHeight = display.contentHeight
--conWidth = display.actualContentWidth
--conHeight = display.actualContentHeight

--conWidth = application.content.width
--conHeight = application.content.height
--origXwid = 320
--origYhei = 568
--print(display.contentWidth)print(display.contentHeight)
--print(display.pixelWidth)print(display.pixelHeight)
origXwid = 320
origYhei = 568
--conXdif = conWidth / origXwid
--conYdif = conHeight / origYhei

origXwidIphoneSixPlus = 1080 
origYheiIphoneSixPlus = 1920

origAspectRatio = 1334 / 750
aspectRatioDif = aspectRatio / origAspectRatio

--conMult = 1.5 * aspectRatioDif  -- 1.5

--conXdif = (display.pixelHeight / display.pixelWidth) * 1.5
--conYdif = (display.pixelHeight / display.pixelWidth) * 1.5

conWidth = display.contentWidth
conHeight = display.contentHeight

conXdifNew = conWidth / origXwidIphoneSixPlus
conYdifNew = conHeight / origYheiIphoneSixPlus

--conXdifNewb = conWidth / origXwidIphoneSixPlus
--conYdifNewb = conHeight / origYheiIphoneSixPlus

origXwid = 320
origYhei = 568
conXdif = conWidth / origXwid
conYdif = conHeight / origYhei



--conXdif = (display.pixelHeight / display.pixelWidth) * 2
--conYdif = (display.pixelHeight / display.pixelWidth) * 2

--print( display.pixelHeight / display.pixelWidth )

--mistXdif = display.pixelWidth / 1600
--mistYdif = display.pixelHeight / 1122
mistXdif = display.contentWidth / 1600
mistYdif = display.contentHeight / 1122

--print(mistXdif)print(mistYdif)


--DimenDifX = (display.pixelWidth / 750)
--DimenDifY = (display.pixelHeight / 1334)
DimenDifX = (display.contentWidth / 750)
DimenDifY = (display.contentHeight / 1334)


--print(display.contentWidth) print(display.contentHeight)

--testDimenX = ((display.pixelWidth+49) / 750)
--testDimenY = ((display.pixelHeight+87) / 1334)


--pixrex = 20
--if pixrex == 20 then print("yep!") end


--local cubeTemplateGroup = display.newGroup()
--local cubeTemplate = {}
--cubeTemplate[1] = display.newImageRect(cubeTemplateGroup,"orangeCube.png", 50, 50)
--cubeTemplate[2] = display.newImageRect(cubeTemplateGroup,"blueCube.png", 50, 50)
--cubeTemplate[3] = display.newImageRect(cubeTemplateGroup,"darkerBlueCube.png", 50, 50)
--cubeTemplate[4] = display.newImageRect(cubeTemplateGroup,"purpleCube.png", 50, 50)
--cubeTemplate[5] = display.newImageRect(cubeTemplateGroup,"redCube.png", 50, 50)
--cubeTemplate[6] = display.newImageRect(cubeTemplateGroup,"lightRedCube.png", 50, 50)
--cubeTemplate[7] = display.newImageRect(cubeTemplateGroup,"pinkCube.png", 50, 50)
--cubeTemplate[8] = display.newImageRect(cubeTemplateGroup,"greenCube.png", 50, 50)
--cubeTemplate[9] = display.newImageRect(cubeTemplateGroup,"yellowCube.png", 50, 50)
--cubeTemplateGroup.alpha = 0.00
--cubeTemplateGroup.x = -(display.contentWidth * 10)


--local asteroidGroup = display.newGroup()
--
--local asteroidImage = display.newImage( asteroidGroup, "asteroidCubeA.png", 500, 700)

local asteroidGroup = display.newGroup()
local asteroidImage = {}
asteroidImage[1] = display.newImage( asteroidGroup, "asteroidCubeA.png", 500, 700)
asteroidImage[1].alpha = 0.00

local asteroidTrails = {}
asteroidTrails[1] = display.newImage("asteroidCubeA.png", 500, 700)
asteroidTrails[1].alpha = 0.00




--backgroundMusic = audio.loadStream("mainMenumusic.mp3")
--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=2, loops=-1}  )
----audio.stop( backgroundMusicChannel )
--
----startBGM = function()
----    local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1}  )
----end
----startBGM()






local function loadlevel1( event )

    if ( "ended" == event.phase ) then
        composer.removeScene( "1", false )
        composer.gotoScene( "1", { effect = "crossFade", time = 333 } )
        --audio.stop( backgroundMusicChannel )
        --audio.fadeOut( { channel=2, time=2000 } )
    end
end



local function handleCancelButtonEvent( event )

    if ( "ended" == event.phase ) then
        --Runtime:removeEventListener("enterFrame", resetMist )
--        minusNuM = 0
--        minusNuM2 = 0
        --composer.removeScene( "levelselect", false )
        --blankCube[1].isVisible = true
        composer.gotoScene( "levelselect", { effect = "crossFade", time = 333 } )
        --audio.stop( backgroundMusicChannel )
        --audio.fadeOut( { channel=2, time=2000 } )
    end
end






-- Start the composer event handlers
--
--buttonsstart
function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --





    physics.start()


    local background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert(background)




    
--    local titleS = display.newImageRect("titleS.png", 150, 150)
--    titleS.x = display.contentWidth * .1
--    titleS.y = display.contentHeight * 0
--    physics.addBody( titleS, "dynamic", { friction=1.7 } )
--    
--    local titleP = display.newImageRect("titleP.png", 150,150)
--    titleP.x = display.contentWidth * .3
--    titleP.y = display.contentHeight * 0
--    physics.addBody( titleP, "dynamic", { friction=1.7 } )
--    
--    local titleO1 = display.newImageRect("titleO1.png", 150,150)
--    titleO1.x = display.contentWidth * .5
--    titleO1.y = display.contentHeight * 0
--    physics.addBody( titleO1, "dynamic", { friction=1.7 } )
--    
--    local titleO2 = display.newImageRect("titleO2.png", 150,150)
--    titleO2.x = display.contentWidth * .7
--    titleO2.y = display.contentHeight * 0
--    physics.addBody( titleO2, "dynamic", { friction=1.7 } )
--    
--    local titleK = display.newImageRect("titleK.png", 150,150)
--    titleK.x = display.contentWidth * .9
--    titleK.y = display.contentHeight * 0
--    physics.addBody( titleK, "dynamic", { friction=1.7 } )
--    
----    local titleS = display.newImage("titleS.png", 150, 150)
----    titleS:scale(1, 1)
----    titleS.x = display.contentWidth * .1
----    titleS.y = display.contentHeight * 0
----    physics.addBody( titleS, "dynamic", { friction=1.7 } )
----    
----    local titleP = display.newImage("titleP.png", 150,150)
----    titleP:scale(1, 1)
----    titleP.x = display.contentWidth * .3
----    titleP.y = display.contentHeight * 0
----    physics.addBody( titleP, "dynamic", { friction=1.7 } )
----    
----    local titleO1 = display.newImage("titleO1.png", 150,150)
----    titleO1:scale(1, 1)
----    titleO1.x = display.contentWidth * .5
----    titleO1.y = display.contentHeight * 0
----    physics.addBody( titleO1, "dynamic", { friction=1.7 } )
----    
----    local titleO2 = display.newImage("titleO2.png", 150,150)
----    titleO2:scale(1, 1)
----    titleO2.x = display.contentWidth * .7
----    titleO2.y = display.contentHeight * 0
----    physics.addBody( titleO2, "dynamic", { friction=1.7 } )
----    
----    local titleK = display.newImage("titleK.png", 150,150)
----    titleK:scale(1, 1)
----    titleK.x = display.contentWidth * .9
----    titleK.y = display.contentHeight * 0
----    physics.addBody( titleK, "dynamic", { friction=1.7 } )
--    
--    
--    
--    
--    
--    local barrierText = display.newImageRect("wall.png", display.contentWidth, 10)
--    barrierText.x = display.contentCenterX
--    barrierText.y = display.pixelHeight * .28
--    physics.addBody( barrierText, "static", { friction=1.7 } )
--    barrierText.isVisible = false
    
    
    
    
    
    
    
    


---- enclosure - START !!!!!
--
----locationX = (160 / 640) * pixWidth
----locationY = (54 / 1136) * pixHeight
----locationX = 160 * pixXdif
----locationY = 54 * pixYdif
--locationX1 = display.contentWidth * .5
--locationY1 = display.contentHeight * .22
----locationX2 = display.contentWidth * .80
----locationX2 = display.contentWidth * 2.2
----locationX2 = display.contentWidth * 2.28
--locationX2 = display.contentWidth * 2.192 --locationX2 = display.contentWidth * 2.192
--locationY2 = display.contentHeight * .30
--    --print(display.contentWidth * .08)
--    
--    difTry = conXdif * 1600
--    difTryB = difTry / 2
--    --print(difTryB)
----locationX3 = display.contentWidth * 5.364
----locationY3 = display.contentHeight * .30
--    
--    newXdif = (display.contentWidth) / 375
----    locationX3VAR = (875.35) * (conWidth / 375)
--    --X3numVAR = (875.35)
--    locationX3VAR = (875.35) * newXdif
--    
--    --print(locationX3VAR)
--    --print(875.35 * conXdif)
----locationX3 = (difTryB + locationX2) + 875.35 --775.35
--    locationX3 = (difTryB + locationX2) + locationX3VAR
--    --locationX3 = locationX3 + 2000
--locationY3 = display.contentHeight * .30
--    
--    --locX3 = (difTryB + locationX2) + 875.35 --775.35
----    locX3 = (difTryB + locationX2) + 774.35
----    locX3 = (difTryB + locationX2) + 773.30
----    locX3 = (difTryB + locationX2) + 773.30
--    
----    locX3VAR = (773.30) * (conWidth / 375)
--    locX3VAR = (773.30) * newXdif
--    
--    --print(conWidth)
--    --locX3 = (difTryB + locationX2) + 773.30
--    locX3 = (difTryB + locationX2) + locX3VAR
--    --print(display.contentWidth)
--    newProconWidth = 768
--    --print( 336.25 * (375 / 768) )
--    --X3numVAR = 336.25 * (display.contentWidth / newProconWidth)
--    X3numVAR = 0
--    locX3 = locX3 + X3numVAR --336.25 --337.5
--
--local title = display.newImage( "title.png" )
--    title.x = locationX1
--    title.y = locationY1
--    --title:scale(pixXdif, pixYdif)
--    title:scale(conXdif, conYdif)
--sceneGroup:insert(title)
--    
--local mist = display.newImage( "mist.png" )
--    mist.x = locationX2
--    mist.y = locationY2
--    --mist:scale(pixXdif, pixYdif)
--    mist:scale(conXdif, conYdif)
--sceneGroup:insert(mist)
--    
--local mistCopy = display.newImage( "mistInverted.png" )
--    mistCopy.x = locationX3
--    mistCopy.y = locationY3
--    --mist:scale(pixXdif, pixYdif)
--    mistCopy:scale(conXdif, conYdif)
--sceneGroup:insert(mistCopy)
--    
----    difTry = conXdif * 1600
----    difTryB = difTry / 2
----    print(difTryB)
--    --print(locationX2)
--    --print(locationX3)
--    --print(conWidth)
--    
--    mistOriglocX = locationX2
----    mistOriglocX2 = locationX3
--    mistOriglocX2 = locX3
--    
--    --mistOriglocY = locationY2
--    --print(locationX2)
--    
--    
----    locBak = display.contentWidth * -2.37
----    locBak2 = display.contentWidth * -2.37
--    locBak = display.contentWidth * -2.37
--    locBak2 = display.contentWidth * -2.37
--    
--    --print(locBak)
--    --print(locBak2)
----    minusNuM = 0
----    minusNuM2 = 0
--    minusNuM = 0
--    minusNuM2 = 0
--    mistCurrentX = mist.x
--    mistCurrentX2 = mistCopy.x
--    checkerX = 0
--    boolZ = false
--    boolX = false
--    firstSlide = true
--    
--    local function resetMist( event )
----        --local t = event.target
----        minusNuM = (minusNuM + 4)
----        minusNuM2 = (minusNuM + 4)
----        mistCurtemp = mist.x
----        mistCurtemp2 = mistCopy.x
----        --if (mistCurrentX > locBak) then mist.x = (locationX2 - minusNuM)  end
----        if (mist.x > locBak) then mist.x = (locationX2 - minusNuM) end
----        --if (mistCurrentX > locBak) and checkerX==1 then mist.x = (locationX3 - minusNuM)  end
----        --if mistCurtemp == math.floor(locBak) then mist.x = mistOriglocX2 minusNuM = 0 end --checkerX=1 end
----        if mist.x < 20 then mist.x = 700 minusNuM=0 end
------        if mistCurtemp == math.floor(locBak) then 
--------            sceneGroup:remove(mist)
--------            mist.x = mistOriglocX2 minusNuM = 0
--------            sceneGroup:insert(mist)
--------            local mist = display.newImage( "mist.png" )
--------    mist.x = locationX2
--------    mist.y = locationY2
--------    --mist:scale(pixXdif, pixYdif)
--------    mist:scale(conXdif, conYdif)
--------sceneGroup:insert(mist)  
------        end
----        if mistCopy.x > 20 then mistCopy.x = (locX3 - minusNuM2) end --mistCurtemp2 = (locX3 - minusNuM2)  end
----        --mistCopy.x = (locX3 - minusNuM2)
----        --if mistCopy.x > locBak2 then mistCopy.x = (locX3 - minusNuM2) end --mistCurtemp2 = (locX3 - minusNuM2)  end
----        --if mistCurtemp2 == math.floor(locBak2) then mistCopy.x = mistOriglocX2 minusNuM2 = 0 end
----        if mistCopy.x < 20 then mistCopy.x = 1000 minusNuM2=0 end --mistOriglocX2 minusNuM2=0 end
----        --if mistCopy.x < 20 then boolX = true end
----        --if boolX == true then mistCopy.x = 1000 minusNuM2=0 boolX=false end
----        
----        
----        --print("alive")
----        
------        if mistCurtemp2 == math.floor(locBak2) then
--------            sceneGroup:remove(mistCopy)
--------            mistCopy.x = mistOriglocX2 minusNuM2 = 0
--------            sceneGroup:insert(mistCopy)
--------            local mistCopy = display.newImage( "mistInverted.png" )
--------    mistCopy.x = locationX3
--------    mistCopy.y = locationY3
--------    --mist:scale(pixXdif, pixYdif)
--------    mistCopy:scale(conXdif, conYdif)
--------sceneGroup:insert(mistCopy)
------        end
--        end
----Runtime:addEventListener("enterFrame", resetMist )
--    
--    
--    
--    
--    
--    
--    
--    
--
--    
--    
--    -- shift the tiles back to starting position when off the screen
--    addVAR = (1) * (conWidth / 375)
----    addVAR_fasterSlide = (1) * (conWidth / 175)
----    addVAR_fasterSlide = (1) * (conWidth / 265)
--local moveBackground = function()
--  
--     
----        minusNuM = (minusNuM + 1)
----        minusNuM2 = (minusNuM2 + 1)
--        
--         minusNuM = (minusNuM + addVAR)
--        minusNuM2 = (minusNuM2 + addVAR)
----        minusNuM = (minusNuM + addVAR_fasterSlide)
----        minusNuM2 = (minusNuM2 + addVAR_fasterSlide)
--        
--        --mistCurtemp = mist.x
--        --mistCurtemp2 = mistCopy.x
--        
--        
--        
--        if firstSlide==true and boolZ==false and (mist.x > locBak) then mist.x = (locationX2 - minusNuM) end
--        if firstSlide==false and boolZ==false and (mist.x > locBak) then mist.x = (locX3 - minusNuM) end
--        if boolZ==true and mist.x > locBak then boolZ=false end
--        --if mist.x < locBak then mist.x = locX3 minusNuM=0 boolZ=true end
--        
--        if boolX==false and mistCopy.x > locBak2 then mistCopy.x = (locX3 - minusNuM2) end --mistCurtemp2 = (locX3 - minusNuM2)  end
--        if boolX==true and mistCopy.x > locBak2 then boolX=false end
--        --if mistCopy.x < 20 then mistCopy.x = 1000 minusNuM2=0 boolX=true end --mistOriglocX2 minusNuM2=0 end
--        
--        
--        if mist.x < locBak then mist.x = locX3 minusNuM=0 boolZ=true firstSlide=false end
--        if mistCopy.x < locBak2 then mistCopy.x = locX3 minusNuM2=0 boolX=true end
--        
--        
--        --print(minusNuM)
--        --print(minusNuM2)
--        --print(locX3 - 0)
--        
--end
-- 
---- gameLoop()
--local gameLoop = function()
--    moveBackground()
--end
-- 
---- gameInit()
---- Initialise the game and run all the creator functions and add listeners
--local gameInit = function()
--    --drawBackground()
--    Runtime:addEventListener( "enterFrame", gameLoop )
--end
-- 
--    
--    
--    gameInit()
--    
--    
--    -- enclosure - END
    
    
--    locationX1 = application.content.width * .5
--    locationY1 = application.content.height * .22
    locationX1 = display.contentWidth * .5
    locationY1 = display.contentHeight * .22
--    locationX2 = application.content.width * 2.192
--    locationY2 = application.content.height * .30
    locationX3 = 60000
    locationY3 = 60000
    
--    locationX2 = application.content.width * .5
--    locationY2 = application.content.height * .5
    locationX2 = display.contentWidth * .5
    locationY2 = display.contentHeight * .5
    
    tempconXdif = (conXdif / 1.5)
    tempconYdif = (conYdif / 1.5)
    testDimenPixX = 799 * tempconXdif -- 750      -- 300
    testDimenPixY = 1421 * tempconYdif -- 1334    -- 533
--    print(conXdif)
--    print(conYdif)
    
--    testDimenX = ((display.pixelWidth+49) / 750)
--    testDimenY = ((display.pixelHeight+87) / 1334)
    
--    testDimenX = ((display.pixelWidth) / 750)
--    testDimenY = ((display.pixelHeight) / 1334)
    
    testDimenX = ((display.contentWidth) / 750)
    testDimenY = ((display.contentHeight) / 1334)
    
    
    --print( display.contentWidth )
    
--    testDimenX = 1
--    testDimenY = 1
    
    
    
--    testDimenX = (display.contentWidth / (display.actualContentWidth))
--    testDimenY = (display.contentHeight / (display.actualContentHeight))
    
--    testDimenX = ((display.actualContentWidth) / display.contentWidth)
--    testDimenY = ((display.actualContentHeight) / display.contentHeight)
--    print(display.contentWidth)
--    print(display.actualContentWidth)
    
    --print(aspectRatioDif)
    
--    local testDimen = display.newImage( "testDimen.png" )
----    testDimen.x = locationX2
----    testDimen.y = locationY2
--    testDimen.x = display.contentCenterX
--    testDimen.y = display.contentCenterY
--    --mist:scale(pixXdif, pixYdif)
----    testDimen:scale(testDimenX, testDimenY)
--    testDimen:scale(testDimenX, testDimenY) -- Note: check the aspectRatios "@2X" etc... iPhone6: 1.7666 iPhone5: 1.775 iPhone4s: 1.5(change occurs here)
--sceneGroup:insert(testDimen)
--    --print( testDimen.x )
    
--    local testDimenB = display.newImageRect("testDimen.png", 799, 1421)  -- X: 799, Y: 1421
--    testDimenB.x, testDimenB.y = locationX2, locationY2

--locationX1 = display.contentWidth * .5
--locationY1 = display.contentHeight * .22
--    print( display.contentWidth ) print( display.contentHeight )
--    print( application.content.width ) print( application.content.height )
--locationX2 = display.contentWidth * 2.192
--locationY2 = display.contentHeight * .30
    
    
    
    local title = display.newImage( "title.png" )
    title.x = locationX1
    title.y = locationY1
    --title:scale(pixXdif, pixYdif)
    title:scale(conXdif, conYdif)
sceneGroup:insert(title)
    title.alpha = 0
    
--local mist = display.newImage( "mist.png" )
local mist = display.newImage( "rock.png" )
--    mist.x = locationX2
--    mist.y = locationY2
    mist.x = display.contentCenterX
    mist.y = display.contentCenterY
    --mist:scale(pixXdif, pixYdif)
--    mist:scale(mistXdif, mistYdif)
--    mist:scale(testDimenX, testDimenY)
    
    --mist:scale(testDimenX, testDimenY)
    mist.width = display.contentWidth * 3
    mist.height = display.contentHeight
    
--    mist:scale(1, 1)
sceneGroup:insert(mist)
    
--local mistCopy = display.newImage( "mistInverted.png" )
local mistCopy = display.newImage( "rockInverted.png" )
--    mistCopy.x = (display.contentWidth * (1.00 + (.5 * 4.4)))
--    mistCopy.y = display.contentCenterY
    mistCopy.x = (display.contentWidth * 3.5) -- - ((display.contentWidth * 3)/2)
    mistCopy.y = display.contentCenterY
    
    --mist:scale(pixXdif, pixYdif)
--    mistCopy:scale(testDimenX, testDimenY)
    
    --mistCopy:scale(testDimenX, testDimenY)
    mistCopy.width = display.contentWidth * 3
    mistCopy.height = display.contentHeight
sceneGroup:insert(mistCopy)
    
--    mist.alpha = 0.00
--    mistCopy.alpha = 0.00

    
    mistXorigplace = mist.x
    mistCopyXorigplace = display.contentWidth * 2.5
    local moveBackground = function()
        
        
        mist.x = mist.x - 1
        mistCopy.x = mistCopy.x - 1
--    print(display.contentWidth)
--    print(display.actualContentWidth)
        
--    if mist.x <= ( math.floor(display.contentWidth * -1.5) ) then mist.x = (display.contentWidth * (1.00 + (.5 * 5.85))) end 
--    if mistCopy.x <= ( math.floor(display.contentWidth * -1.5) ) then mistCopy.x = (display.contentWidth * (1.00 + (.5 * 5.85))) end
        
--    if mist.x <= ( math.floor(display.contentWidth * -1.5) ) then mist.x = (display.contentWidth * 3.5) end 
--    if mistCopy.x <= ( math.floor(display.contentWidth * -1.5) ) then mistCopy.x = (display.contentWidth * 3.5) end
    if mist.x <= ( math.floor(display.contentWidth * -1.5) ) then mist.x = (display.contentWidth * 4.50) end 
    if mistCopy.x <= ( math.floor(display.contentWidth * -1.5) ) then mistCopy.x = (display.contentWidth * 4.50) end
    
    end
    
    
    
    
    
    -- going to have a trailing animated sprite that will follow behind each of the asteroids (same one for all)
    
    
    
    local options =
{
    --required parameters
    width = 500,
    height = 378,
    numFrames = 6,
     
--    --optional parameters; used for scaled content support
    sheetContentWidth = 3204,  -- width of original 1x size of entire sheet
    sheetContentHeight = 380   -- height of original 1x size of entire sheet
}
--        local options =
--{
--    --required parameters
--    width = 334,
--    height = 252,
--    numFrames = 6,
--     
----    --optional parameters; used for scaled content support
--    sheetContentWidth = 2136,  -- width of original 1x size of entire sheet
--    sheetContentHeight = 254   -- height of original 1x size of entire sheet
--}



local imageSheet = graphics.newImageSheet( "asteroidTrail/spritesheet2.png", options )



local sequenceData =
{
    name="asteroidTrail",
    start=1,
    count=6,
    frames= { 1, 2, 3, 4, 5, 6 },
    time=700,
--    time=1000,
    loopCount = 0,
    loopDirection = "bounce" -- or "bounce"
}
 
--local runningMan = display.newSprite( imageSheet, sequenceData )
asteroidTrail = display.newSprite( imageSheet, sequenceData )
asteroidTrail:play()
asteroidTrail.alpha = 0.00
asteroidTrail.x = display.contentCenterX
asteroidTrail.y = display.contentCenterY
--asteroidTrail:scale(conXdifNew,conYdifNew)
    
    
    
    sceneGroup:insert(asteroidGroup)
    asteroidGroup:toBack()
    background:toBack()
    
    local cubeTempName = {}
    cubeTempName[1] = "orangeCube.png"
    cubeTempName[2] = "blueCube.png"
    cubeTempName[3] = "darkerBlueCube.png"
    cubeTempName[4] = "purpleCube.png"
    cubeTempName[5] = "redCube.png"
    cubeTempName[6] = "lightRedCube.png"
    cubeTempName[7] = "pinkCube.png"
    cubeTempName[8] = "greenCube.png"
    cubeTempName[9] = "yellowCube.png"
    
    local cubeTempWidth = {}
    cubeTempWidth[1] = 20
    
    local cubeTempHeight = {}
    cubeTempHeight[1] = 20
    
    local asteroidDead = {}
    asteroidDead[1] = false
    
    asteroidXvarS = {}
    asteroidXvarS[1] = -1.7
    asteroidYvarS = {}
    asteroidYvarS[1] = 1.2
    
    asteroidXYdif = -0.70588
    
    
    
    
--       local function blocksEffectSpawner()
--			local starSpeed = 50
--			local starTime = 12000
--			local powerUpRandom = math.random
--				timer.performWithDelay(500, function()
--                 if composer.getSceneName("current") == "game" then
--				local starDown = display.newRect(0,0,10,10)
--				starDown:setFillColor(0,0,0)
--				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
--                    
--				starDown:applyForce( 7 *(powerUpRandom(starSpeed*.4,starSpeed*.5)),2*(powerUpRandom(starSpeed*-1.1,starSpeed*-1.00)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)) )
--                starDown.alpha = .50
--				starDown:applyTorque(3*powerUpRandom(25,35))
----				starDown.x = display.contentWidth * aVar 
----				starDown.y = display.contentHeight * bVar
--                    starDown.x = display.contentWidth * .5
--				    starDown.y = display.contentHeight * .5
--                    starDown.gravityScale = 0.00
--                    
--                    --print("hey")
--                    
--				sceneGroup:insert(starDown)
--                transition.to(starDown, {time=starTime})
--				return starDown
--                    end
--			end, 0) 
--		end
--    
--    blocksEffectSpawner()
--    
--   
--    
--    
--    
--    local asteroidTrailSpawn = function( object )
--        
--        local randomVarA = math.random()
--        
--        
--        end
    
    
    
    
    
    
    
    asteroidCount = 1
    xRandSpawnVar = 0
    yRandSpawnVar = 0
    LASTxRandSpawnVar = 0
    LASTyRandSpawnVar = 0
    local lastColor = ""
    local newAsteroid = function()
        local tempNum = math.random(1,9)
        asteroidXvarS[asteroidCount] = math.random(-2.40,-2.00)
        asteroidYvarS[asteroidCount] = asteroidXvarS[asteroidCount] * asteroidXYdif
        xRandSpawnVar = math.random(-50,300) 
        yRandSpawnVar = math.random(-50,500)
--        yRandSpawnVar = math.random(-50,1450)
        while true do
        if lastColor == cubeTempName[tempNum] then tempNum = math.random(1,9) else break end
        end
        local boolA = false
        local boolB = false
        while true do
        if (xRandSpawnVar >= LASTxRandSpawnVar - 100) and (xRandSpawnVar <= LASTxRandSpawnVar + 100)
                then xRandSpawnVar = math.random(-50,300) boolA = true else boolA = false end
        if (yRandSpawnVar >= LASTyRandSpawnVar - 0) and (yRandSpawnVar <= LASTyRandSpawnVar + 0)
--                then yRandSpawnVar = math.random(-50,1450) boolB = true else boolB = false end
                then yRandSpawnVar = math.random(-50,500) boolB = true else boolB = false end
            if (boolA == false) and (boolB == false) then break end
        end
        asteroidDead[asteroidCount] = false
        lastColor = cubeTempName[tempNum]
        LASTxRandSpawnVar = xRandSpawnVar
        LASTyRandSpawnVar = yRandSpawnVar
        asteroidImage[asteroidCount] = display.newImageRect(asteroidGroup,cubeTempName[tempNum],cubeTempWidth[1],cubeTempHeight[1])
        asteroidTrails[asteroidCount] = display.newSprite( imageSheet, sequenceData )
        asteroidTrails[asteroidCount]:play()
--        asteroidTrailSpawn( asteroidImage[asteroidCount] )
        sceneGroup:insert( asteroidTrails[asteroidCount] )
        sceneGroup:insert( asteroidImage[asteroidCount] )
        asteroidImage[asteroidCount]:toBack()
        asteroidTrails[asteroidCount]:toBack()
        mist:toBack()
        mistCopy:toBack()
        background:toBack()
        --asteroidImage[asteroidCount].alpha = 1.00
        asteroidImage[asteroidCount].x = (display.contentWidth + 60) + (xRandSpawnVar)
        asteroidImage[asteroidCount].y = ((0) - 200) + (yRandSpawnVar)
        asteroidImage[asteroidCount]:scale(conXdifNew,conYdifNew)
        asteroidTrails[asteroidCount].x = (display.contentWidth + 60) + (xRandSpawnVar) - 55
        asteroidTrails[asteroidCount].y = ((0) - 200) + (yRandSpawnVar) - 20
        asteroidTrails[asteroidCount]:scale(conXdifNew,conYdifNew)
        --print(asteroidImage[asteroidCount].width)
--        asteroidImage[asteroidCount].x = 500
--        asteroidImage[asteroidCount].y = 700
--        asteroidTrails[asteroidCount].x = 500 - 55
--        asteroidTrails[asteroidCount].y = 700 - 20
        end
    
    
    
    
    --counterVar = 0
    -- gameLoop()
rotateVar = -1.1
asteroidXvar = -1.7
asteroidYvar = 1.2
matchRandVar = 83
AllBeforeCurrent = 1
    firstTwo = 3
    CurrentCubeAlive = 1 -- add 1 everytime the "oldest" cube "dies"
    AlphaCounter = 0
local gameLoop = function()
        if composer.getSceneName("current") == "game" then
    --rotateVar = rotateVar + .1
    if firstTwo > 0 then firstTwo = firstTwo - 1 asteroidCount = asteroidCount + 1 newAsteroid() end
    if math.random(1,150) == matchRandVar then asteroidCount = asteroidCount + 1 newAsteroid() end
            --if asteroidCount > 10 then for i = 1, 10, 1 do print( asteroidImage[i].x ) end end
    for i = CurrentCubeAlive , asteroidCount, 1 do
    asteroidImage[i].rotation = asteroidImage[i].rotation + rotateVar
        --tempVarB = (display.contentWidth / asteroidImage[i].x)
                --print(tempVarB)
            AlphaCounter = AlphaCounter + 1
        if AlphaCounter == 3 then        
        asteroidImage[i].alpha = asteroidImage[i].alpha - .0001
        asteroidTrails[i].alpha = asteroidTrails[i].alpha - .0001
                    AlphaCounter = 0
                    end
--    asteroidImage[i].x = asteroidImage[i].x + asteroidXvar
--    asteroidImage[i].y = asteroidImage[i].y + asteroidYvar
    asteroidImage[i].x = asteroidImage[i].x + asteroidXvarS[i]
    asteroidImage[i].y = asteroidImage[i].y + asteroidYvarS[i]
                
        asteroidTrails[i].x = asteroidImage[i].x - 55
        asteroidTrails[i].y = asteroidImage[i].y - 20
    --print(asteroidImage[1].x)
    --print(i)
    --print(-(display.contentWidth))
    --print(asteroidImage[i].x)
                

        if asteroidImage[i].x <= -(display.contentWidth) then
                    asteroidDead[i] = true 
                    asteroidImage[i]:removeSelf()
                    asteroidImage[i] = nil
                    asteroidTrails[i]:removeSelf()
                    asteroidTrails[i] = nil
                    CurrentCubeAlive = i + 1
                    for z = 1, i, 1 do if asteroidDead[z] == false then
                            asteroidDead[z] = true
                            asteroidImage[z]:removeSelf()
                            asteroidImage[z] = nil
                            asteroidTrails[z]:removeSelf()
                            asteroidTrails[z] = nil
                            end
                        end
                end
                
    --for x = 1 , asteroidCount, 1 do
--    for x = CurrentCubeAlive , asteroidCount, 1 do
--    if asteroidDead[x] == false then CurrentCubeAlive = x break end
--                    end
                --print(asteroidDead[i])
--    if (CurrentCubeAlive >= 2) and (AllBeforeCurrent ~= CurrentCubeAlive) then
--    for y = AllBeforeCurrent , CurrentCubeAlive - 1, 1 do
--    if asteroidDead[y] == true then 
--                        --asteroidImage[y]:removeSelf()
--                        --asteroidImage[y] = nil
--                        --asteroidTrail[y]:removeSelf()
--                        --asteroidTrail[y] = nil
--                            --print(y)print("is dead")
--                    end
--                        AllBeforeCurrent = CurrentCubeAlive
--                 end
                end
--        if (asteroidDead[i] == true) and ((i-1) >= 1) and (asteroidDead[i-1] ~= false) and ( i == CurrentCubeAlive - 1 ) then
--                    print(i)print("is dead")
--                    end
                --end
            
            
            
            
    moveBackground()
            --counterVar = counterVar + 1
            --print(counterVar)
            end
        
end
 
-- gameInit()
-- Initialise the game and run all the creator functions and add listeners
local gameInit = function()
    --drawBackground()
    Runtime:addEventListener( "enterFrame", gameLoop )
end
 
    
    
    gameInit()
    
    
    --print( composer.getSceneName("current") )
    
    
    --print(testIfFunctionStarted)
    
    
    
    
    
-- i have 2 mists to make it more defined and appear darker on the screen
--local mist2 = display.newImage( "mist.png" )
--    mist2.x = locationX2
--    mist2.y = locationY2
--    --mist2:scale(pixXdif, pixYdif)
--    mist2:scale(conXdif, conYdif)
--sceneGroup:insert(mist2)




 local doneButton = widget.newButton({
        id = "button1",
        label = "Settings",
        --onEvent = --loadlevel1
        --onEvent = blank
    })
    doneButton.x = display.contentCenterX
    --doneButton:scale(pixXdif,pixYdif)
    doneButton:scale(conXdif, conYdif)
    doneButton.alpha = 1.00
    --btnDoneButtonYminus = (50 / 1136) * pixHeight
    btnDoneButtonYminus = (80 / origYhei) * conHeight
    doneButton.y = display.contentHeight - btnDoneButtonYminus
    sceneGroup:insert( doneButton )


     local doneButton2 = widget.newButton({
        id = "button2",
        label = "Go to Level Select",
        onEvent = handleCancelButtonEvent
    })
    doneButton2.x = display.contentCenterX
    --doneButton2:scale(pixXdif,pixYdif)
    doneButton2:scale(conXdif, conYdif)
    --print(conXdif)
    doneButton2.alpha = 1.00
    --btnDoneButton2Yminus = (20 / 1136) * pixHeight
    btnDoneButton2Yminus = (20 / origYhei) * conHeight
    doneButton2.y = display.contentHeight - btnDoneButton2Yminus
    sceneGroup:insert( doneButton2 )
    
    
     local doneButton3 = widget.newButton({
        id = "button3",
        label = "How-To-Play",
        --onEvent = --loadlevel1
        --onEvent = blank
    })
    doneButton3.x = display.contentCenterX
    --doneButton:scale(pixXdif,pixYdif)
    doneButton3:scale(conXdif, conYdif)
    doneButton3.alpha = 1.00
    --btnDoneButtonYminus = (50 / 1136) * pixHeight
    btnDoneButton3Yminus = (50 / origYhei) * conHeight
    doneButton3.y = display.contentHeight - btnDoneButton3Yminus
    sceneGroup:insert( doneButton3 )













end













--buttonsend

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

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

display.setStatusBar(display.HiddenStatusBar)



local composer = require( "composer" )
local scene = composer.newScene()
local conf = require("config")

local widget = require( "widget" )
local utility = require( "utility" )
local myData = require( "mydata" )

local json = require("json")
local loadsave = require( "loadsave" )  -- Require the 'loadsave' module


local starVertices = { 0,-11, 2.7,-3.5, 10.5,-3.5, 4.3,1.6, 6.5,9.0, 0,4.5, -6.5,9.0, -4.3,1.5, -10.5,-3.5, -2.7,-3.5, }

local params

pixHeight = display.pixelHeight
pixWidth = display.pixelWidth

conWidth = display.contentWidth
conHeight = display.contentHeight
origXwid = 320
origYhei = 568


origXwidIphoneSixPlus = 1080 
origYheiIphoneSixPlus = 1920

--print(display.contentWidth)

    pixXdif = pixWidth / 640
    pixYdif = pixHeight / 1136

conXdif = conWidth / origXwid
conYdif = conHeight / origYhei

conXdifNew = conWidth / origXwidIphoneSixPlus
conYdifNew = conHeight / origYheiIphoneSixPlus

--print(conXdif)

--runManScaleX = conXdifNew + (.0923)
--runManScaleY = conYdifNew + (-.04)
runManScaleX = (conXdifNew + (.0923)) + .5
runManScaleY = (conYdifNew + (-.04)) + .5


local isPaused = false
local gravUp = false
local isInverted = false



--display.height = 20
--print(display.height)
--display.catZ = 400
--print(display.catZ)

--print("here: " .. "okay")print(display.pixelHeight)--print(conf.width)
--print(application.content.height)
--print(application.content.width)




local actualMoveUp = false
local actualMoveDown = false


--local function onSceneTouch( self, event )
--if event.phase == "ended" then
--if event.xStart < event.x and (event.x - event.xStart) >= 100 then
--            print("swiped right")
----audio.play( pageturnSound )
----storyboard.gotoScene( "page06", "slideRight", 1000 )
--return true
--end
--elseif event.xStart > event.x and (event.xStart - event.x) >= 100 then
--        print("swiped left")
----audio.play( pageturnSound )
----storyboard.gotoScene( "page08", "slideLeft", 1000 )
--return true
--end
--end


local hasLanded = false

local transSwipeDetect = display.newImageRect ("bgpink.png", display.contentWidth, display.contentHeight)
--sceneGroup:insert(transSwipeDetect)
transSwipeDetect.alpha = 0.00
transSwipeDetect.isHitTestable = true
transSwipeDetect.x = display.contentCenterX
transSwipeDetect.y = display.contentCenterY


local doubleSwipeUp = 0
local doubleSwipeDown = 0

local canGoUp = true
local canGoDown = false

local function onSceneTouch( event )
if event.phase == "ended" then
        
if event.xStart < event.x and (event.x - event.xStart) >= 100 and isPaused == false then
            --print("swiped right")
            runningMan.xScale = runManScaleX
            manMoveAmt = math.abs(manMoveAmtB)
            runningMan:play()
end
if event.xStart > event.x and (event.xStart - event.x) >= 100 and isPaused == false then
        --print("swiped left")
        runningMan.xScale = -(runManScaleX)
            manMoveAmt = -(math.abs(manMoveAmtB))
            runningMan:play()
end
-- split the X and Y's
if event.yStart < event.y and (event.y - event.yStart) >= 100 and isPaused == false then
            --print("swiped down")
            
            
            
            
            
--              if hasLanded == true and isPaused == false then
--                if doubleSwipeDown < 2 and canGoDown == true then
--                    doubleSwipeDown = doubleSwipeDown + 1
--        local runningManOrigY = runningMan.y
----        for i = 0 , 60, 1 do
--                    actualMoveDown = true
--        for i = 0 , 160, 1 do
--                --print(runningMan.rotation)
--                runningMan.y = runningManOrigY + i
--        end  
--                    doubleSwipeDown = doubleSwipeDown + 1
--                    doubleSwipeUp = 0
--                    --else
--                    end end
--                if hasLanded == false and isPaused == false then
--                doubleSwipeDown = doubleSwipeDown + 1
--                doubleSwipeUp = 0
--                canGoDown = false
--                canGoUp = true
--                runningMan.yScale = (runManScaleY)
--                if doubleSwipeDown >= 2 then physics.setGravity(0,29.8) else physics.setGravity(0,8.8) end
--                    --end
--                
--                end
--            hasLanded = false
--            groundTriggered = false
            
            
        --end
            --runningMan:play()

            
            if hasLanded == false and isPaused == false and isInverted == false then
                local runningManOrigY = runningMan.y
                physics.setGravity(0,88.0) -- 10 times the "normal" gravity
            end
            
            if hasLanded == true and isPaused == false and isInverted == true then
                local runningManOrigY = runningMan.y
                for i = 0 , 160, 1 do
                runningMan.y = runningManOrigY + i
                end 
            end
            
            
--            doubleSwipeDown = doubleSwipeDown + 1
--            doubleSwipeUp = 0
--            runningMan.yScale = (runManScaleY)
--            if doubleSwipeDown >= 2 then physics.setGravity(0,29.8) else physics.setGravity(0,11.8) end
            
--            manMoveAmt = 0
--            runningMan:pause()
end
if event.yStart > event.y and (event.yStart - event.y) >= 100 then
        --print("swiped up")
            --print(doubleSwipeUp)
--            doubleSwipeUp = doubleSwipeUp + 1
--        if hasLanded == true and isPaused == false then
--                if doubleSwipeUp < 2  and canGoUp == true then
--                    doubleSwipeUp = doubleSwipeUp + 1
--        local runningManOrigY = runningMan.y
----        for i = 0 , 60, 1 do
--                    actualMoveUp = true
--        for i = 0 , 160, 1 do
--                --print(runningMan.rotation)
--                runningMan.y = runningManOrigY - i
--        end  
--                    doubleSwipeUp = doubleSwipeUp + 1
--                    doubleSwipeDown = 0
--                    --else
--                    end end
--                if hasLanded == false and isPaused == false then
--                doubleSwipeUp = doubleSwipeUp + 1
--                doubleSwipeDown = 0
--                canGoDown = true
--                canGoUp = false
--                runningMan.yScale = -(runManScaleY)
--                if doubleSwipeUp >= 2 then physics.setGravity(0,-29.8) else physics.setGravity(0,-8.8) end
--                    --end
--                
--                end
            
            if hasLanded == true and isPaused == false and isInverted == false then
                local runningManOrigY = runningMan.y
                for i = 0 , 160, 1 do
                runningMan.y = runningManOrigY - i
                end 
            end
            
            hasLanded = false
            groundTriggered = false
            --runningMan:play()
end
        
end
end






--local invertGravBlock = display.newImageRect("redCube.png", 70, 70)
local invertGravBlock = display.newImage("redCube.png", display.contentWidth * .50, display.contentHeight * .92)
invertGravBlock:scale(.07, .07)
--invertGravBlock.x = display.contentWidth * .6
--invertGravBlock.y = display.contentHeight * .32
invertGravBlock.id = "invertGravBlock"


--local normalGravBlock = display.newImageRect("blueCube.png", 70, 70)
local normalGravBlock = display.newImage("blueCube.png", display.contentWidth * .15, display.contentHeight * .88)
normalGravBlock:scale(.07, .07)
--normalGravBlock.x = display.contentWidth * .52
--normalGravBlock.y = display.contentHeight * .22
normalGravBlock.id = "normalGravBlock"



local transXBool = true
local transXBoolOP = false
local allTrue = {}
local transitionSizeX = function(i) -- to give the effect that the "coin" is spinning
               
        --print(i)
        --print( blankCube[i].width )
--            if blankCube[i].width > -200.00 and transXBool == true then blankCube[i].width = blankCube[i].width - 10.00 end
--            if blankCube[i].width <= -200.00 and transXBool == false then blankCube[i].width = blankCube[i].width + 10.00 end
            if transXBool == true then blankCube[i].width = blankCube[i].width - 20.00 end
            if transXBool == false then blankCube[i].width = blankCube[i].width + 20.00 end
    if blankCube[i].width >= 200.00 then allTrue[i] = true end
    if blankCube[i].width <= 0.00 then allTrue[i] = false end
    
    local holdBool = true
    for x = 1, 10, 1 do 
        if (allTrue[x] == transXBoolOP) and (holdBool == true) then holdBool = true else holdBool = false end
        end
    local holdBoolB = transXBool
        if holdBool == true then transXBool = transXBoolOP transXBoolOP = holdBoolB end
    
    end






--local door = display.newImage( "opendoor.png", (display.contentWidth*.555), (display.contentHeight*.12) )
--    door:scale(conXdif, conYdif)
----sceneGroup:insert(door)
----physics module has been removed
--door.isPlatform = true -- custom flag, used in drag function above

    --ratioBigMistX = (1279 / imageResizeRatioX)
    --ratioBigMistY = (800 / imageResizeRatioY)
--local bigmist = display.newImage( "big mist.png", ((90/640)*pixWidth), ((194/1136)*pixHeight) )




--local bigmist = display.newImage( "big mist.png", (display.contentWidth*.5), (display.contentHeight*.5) )
--    bigmist:scale(conXdif, conYdif)





--sceneGroup:insert(bigmist)



--local crate = display.newImage( "crate.png", (display.contentWidth*.25), (display.contentHeight*.8) )
----physics.addBody( crate, "dynamic",{ density=3.0, friction=700, bounce=0.4 } )
--    crate:scale(conXdif, conYdif)

--sceneGroup:insert(crate)
    --local function checkCrate() if crate.x==display.contentWidth*.18 then print("6") end end

--local ghost = display.newImage( "ghost-512.png", (display.contentWidth*.7), (display.contentHeight*.6) )
----physics.addBody( ghost, "kinematic", { friction=700 } )
--ghost.isPlatform = true -- custom flag again
--    ghost:scale(conXdif, conYdif)
----sceneGroup:insert(ghost)









--local background2 = display.newImage( "background2.jpg", display.contentWidth*.5, display.contentHeight*.5, true )
local background2 = display.newImage( "backgroundSky.png", display.contentWidth*.5, display.contentHeight*.5, true )
--local background2 = display.newImage( "backgroundSky.jpg", display.contentWidth*.5, display.contentHeight*.5, true )
--background2:scale(conXdif, conYdif)
background2.height = display.contentHeight
background2.width = display.contentWidth * 3

--local ground = display.newImage( "floor.png", 160, 440 )
--physics.addBody( ground, "static", { friction=0.6 } )
    
local cloudArrangementB = display.newImage( "cloudArrangementB.png", display.contentWidth*.5, display.contentHeight*.5, true)
cloudArrangementB.height = display.contentHeight
cloudArrangementB.width = display.contentWidth * 3
cloudArrangementB.alpha = .65
local cloudArrangementBcopy = display.newImage( "cloudArrangementBinverted.png", display.contentWidth*3.5, display.contentHeight*.5, true)
cloudArrangementBcopy.height = display.contentHeight
cloudArrangementBcopy.width = display.contentWidth * 3
cloudArrangementBcopy.alpha = .65

    
local cloudArrangementA = display.newImage( "cloudArrangementA.png", display.contentWidth*.5, display.contentHeight*.5, true)
cloudArrangementA.height = display.contentHeight
cloudArrangementA.width = display.contentWidth * 3
cloudArrangementA.alpha = .9
local cloudArrangementAcopy = display.newImage( "cloudArrangementAinverted.png", display.contentWidth*3.5, display.contentHeight*.5, true)
cloudArrangementAcopy.height = display.contentHeight
cloudArrangementAcopy.width = display.contentWidth * 3
cloudArrangementAcopy.alpha = .9


--local sawBlade = display.newGroup()
--local goRight = true 
--local goFartherRight = false
--local goFartherLeft = false
--local RightCheck = false
local sawBlade = {}
local goRight = {}
local goFartherRight = {}
local goFartherLeft = {}
local RightCheck = {}

--local sawBladeOn = display.newImage( sawBlade,"sawBladeOn.png", display.contentWidth*.55, display.contentHeight*.35)
--sawBladeOn:scale(.35,.35)
--sawBladeOn.alpha = 1.00
--local sawBladeOnCopy = display.newImage( sawBlade,"sawBladeOninverted.png", display.contentWidth*.55, display.contentHeight*.35)
--sawBladeOnCopy:scale(.35,.35)
--sawBladeOnCopy.alpha = 0.00
--local sawBladeOff = display.newImage( sawBlade,"sawBladeOff.png", display.contentWidth*.55, display.contentHeight*.35)
--sawBladeOff:scale(.35,.35)
--sawBladeOff.alpha = 0.00
--local sawBladeOffCopy = display.newImage( sawBlade,"sawBladeOffinverted.png", display.contentWidth*.55, display.contentHeight*.35)
--sawBladeOffCopy:scale(.35,.35)
--sawBladeOffCopy.alpha = 0.00

local sawBladeOn = {}
local sawBladeOnCopy = {}
local sawBladeOff = {}
local sawBladeOffCopy = {}
 
--sawBlade.x = display.contentWidth*.55
--sawBlade.y = display.contentHeight*.40

    

local moveBackground = function()
    
--        if sawBlade.x >= display.contentWidth * .75 then goRight = false end
--        if sawBlade.x <= display.contentWidth * .55 then goRight = true end
--        if goRight == true then sawBlade.x = sawBlade.x + 10 end
--        if goRight == false then sawBlade.x = sawBlade.x - 10 end
    
        cloudArrangementB.x = cloudArrangementB.x - 3
        cloudArrangementBcopy.x = cloudArrangementBcopy.x - 3
        cloudArrangementA.x = cloudArrangementA.x - 5
        cloudArrangementAcopy.x = cloudArrangementAcopy.x - 5
        

    if cloudArrangementA.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementA.x = (display.contentWidth * 4.50) end 
    if cloudArrangementAcopy.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementAcopy.x = (display.contentWidth * 4.50) end
    if cloudArrangementB.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementB.x = (display.contentWidth * 4.50) end 
    if cloudArrangementBcopy.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementBcopy.x = (display.contentWidth * 4.50) end
    
    
    cloudArrangementA:toBack()
    cloudArrangementB:toBack()
    background2:toBack()
    
    end  

--local test = .40

local bladeCount = 0
local moveBlade = {}
local generateBlade = function(xLoc, yLoc, xChangeA, xChangeB, moveLength, reverseAll)
    bladeCount = bladeCount + 1
    
--        local xChangeAA = (xChangeA)
--        local xChangeAB = -(xChangeA)
--        local xChangeBA = (xChangeB)
--        local xChangeBB = -(xChangeB)
--    
--    local reverseVar = 1
--    if reverseAll == true then
--        reverseVar = -1
--        xChangeAA = -(xChangeA)
--        xChangeAB = (xChangeA)
--        xChangeBA = -(xChangeB)
--        xChangeBB = (xChangeB)
--        end
    
    
    sawBlade[bladeCount] = display.newGroup()
    goRight[bladeCount] = true
    goFartherRight[bladeCount] = false
    goFartherLeft[bladeCount] = false
    RightCheck[bladeCount] = false
    
--    sawBladeOffCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOffinverted.png", xLoc, yLoc)
    sawBladeOffCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOffinverted.png", 0, 0)
    sawBladeOffCopy[bladeCount]:scale(.35,.35)
    sawBladeOffCopy[bladeCount].alpha = 0.00
    
    
--    sawBladeOff[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOff.png", xLoc, yLoc)
    sawBladeOff[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOff.png", 0, 0)
    sawBladeOff[bladeCount]:scale(.35,.35)
    sawBladeOff[bladeCount].alpha = 0.00
    
    
--    sawBladeOn[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOn.png", xLoc, yLoc)
    sawBladeOn[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOn.png", 0, 0)
    sawBladeOn[bladeCount]:scale(.35,.35)
    sawBladeOn[bladeCount].alpha = 1.00
    
    
--    sawBladeOnCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOninverted.png", xLoc, yLoc)
    sawBladeOnCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOninverted.png", 0, 0)
    sawBladeOnCopy[bladeCount]:scale(.35,.35)
    sawBladeOnCopy[bladeCount].alpha = 0.00
    
--    if reverseAll == false then
--    sawBlade[bladeCount].x = xLoc + 1 else sawBlade[bladeCount].x = xLoc - 1 end
    --print(xLoc)
    sawBlade[bladeCount].x = xLoc
    sawBlade[bladeCount].y = yLoc
    
--local moveBlade = {}    
moveBlade[bladeCount] = function(bladeCountB)
    if isPaused == false and composer.getSceneName("current") == "1" then
        
--            physics.addBody(sawBlade[bladeCountB],"static")
--            physics.addBody(sawBladeOffCopy[bladeCountB],"static")
            
--            sawBlade[bladeCountB].x = xLoc
--            sawBlade[bladeCountB].y = yLoc
            
        local xChangeAA = (xChangeA)
        local xChangeAB = -(xChangeA)
        local xChangeBA = (xChangeB)
        local xChangeBB = -(xChangeB)
    
    local reverseVar = 1
    if reverseAll == true then
        reverseVar = -1
        xChangeAA = -(xChangeA)
        xChangeAB = (xChangeA)
        xChangeBA = -(xChangeB)
        xChangeBB = (xChangeB)
        end
            
            --bladeCountB = bladeCount
            
--        if sawBlade.x >= display.contentWidth * .75 
            --print(sawBlade[bladeCount].x)
            
--        local holdVar = (((moveLength*1000) - (.05 * 1000)) * reverseVar) / 1000
        
--        local holdVar = (((((xLoc / display.contentWidth)+moveLength)*1000) - (.05 * 1000)) * reverseVar) / 1000
            
            --print(holdVar)
            --print(xLoc)
            --print(xLoc+20)
        --local holdVar = (((moveLength*1000) - (.05 * 1000)) * reverseVar) / 1000
        --local holdVar = (xLoc)
            --print( xLoc )
            --print( sawBlade[bladeCountB].x )
            
        --local holdVar = (((display.contentWidth * .75) * 1000) * (reverseVar*1000)) / (1000*1000)
        local holdVar = (xLoc + (200 * reverseVar))
            --holdVar = (display.contentWidth * .75) * reverseVar
            --print(holdVar)
        if sawBlade[bladeCountB].x == holdVar and goRight[bladeCountB] == true
            then 
--            if RightCheck == true then goRight = false RightCheck = false end
            goRight[bladeCountB] = false
            goFartherRight[bladeCountB] = true
            goFartherLeft[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 1.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
--        if sawBlade.x <= display.contentWidth * .55 
--        if sawBlade[bladeCountB].x == display.contentWidth * .0 and goRight[bladeCountB] == false
--        if sawBlade[bladeCountB].x == (xLoc + 0) and goRight[bladeCountB] == false
            
        --holdVar = (((display.contentWidth * .5) * 1000) * (reverseVar * 1000)) / (1000*1000)
        holdVar = xLoc - 0
         if sawBlade[bladeCountB].x == holdVar and goRight[bladeCountB] == false
            then
--            if RightCheck == true then goRight = true RightCheck = false end
            goRight[bladeCountB] = true
            goFartherRight[bladeCountB] = false
            goFartherLeft[bladeCountB] = true
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 1.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
--        holdVar = ((((xLoc/display.contentWidth)+moveLength) * 1000) * (reverseVar)) / 1000
        --holdVar = (((display.contentWidth * .85) * 1000) * (reverseVar * 1000)) / (1000 * 1000)
        holdVar = (xLoc + (240 * reverseVar))
            --print(holdVar)
        if sawBlade[bladeCountB].x >= holdVar --(xLoc + 25) --moveLength
        then --display.contentWidth * .40
--                ((yLoc/display.contentWidth)+.05) * display.contentWidth
--            goRight = false
            RightCheck[bladeCountB] = true
            goFartherRight[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 1.00
        end
--            holdVar = ((-.05 * 1000) * (reverseVar)) / 1000
--            holdVar = (((xLoc/display.contentWidth)*1000) + (-.05 * 1000) * (reverseVar)) / 1000
            --holdVar = (((display.contentWidth * .40) * 1000) * (reverseVar * 1000)) / (1000 * 1000)
            holdVar = (xLoc - (40 * reverseVar))
            if sawBlade[bladeCountB].x <= holdVar --(xLoc - 5) -- -.05 * reverseVar
        then
--            goRight = true
            RightCheck[bladeCountB] = true
            goFartherLeft[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 1.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
            
        --print(sawBlade[1].x)
        --print(sawBlade[1].width)
        --print(sawBlade[2].x)
            
        if goFartherRight[bladeCountB] == true 
        then
            sawBlade[bladeCountB].x = sawBlade[bladeCountB].x + xChangeAA
        end
        if goFartherLeft[bladeCountB] == true 
        then
            sawBlade[bladeCountB].x = sawBlade[bladeCountB].x + xChangeAB
        end
        
        if goRight[bladeCountB] == true and goFartherRight[bladeCountB] == false and goFartherLeft[bladeCountB] == false 
        then 
            sawBlade[bladeCountB].x = sawBlade[bladeCountB].x + xChangeBA
        end
        if goRight[bladeCountB] == false and goFartherLeft[bladeCountB] == false and goFartherRight[bladeCountB] == false 
        then 
            sawBlade[bladeCountB].x = sawBlade[bladeCountB].x + xChangeBB
        end
    
        
        end
        
    end
    
--Runtime:addEventListener("enterFrame", moveBlade[bladeCount])
    
--    runningMan.fill.effect = "filter.brightness"
--    runningMan.fill.effect.intensity = -0.3
--    background2.fill.effect = "filter.brightness"
--    background2.fill.effect.intensity = -0.3
--    cloudArrangementA.fill.effect = "filter.brightness"
--    cloudArrangementA.fill.effect.intensity = -0.3
--    cloudArrangementAcopy.fill.effect = "filter.brightness"
--    cloudArrangementAcopy.fill.effect.intensity = -0.3
--    cloudArrangementB.fill.effect = "filter.brightness"
--    cloudArrangementB.fill.effect.intensity = -0.3
--    cloudArrangementBcopy.fill.effect = "filter.brightness"
--    cloudArrangementBcopy.fill.effect.intensity = -0.3
    
end -- end function generateBlade


local moveBlades = function()
    for i,x in pairs(moveBlade) do moveBlade[i](i) end
    end
Runtime:addEventListener("enterFrame", moveBlades)


-- the Last value is the length, in total it will go contentWidth * -.05 to contentWidth * .40 -->
generateBlade( display.contentWidth*.55, display.contentHeight*.35, 1, 2, .40, false)
generateBlade( display.contentWidth*.75, display.contentHeight*.55, 1, 2, .40, true)
generateBlade( display.contentWidth*.25, display.contentHeight*.77, 1, 2, .40, false)





--local runmanGroup = display.newGroup()
--local run1 = display.newImage( runmanGroup, "run1.png", (display.contentWidth*.35), (display.contentWidth*.55))
--run1.x = display.contentCenterX
--run1.y = display.contentCenterY
--run1.isVisible = true
----split
--local run2 = display.newImage( runmanGroup, "run2.png", (display.contentWidth*.35), (display.contentWidth*.55))
--run2.x = display.contentCenterX
--run2.y = display.contentCenterY
--run2.isVisible = false
----split
--local run3 = display.newImage( runmanGroup, "run3.png", (display.contentWidth*.35), (display.contentWidth*.55))
--run3.x = display.contentCenterX
--run3.y = display.contentCenterY
--run3.isVisible = false
----split
--local run4 = display.newImage( runmanGroup, "run4.png", (display.contentWidth*.35), (display.contentWidth*.55))
--run4.x = display.contentCenterX
--run4.y = display.contentCenterY
--run4.isVisible = false
----split
--local run5 = display.newImage( runmanGroup, "run5.png", (display.contentWidth*.35), (display.contentWidth*.55))
--run5.x = display.contentCenterX
--run5.y = display.contentCenterY
--run5.isVisible = false
----split
----local run6 = display.newImage( runmanGroup, "run6.png", (display.contentWidth*.35), (display.contentWidth*.55))
----run6.x = display.contentCenterX
----run6.y = display.contentCenterY
----run6.isVisible = false
------split
----local run7 = display.newImage( runmanGroup, "run7.png", (display.contentWidth*.35), (display.contentWidth*.55))
----run7.x = display.contentCenterX
----run7.y = display.contentCenterY
----run7.isVisible = false
------split
--
--runmanGroup.whichMan = "run1"
--runmanGroup.whichImage = 1
--
--runManlocationX = (display.contentCenterX)
--runManlocationY = (display.contentCenterY)
--local updateManMovement = function()
--    runmanGroup.x = runmanGroup.x + 1.00
--    --runmanGroup.y = runmanGroup.y + .001
--    end
--
--local nextManImage = function()
--    
--    if runmanGroup.whichImage < 5 then
--    runmanGroup.whichImage = runmanGroup.whichImage + 1
--        else runmanGroup.whichImage = 1
--    end
--    
--    local holdVar = runmanGroup.whichImage
--    
--    if holdVar == 1 then run1.isVisible = true else run1.isVisible = false end
--    if holdVar == 2 then run2.isVisible = true else run2.isVisible = false end
--    if holdVar == 3 then run3.isVisible = true else run3.isVisible = false end
--    if holdVar == 4 then run4.isVisible = true else run4.isVisible = false end
--    if holdVar == 5 then run5.isVisible = true else run5.isVisible = false end
----    if holdVar == 6 then run6.isVisible = true else run6.isVisible = false end
----    if holdVar == 7 then run7.isVisible = true else run7.isVisible = false end
--    
--    end
--
--
--
--
--local gameLoopA = function()
--        if composer.getSceneName("current") == "1" then
--        --timer.performWithDelay( 1000, nextManImage, 1 )
--    nextManImage()
--    updateManMovement()
--        gameInitA()
--            end
--        
--end
-- 
--gameInitA = function()
--    --Runtime:addEventListener( "enterFrame", gameLoopA )
--    timer.performWithDelay( 125, gameLoopA)
--end
-- 
--    
--    
--    gameInitA()
















--
--local options =
--{
--    --required parameters
--    width = 71,
--    height = 72,
--    numFrames = 5,
--     
----    --optional parameters; used for scaled content support
--    sheetContentWidth = 360,  -- width of original 1x size of entire sheet
--    sheetContentHeight = 83   -- height of original 1x size of entire sheet
--}
--
--
--
--local imageSheet = graphics.newImageSheet( "spritesheet.png", options )
--
--
--
--local sequenceData =
--{
--    name="runningMan",
--    start=1,
--    count=5,
--    --frames= { 3, 4, 5, 6, 7, 8 }, -- frame indexes of animation, in image sheet
--    frames= { 1, 2, 3, 4, 5 }, -- frame indexes of animation, in image sheet
--    time=700,
--    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
--    loopDirection = "forward"    -- Optional ; values include "forward" or "bounce"
--}
-- 
----local runningMan = display.newSprite( imageSheet, sequenceData )
--runningMan = display.newSprite( imageSheet, sequenceData )
--
--local canRunBool = true
--
--runningMan.x = display.contentWidth * .15
--runningMan.y = display.contentHeight * .1
--runningMan:scale(conXdifNew,conYdifNew)
--runningMan:play()






local options =
{
    --required parameters
    width = 65,
    height = 75,
    numFrames = 10,
     
--    --optional parameters; used for scaled content support
    sheetContentWidth = 650,  -- width of original 1x size of entire sheet
    sheetContentHeight = 77   -- height of original 1x size of entire sheet
}



local imageSheet = graphics.newImageSheet( "spritesheetC.png", options )



local sequenceData =
{
    name="runningMan",
    start=1,
    count=10,
    --frames= { 3, 4, 5, 6, 7, 8 }, -- frame indexes of animation, in image sheet
    --frames= { 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 }, -- frame indexes of animation, in image sheet
    time=1700,
    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
    loopDirection = "forward"    -- Optional ; values include "forward" or "bounce"
}
 
--local runningMan = display.newSprite( imageSheet, sequenceData )
runningMan = display.newSprite( imageSheet, sequenceData )

local canRunBool = true

runningMan.x = display.contentWidth * .15
runningMan.y = display.contentHeight * .1
--runningMan:scale(conXdifNew,conYdifNew)
--runningMan:scale(runManScaleX,runManScaleY)
runningMan:scale(runManScaleX,runManScaleY)
--runningMan.id = "runningMan"
runningMan:play()




runningManlocationX = (display.contentCenterX)
runningManlocationY = (display.contentCenterY)
--manMoveAmt = 5.00

--manMoveAmt = 15.00
--manMoveAmtB = 15.00
manMoveAmt = 25.00
manMoveAmtB = 25.00
local updateManMovement = function()
    runningMan.x = runningMan.x + manMoveAmt
    runningMan.rotation = 0.00
    --runningMan.y = runningMan.y + .001
    end

local gameLoopA = function()
        if composer.getSceneName("current") == "1" then
        --timer.performWithDelay( 1000, nextManImage, 1 )
    --nextManImage()
        --print(canRunBool)
        if hasLanded == true and isPaused == false and gravUp == false then
            physics.setGravity(0, 8.8)
            end
        runningMan.rotation = 0.00
        moveBackground()
        if canRunBool == true then
    updateManMovement()   
        end
        gameInitA()
            end
        
end
 
gameInitA = function()
    --Runtime:addEventListener( "enterFrame", gameLoopA )
    runningMan.rotation = 0
    for i = 1, 10, 1 do transitionSizeX(i) end
    timer.performWithDelay( 125, gameLoopA)
end
 
    
    
    gameInitA()

local switchToLeft = false
local switchToRight = false
local directionBool = true -- when == true that means it's moving right, else moving left
local function switchDirectionMan( event )
	--local t = event.target
    --runningMan.rotation = 0.00
    if switchToLeft == true then runningMan.xScale = -(runManScaleX) manMoveAmt = -(math.abs(manMoveAmt)) switchToLeft = false end
    --print(manMoveAmt)
    if switchToRight == true then runningMan.xScale = runManScaleX manMoveAmt = math.abs(manMoveAmt) switchToRight = false end
    
    
    end

--local groundTriggered = false
--local function canJump( event )
--    if groundTriggered == true then hasLanded = true doubleSwipeDown = 0 doubleSwipeUp = 0 end
--    if groundTriggered == false then hasLanded = false end
--    end





--local plane = display.newImage( "plane.png", 100, 200 )physics.addBody( plane, { density = 1.0, friction = 0.3, bounce = 0.2 } )
--plane.id = "the plane" 
--local ground = display.newImage( "ground.png", 160, 420 )physics.addBody( ground, { density = 0 } )
--ground.id = "the ground" 
--local function onCollision( event )  
--    if ( event.phase == "began" ) then          
--        print( "began: " .. event.object1.id .. " & " .. event.object2.id )    
--        if((event.object1.id=="the plane" and event.object2.id=="the ground") 
--        or (event.object1.id=="the ground" and event.object2.id=="the plane")) 
--            then
--            print("hey!")
--            end
--        end
--    end -- end of the function
--
--runningMan:addEventListener("collision",onCollision)



-- Start the composer event handlers
--
--buttonsstart

currentLev = myData.settings.currentLevel
myData.activeScenes[currentLev] = true
--print(myData.settings.currentLevel)


local function loadmenu( event )

    if ( "ended" == event.phase ) then 
        --composer.removeScene( composer.getSceneName( "current" ) )
        --composer.removeScene( "game", false )
        composer.gotoScene( "game", { effect = "crossFade", time = 333 } )
        --composer.removeScene("1",true)
        --runmanGroup.isVisible = false
        --runningMan.isVisible = false
        pauseBtn.isVisible = false
        resumeBtn.isVisible = false
         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end





local function loadlevelselect( event )

    if ( "ended" == event.phase ) then
        --composer.removeScene( "levelselect", false )
        composer.gotoScene( "levelselect", { effect = "crossFade", time = 333 } )
        --runmanGroup.isVisible = false
        --runningMan.isVisible = false
        pauseBtn.isVisible = false
        resumeBtn.isVisible = false
         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end








local function restart( event )

    if ( "ended" == event.phase ) then
        composer.removeScene( "1", false )
        composer.gotoScene( "1", { effect = "crossFade", time = 333 } )
        --runmanGroup.isVisible = false
        --runningMan.isVisible = false
        menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end

--local function rePosition()
--    
--if crate.x==display.contentWidth*.08 then 
--        
--        print("6") 
--    
--        
--        
--        
--        end
--    
--end 










local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local physics = require("physics")
physics.start()
--physics.setPositionIterations( 6 )
physics.setPositionIterations(32)
physics.setGravity(0, 8.8)
--physics.setGravity(0, 9.8) -- simulates earth's gravity (default)
--physics.setScale(60)


--physics.setDrawMode("hybrid")


CratefinalRadius = ((conXdif+conYdif)/2) * 20
--print(CratefinalRadius)
--physics.addBody(door, "static", { friction=0, density=0, bounce=0} )
--physics.addBody( crate, "dynamic",{ density=3.0, friction=700, bounce=0.4, radius=CratefinalRadius } )
--physics.addBody( ghost, "kinematic", { friction=700 } )

--physics.addBody(run1, "dynamic", { friction = 1.7 } )
--physics.addBody(run2, "dynamic", { friction = 1.7 } )
--physics.addBody(run3, "dynamic", { friction = 1.7 } )
--physics.addBody(run4, "dynamic", { friction = 1.7 } )
--physics.addBody(run5, "dynamic", { friction = 1.7 } )
--physics.addBody(runmanGroup, "dynamic", { friction = 1.7 } )
local nw, nh = runningMan.width*conXdif*0.2, runningMan.height*(conYdif)*0.2;
physics.addBody(runningMan, "dynamic", { friction = 1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
runningMan.id = "runningMan"
runningMan.isFixedRotation = true
--runningMan.isBullet = true
--print( runningMan.id )

--physics.addBody(invertGravBlock, "static", { density = 0, friction = 0 })
--physics.addBody(normalGravBlock, "static", { density = 0, friction = 0 })




-- A basic function for dragging physics objects
local function startDrag( event )
	local t = event.target
--    if math.floor(crate.x)==math.floor(display.contentWidth*.175) then print("6") crate.x = math.floor(display.contentWidth*.175)  end
--    if math.floor(crate.x)==math.floor(display.contentWidth*.174) then print("6") crate.x = math.floor(display.contentWidth*.175)  end
--    if math.floor(crate.y)==math.floor(display.contentHeight*.895) then print("6") crate.y = math.floor(display.contentHeight*.895)  end
--    if math.floor(crate.y)==math.floor(display.contentHeight*.905) then print("6") crate.y = math.floor(display.contentHeight*.895)  end
    
--    if math.floor(crate.x)==math.floor(display.contentWidth*.175) then  
--        physics.removeBody( ghost )  ghost.x = math.floor(display.contentWidth*.175)  end
--    if math.floor(crate.y)==math.floor(display.contentHeight*.895) then 
--        physics.removeBody( ghost )  ghost.y = math.floor(display.contentHeight*.895)  end
    
    
    --print(crate.x)

	local phase = event.phase
	if "began" == phase then
        --checkCrate()
--        if crate.x==display.contentWidth*.28 then print("6") end
		display.getCurrentStage():setFocus( t )
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
		
		-- Make body type temporarily "kinematic" (to avoid gravitional forces)
		event.target.bodyType = "kinematic"
        
		-- Stop current motion, if any
		event.target:setLinearVelocity( 0, 0 )
		event.target.angularVelocity = 0

	elseif t.isFocus then
		if "moved" == phase then
            
			t.x = event.x - t.x0
			t.y = event.y - t.y0

		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
			
			-- Switch body type back to "dynamic", unless we've marked this sprite as a platform
			if ( not event.target.isPlatform ) then
				event.target.bodyType = "dynamic"
			end

		end
	end

	-- Stop further propagation of touch event!
	return true
end








local function winGame( event )
	local t = event.target
    print("You Win!")
    
    
    end 
















function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --








--local background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
--    background.x = display.contentCenterX
--    background.y = display.contentCenterY
--    --background:scale(pixXdif, pixYdif)
--    sceneGroup:insert(background)




sceneGroup:insert(transSwipeDetect)
    
for k,v in pairs(sawBlade) do    
sceneGroup:insert(sawBlade[k])
--physics.addBody(sawBlade[k],"static")
        end
sceneGroup:insert(invertGravBlock)
sceneGroup:insert(normalGravBlock)
    
--for k,v in pairs(blankCube) do 
--sceneGroup:insert(blankCube[k])
--    end

--for i = 1, 9, 1 do
--        sceneGroup:insert(blankCube[i])
--end



----local background2 = display.newImage( "background2.jpg", display.contentWidth*.5, display.contentHeight*.5, true )
--local background2 = display.newImage( "backgroundSky.png", display.contentWidth*.5, display.contentHeight*.5, true )
----local background2 = display.newImage( "backgroundSky.jpg", display.contentWidth*.5, display.contentHeight*.5, true )
----background2:scale(conXdif, conYdif)
--background2.height = display.contentHeight
--background2.width = display.contentWidth * 3
--sceneGroup:insert(background2)
----local ground = display.newImage( "floor.png", 160, 440 )
----physics.addBody( ground, "static", { friction=0.6 } )
--    
--local cloudArrangementB = display.newImage( "cloudArrangementB.png", display.contentWidth*.5, display.contentHeight*.5, true)
--cloudArrangementB.height = display.contentHeight
--cloudArrangementB.width = display.contentWidth * 3
--sceneGroup:insert(cloudArrangementB)
--local cloudArrangementBcopy = display.newImage( "cloudArrangementBinverted.png", display.contentWidth*3.5, display.contentHeight*.5, true)
--cloudArrangementBcopy.height = display.contentHeight
--cloudArrangementBcopy.width = display.contentWidth * 3
--sceneGroup:insert(cloudArrangementBcopy)
--    
--local cloudArrangementA = display.newImage( "cloudArrangementA.png", display.contentWidth*.5, display.contentHeight*.5, true)
--cloudArrangementA.height = display.contentHeight
--cloudArrangementA.width = display.contentWidth * 3
--sceneGroup:insert(cloudArrangementA)
--local cloudArrangementAcopy = display.newImage( "cloudArrangementAinverted.png", display.contentWidth*3.5, display.contentHeight*.5, true)
--cloudArrangementAcopy.height = display.contentHeight
--cloudArrangementAcopy.width = display.contentWidth * 3
--sceneGroup:insert(cloudArrangementAcopy)
--
--
--    
--    
--    
--local moveBackground = function()
--        
--        cloudArrangementB.x = cloudArrangementA.x - .05
--        cloudArrangementBcopy.x = cloudArrangementAcopy.x - .05
--        cloudArrangementA.x = cloudArrangementA.x - 1
--        cloudArrangementAcopy.x = cloudArrangementAcopy.x - 1
--        
--
--    if cloudArrangementA.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementA.x = (display.contentWidth * 4.50) end 
--    if cloudArrangementAcopy.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementAcopy.x = (display.contentWidth * 4.50) end
--    if cloudArrangementB.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementB.x = (display.contentWidth * 4.50) end 
--    if cloudArrangementBcopy.x <= ( math.floor(display.contentWidth * -1.5) ) then cloudArrangementBcopy.x = (display.contentWidth * 4.50) end
--    
--    end    
    
    

    
    
    
sceneGroup:insert(background2)
sceneGroup:insert(cloudArrangementB)
sceneGroup:insert(cloudArrangementBcopy)
sceneGroup:insert(cloudArrangementA)
sceneGroup:insert(cloudArrangementAcopy) 
    
    
    
    
Xreg = 14 / 1136
--Xperspective = Xreg * pixHeight
--XpersB = (14 / 640) * pixWidth

--Yvar1 = (35 / 640) * pixWidth
--Yvar2 = (108 / 640) * pixWidth
--Yvar3 = (181 / 640) * pixWidth
--Yvar4 = (254 / 640) * pixWidth
--Yvar5 = (327 / 640) * pixWidth

--Xvar1 = (62 / 1136) * pixHeight
--Xvar2 = (127 / 1136) * pixHeight
--Xvar3 = (192 / 1136) * pixHeight
--Xvar4 = (257 / 1136) * pixHeight
--Xvar5 = (322 / 1136) * pixHeight
--Xvar6 = (387 / 1136) * pixHeight
--Xvar7 = (452 / 1136) * pixHeight
--Xvar8 = (514 / 1136) * pixHeight


    
--locationX1 = display.contentWidth * .8
--Yperspective = display.contentHeight * .03
--Xvar1B = display.contentWidth * -.03
--Xvar2B = display.contentWidth * .20
--Xvar3B = display.contentWidth * .43
--Xvar4B = display.contentWidth * .66
--Xvar5B = display.contentWidth * .89
    
XpersB = display.contentWidth * .04

Yvar1 = display.contentHeight * .12
Yvar2 = display.contentHeight * .23
Yvar3 = display.contentHeight * .34
Yvar4 = display.contentHeight * .45
Yvar5 = display.contentHeight * .56
Yvar6 = display.contentHeight * .67
Yvar7 = display.contentHeight * .78
Yvar8 = display.contentHeight * .89
    
locationX1 = display.contentWidth * .8
--Yperspective = display.contentHeight * .03
Yperspective = display.contentHeight * .03
Xvar1B = display.contentWidth * -.03
Xvar2B = display.contentWidth * .20
Xvar3B = display.contentWidth * .43
Xvar4B = display.contentWidth * .66
Xvar5B = display.contentWidth * .89
    
    
--    print(Xperspective)
--    print("test")
    
    
    
    
    
    
    
    
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
    
    
    local allPlatformCubes = {} -- multi-dimensional Array [1-10] but 10 is the blank one
    local currentArray = 1
    
    
    sceneGroup:insert(orangeCube)
    sceneGroup:insert(blueCube)
    sceneGroup:insert(darkerBlueCube)
    sceneGroup:insert(purpleCube)
    sceneGroup:insert(redCube)
    sceneGroup:insert(lightRedCube)
    sceneGroup:insert(pinkCube)
    sceneGroup:insert(greenCube)
    sceneGroup:insert(yellowCube)
    
--    local sizeOfOrigImage = 20 -- scaled example: 30x30
    local sizeOfOrigImage = 15 -- scaled example: 30x30
    local AmtofVertBlocks = (display.contentHeight / (sizeOfOrigImage * conYdif))
    local scalingFactorY = (AmtofVertBlocks / math.floor(AmtofVertBlocks))
    local newPixSizeY = ((scalingFactorY) * (sizeOfOrigImage * conYdif))
--    local AmtofHorizBlocks = ((display.contentWidth) / (sizeOfOrigImage * conXdif)) - 2
    local AmtofHorizBlocks = ((display.contentWidth) / (sizeOfOrigImage * conXdif)) - 0
    local AVBnew = display.contentHeight / ( (scalingFactorY) * (sizeOfOrigImage * conYdif) )
    local scalingFactorX = (AmtofHorizBlocks / math.floor(AmtofHorizBlocks))
    local AHBnew = display.contentWidth / ( (scalingFactorX) * (sizeOfOrigImage * conXdif) )
    local newPixSizeX = ((scalingFactorX) * (sizeOfOrigImage * conXdif))
--    leftWall[1]:scale(scalingFactorX,scalingFactorY)
    local platformPadding = 200
    local currentPaddingAdd = 0
    
    
    
--    local leftWallGroup = display.newGroup()
--    local leftWall = {}
----    leftWall[1] = display.newImage(leftWallGroup, "orangeSquare.png", display.contentCenterX-300, display.contentCenterY)
--    leftWall[1] = display.newImage(leftWallGroup, "orangeSquare.png", (newPixSizeX/2), (newPixSizeY/2) )
--    physics.addBody( leftWall[1],"static", {friction = 1.7 } )
--    leftWall[1].isPlatform = true
--    leftWall[1]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
--    sceneGroup:insert(leftWall[1])
    
    local colorOption = {}
--    colorOption[1] = "colorSchemeSet1/yellow1Square.png"
--    colorOption[2] = "colorSchemeSet1/yellow1Square.png"
--    colorOption[3] = "colorSchemeSet1/yellow1Square.png"
--    colorOption[4] = "colorSchemeSet1/yellow2Square.png"
--    colorOption[5] = "colorSchemeSet1/yellow2Square.png"
--    colorOption[6] = "colorSchemeSet1/yellow2Square.png"
--    colorOption[7] = "colorSchemeSet1/yellow3Square.png"
--    colorOption[8] = "colorSchemeSet1/yellow3Square.png"
--    colorOption[9] = "colorSchemeSet1/yellow3Square.png"
--    
--    colorOption[10] = "colorSchemeSet1/orange1Square.png"
--    colorOption[11] = "colorSchemeSet1/orange1Square.png"
--    colorOption[12] = "colorSchemeSet1/orange1Square.png"
--    colorOption[13] = "colorSchemeSet1/orange2Square.png"
--    colorOption[14] = "colorSchemeSet1/orange2Square.png"
--    colorOption[15] = "colorSchemeSet1/orange2Square.png"
--    colorOption[16] = "colorSchemeSet1/orange3Square.png"
--    colorOption[17] = "colorSchemeSet1/orange3Square.png"
--    colorOption[18] = "colorSchemeSet1/orange3Square.png"
--    
--    colorOption[19] = "colorSchemeSet1/red1Square.png"
--    colorOption[20] = "colorSchemeSet1/red1Square.png"
--    colorOption[21] = "colorSchemeSet1/red1Square.png"
--    colorOption[22] = "colorSchemeSet1/red2Square.png"
--    colorOption[23] = "colorSchemeSet1/red2Square.png"
--    colorOption[24] = "colorSchemeSet1/red2Square.png"
--    colorOption[25] = "colorSchemeSet1/red3Square.png"
--    colorOption[26] = "colorSchemeSet1/red3Square.png"
--    colorOption[27] = "colorSchemeSet1/red3Square.png"
    
    
    colorOption[1] = "colorSchemeSet1/yellow1Square.png"
    colorOption[2] = "colorSchemeSet1/yellow2Square.png"
    colorOption[3] = "colorSchemeSet1/yellow3Square.png"
    colorOption[4] = "colorSchemeSet1/yellow4Square.png"
    colorOption[5] = "colorSchemeSet1/yellow5Square.png"
    colorOption[6] = "colorSchemeSet1/yellow6Square.png"
    colorOption[7] = "colorSchemeSet1/orange1Square.png"
    colorOption[8] = "colorSchemeSet1/orange2Square.png"
    
    colorOption[9] = "colorSchemeSet1/orange3Square.png"
    colorOption[10] = "colorSchemeSet1/orange4Square.png"
    colorOption[11] = "colorSchemeSet1/orange5Square.png"
    colorOption[12] = "colorSchemeSet1/orange6Square.png"
    colorOption[13] = "colorSchemeSet1/red1Square.png"
    colorOption[14] = "colorSchemeSet1/red2Square.png"
    colorOption[15] = "colorSchemeSet1/red3Square.png"
    colorOption[16] = "colorSchemeSet1/red4Square.png"
    colorOption[17] = "colorSchemeSet1/red5Square.png"
    colorOption[18] = "colorSchemeSet1/red5Square.png"
    
    
    
    
    local switchToLeftFunc = function()
        switchToLeft = true
        end
    local switchToRightFunc = function()
        switchToRight = true
        end
    
    local switchGroundTriggered = function()
        groundTriggered = true
        doubleSwipeUp = 0 doubleSwipeDown = 0
        end
    
    local leftWallGroup = display.newGroup()
    local leftWall = {}
    local colorCount = 0
    local cCvar = true
    
    local pixYadd = 0
    --local colorCountA = 0
    for i = 1, AVBnew, 1 do -- this is the leftWall block generator
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    leftWall[i] = display.newImage(leftWallGroup, colorOption[colorCount], -(newPixSizeX/2), (newPixSizeY/2) + pixYadd )
    --leftWall[i]:addEventListener("collision",switchToRightFunc)
    physics.addBody( leftWall[i],"static", {friction = 1.7 } )
    leftWall[i].isPlatform = true
    leftWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(leftWall[i])
    pixYadd = pixYadd + newPixSizeY
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
      if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
        
    end
    
    
    local bottomWallGroup = display.newGroup()
    local bottomWall = {}
    
    local pixXadd = 0
    --local colorCountD = 0
    for i = 1, AHBnew - 0, 1 do -- this is the bottomWall block generator :: AHBnew - 2 because we get corner blocks from Vert generator
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    tempHeiLoc = (display.contentHeight - (newPixSizeY/2))
    bottomWall[i] = display.newImage(bottomWallGroup, colorOption[colorCount], (newPixSizeX/2) + pixXadd, tempHeiLoc + newPixSizeY - 10 )
    --bottomWall[i]:addEventListener("collision",switchGroundTriggered)
--        local nw, nh = bottomWall[i].width*conXdif*0.2, bottomWall[i].height*(conYdif)*0.2;
--        physics.addBody( bottomWall[i],"static", { friction = 1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
    physics.addBody( bottomWall[i],"static", {friction = 1.7 } )
        bottomWall[i].id = "Ablock"
    bottomWall[i].isPlatform = true
    bottomWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(bottomWall[i])
    pixXadd = pixXadd + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
    end
    
    

    
    
    local rightWallGroup = display.newGroup()
    local rightWall = {}
    
    local pixYadd = 0
    --local colorCountC = 0
    for i = 1, AVBnew, 1 do -- this is the rightWall block generator
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    tempWidLoc = (display.contentWidth - (newPixSizeX/2))
    tempHeiLoc = (display.contentHeight - (newPixSizeY/2))
    rightWall[i] = display.newImage(rightWallGroup, colorOption[colorCount], tempWidLoc + (newPixSizeX), tempHeiLoc - pixYadd )
    --rightWall[i]:addEventListener("collision",switchToLeftFunc)
    physics.addBody( rightWall[i],"static", {friction = 1.7 } )
    rightWall[i].isPlatform = true
    rightWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(rightWall[i])
    pixYadd = pixYadd + newPixSizeY
    if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
      if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
        
    end
    
    
    
    local topWallGroup = display.newGroup()
    local topWall = {}
    
    local pixXadd = 0
    --local colorCountB = 0
    for i = 1, AHBnew - 0, 1 do -- this is the topWall block generator :: AHBnew - 2 because we get corner blocks from Vert generator
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
--    topWall[i] = display.newImage(topWallGroup, colorOption[colorCountB], (newPixSizeX/2) + pixXadd, (newPixSizeY/2) )
    tempWidLoc = (display.contentWidth - (newPixSizeX/2))
    topWall[i] = display.newImage(topWallGroup, colorOption[colorCount], tempWidLoc - pixXadd, -(newPixSizeY/2) )
    physics.addBody( topWall[i],"static", {friction = 1.7 } )
        topWall[i].id = "Ablock"
    topWall[i].isPlatform = true
    topWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(topWall[i])
    pixXadd = pixXadd + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
        
    end
    
    
    
    
    
    
    
    
    -- below here is forLoops for generating other platforms --->
    
    
    
    
--    local platformAAGroup = display.newGroup()
--    local platformAA = {}
--    local platformAtotalBlocks = (AHBnew - 2)
--    
--    local pixXadd = newPixSizeX
--    for i = 1, platformAtotalBlocks - 8, 1 do
--    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
--    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
--    tempHeiLoc = (0 + (newPixSizeY/2)) + 350
--    platformAA[i] = display.newImage(platformAAGroup, colorOption[colorCount], (newPixSizeX/2) + pixXadd, tempHeiLoc )
--    platformAA[i]:addEventListener("collision",switchGroundTriggered)
--    physics.addBody( platformAA[i],"static", {friction = 1.7 } )
--    platformAA[i].isPlatform = true
--    platformAA[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
--    sceneGroup:insert(platformAA[i])
--    pixXadd = pixXadd + newPixSizeX
--        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
--    if colorCount == 18 then colorCount = colorCount - 1 
--            if cCvar == true then cCvar = false end --else cCvar = true end
--            end --colorCount = 1 end
--    end
--    
--    local platformABGroup = display.newGroup()
--    local platformAB = {}
--    
--    local pixXaddSideB = pixXadd + (newPixSizeX * 3)
--    for i = 1, (platformAtotalBlocks - (platformAtotalBlocks - 8)) - 3, 1 do
--    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
--    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
--    tempHeiLoc = (0 + (newPixSizeY/2)) + 350
--    platformAB[i] = display.newImage(platformABGroup, colorOption[colorCount], (newPixSizeX/2) + pixXaddSideB, tempHeiLoc )
--    platformAB[i]:addEventListener("collision",switchGroundTriggered)
--    physics.addBody( platformAB[i],"static", {friction = 1.7 } )
--    platformAB[i].isPlatform = true
--    platformAB[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
--    sceneGroup:insert(platformAB[i])
--    pixXaddSideB = pixXaddSideB + newPixSizeX
--        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
--    if colorCount == 18 then colorCount = colorCount - 1 
--            if cCvar == true then cCvar = false end --else cCvar = true end
--            end --colorCount = 1 end
--    end
--    
--    -- split to next platform level --------------------------------------------------------------------------------------------
--    
--    local platformBAGroup = display.newGroup()
--    local platformBA = {}
--    local platformBtotalBlocks = (AHBnew - 2)
--    
--    local pixXadd = newPixSizeX
----    for i = 1, AHBnew - 2, 1 do -- this is a mid-level platform
----    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
----    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
----    tempHeiLoc = (0 + (newPixSizeY/2)) + 550
----    platformBA[i] = display.newImage(platformBAGroup, colorOption[colorCount], (newPixSizeX/2) + pixXadd, tempHeiLoc )
----    physics.addBody( platformBA[i],"static", {friction = 1.7 } )
----    platformBA[i].isPlatform = true
----    platformBA[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
----    sceneGroup:insert(platformBA[i])
----    pixXadd = pixXadd + newPixSizeX
----        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
----    if colorCount == 18 then colorCount = colorCount - 1 
----            if cCvar == true then cCvar = false end --else cCvar = true end
----            end --colorCount = 1 end
----    end
--    
--    local platformBBGroup = display.newGroup()
--    local platformBB = {}
--    
--    local pixXadd = newPixSizeX
--    local pixXaddSideB = pixXadd + (newPixSizeX * 3)
--    for i = 1, platformBtotalBlocks - 3, 1 do -- this is a mid-level platform
--    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
--    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
--    tempHeiLoc = (0 + (newPixSizeY/2)) + 650
--    platformBB[i] = display.newImage(platformBBGroup, colorOption[colorCount], (newPixSizeX/2) + pixXaddSideB, tempHeiLoc )
--    platformBB[i]:addEventListener("collision",switchGroundTriggered)
--    physics.addBody( platformBB[i],"static", {friction = 1.7 } )
--    platformBB[i].isPlatform = true
--    platformBB[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
--    sceneGroup:insert(platformBB[i])
--    pixXaddSideB = pixXaddSideB + newPixSizeX
--        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
--    if colorCount == 18 then colorCount = colorCount - 1 
--            if cCvar == true then cCvar = false end --else cCvar = true end
--            end --colorCount = 1 end
--    end
--    
--     -- split to next platform level --------------------------------------------------------------------------------------------
--    
--    
--    
--    
--    local platformXXGroup = display.newGroup()
--    local platformXX = {}
--    
--    local pixXadd = newPixSizeX
--    for i = 1, AHBnew - 2, 1 do -- this is a mid-level platform
--    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
--    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
--    tempHeiLoc = (0 + (newPixSizeY/2)) + 950
--    platformXX[i] = display.newImage(platformXXGroup, colorOption[colorCount], (newPixSizeX/2) + pixXadd, tempHeiLoc )
--    platformXX[i]:addEventListener("collision",switchGroundTriggered)
--    physics.addBody( platformXX[i],"static", {friction = 1.7 } )
--    platformXX[i].isPlatform = true
--    platformXX[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
--    sceneGroup:insert(platformXX[i])
--    pixXadd = pixXadd + newPixSizeX
--        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
--    if colorCount == 18 then colorCount = colorCount - 1 
--            if cCvar == true then cCvar = false end --else cCvar = true end
--            end --colorCount = 1 end
--    end
    
    
    
    
    
    
    
    -- split :: below is the condesnsed code for generating platforms -->
    
    
--    local function ifHasCollided( obj1, obj2) -- this one is for non-physic circle collision
--        if( obj1 == nil ) then
--            return false
--            end
--        if( obj2 == nil ) then
--            return true
--            end
--        
--        local dx = obj1.x - obj2.x
--        local dy = obj1.y - obj2.y
--        
--        local distance = math.sqrt( dx*dx + dy*dy )
--        local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)
--        
--        if( distance < objectSize ) then
--            return true
--            end
--        return false
--        end
--    
--    
--    
--    
--    local checkCollision = function()
--    if composer.getSceneName("current") == "1" and isPaused == false then
--            
--    local holdBool  
--        
--    holdBool = ifHasCollided( runningMan, invertGravBlock)
--    if( holdBool == true ) and (gravUp == false) then 
--    runningMan.yScale = -(runManScaleY) physics.setGravity(0, -8.8) gravUp = true isInverted = true end
--            
--    for i,x in pairs(platformAA) do
--    for z,y in pairs(platformAA[i]) do
--    holdBool = ifHasCollided( runningMan, platformAA[i][z])
--    if holdBool == true then end
--                    end
--            end
--            
--    for i,x in pairs(platformAB) do
--    for z,y in pairs(platformAB[i]) do
--    holdBool = ifHasCollided( runningMan, platformAB[i][z])
--    if holdBool == true then end
--                    end
--            end
--            
--    holdBool = ifHasCollided( runningMan, normalGravBlock)
--    if( holdBool == true ) and (gravUp == true) then
--    runningMan.yScale = (runManScaleY) physics.setGravity(0, 8.8) gravUp = false isInverted = false end
--        
--    for i,x in pairs(sawBlade) do        
--    holdBool = ifHasCollided( runningMan, sawBlade[i])
--    if( holdBool == true ) then
--                print("Game Over!")
--                end
--            end
--            
--        
--            end
--        end
--    Runtime:addEventListener("enterFrame",checkCollision)
--    
--    
--    
--    
--    
----    local function ifRectHasCollided( obj1, obj2 ) -- check for rectangleCollisions
----        if( obj1 == nil ) then
----            return false
----            end
----        if( obj2 == nil ) then
----            return false
----            end
----        
----        local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and
----        obj1.contentBounds.xMax >= obj2.contentBounds.xMin
----        local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and
----        
----        
----        end
    
    
    
    
    
    
    
    
        --ground.id = "the ground" 
local function mainGroundTrigger( event )
        --print( hasLanded )
--    local holdBool = ifHasCollided( runningMan, invertGravBlock)
--    if( holdBool == true ) then print("invert") end
        
    if ( event.phase == "began" ) then          
        --print( "began: " .. event.object1.id .. " & " .. event.object2.id )    
        if((event.object1.id=="runningMan" and event.object2.id=="Ablock") 
        or (event.object1.id=="Ablock" and event.object2.id=="runningMan")) 
            then
        --groundTriggered = true
        doubleSwipeUp = 0 doubleSwipeDown = 0
                hasLanded = true
                actualMoveUp = false
                actualMoveDown = false
                --hasLanded = false
            end
            
        end
        if ( event.phase == "ended" ) and (actualMoveUp == true) and 
        ( (event.object1.id=="runningMan" and event.object2.id=="Ablock") or
        (event.object1.id=="Ablock" and event.object2.id=="runningMan") ) then
            hasLanded = false
            end
    end -- end of the function

--runningMan:addEventListener("collision",mainGroundTrigger)
Runtime:addEventListener("collision",mainGroundTrigger)
    
    
    
    
    
    
        local platformAAColorlocations = {} -- the "current" color locations for each block
        local platformAAXlocations = {}
        local platformAAYlocations = {}
    
        local platformABColorlocations = {} -- the "current" color locations for each block
        local platformABXlocations = {}
        local platformABYlocations = {}
        local changeVar = 0
    
    
    local amtAAarrays = 0
    local platformAA = {}
    local amtABarrays = 0
    local platformAB = {}
        local platformAAGroup = display.newGroup()
        local platformABGroup = display.newGroup()
    
        local generatePlatform = function(randomVarA,randomVarB,nextYlocation) -- this is the template for creating new platforms (can be randomly generated)
        
--        local randomVarA = 8
--        local randomVarB = 3
--        local randomVarC = 0
--        local nextYlocation = 350
   
        
--        local platformAAColorlocations = {} -- the "current" color locations for each block
--        local platformAAXlocations = {}
--        local platformAAYlocations = {}
        local totalAAblocks = 0
        
        amtAAarrays = amtAAarrays + 1
--    local platformAAGroup = display.newGroup()
    platformAA[amtAAarrays] = {}
    local platformAtotalBlocks = (AHBnew - 0)
    
--    local pixXadd = newPixSizeX - 0
    local pixXadd = 0 + 0
    for i = 1, (platformAtotalBlocks - randomVarA), 1 do
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
    tempHeiLoc = (0 + (newPixSizeY/2)) + nextYlocation
            if colorCount+changeVar >= 19 then changeVar = 0 end
    platformAA[amtAAarrays][i] = display.newImage(platformAAGroup, colorOption[colorCount+changeVar], (newPixSizeX/2) + pixXadd, tempHeiLoc )
            
    platformAAColorlocations[i] = colorCount
    platformAAXlocations[i] = (newPixSizeX/2) + pixXadd
    platformAAYlocations[i] = tempHeiLoc
    totalAAblocks = totalAAblocks + 1
            
            physics.addBody( platformAA[amtAAarrays][i],"static", {friction = 1.7 } )
            platformAA[amtAAarrays][i].id = "Ablock"
    --platformAA[i]:addEventListener("collision",switchGroundTriggered)
    --platformAA[i]:addEventListener("collision",mainGroundTrigger)
    platformAA[amtAAarrays][i].isPlatform = true
    platformAA[amtAAarrays][i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(platformAA[amtAAarrays][i])
    pixXadd = pixXadd + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
    end
        
        
--        local platformABColorlocations = {} -- the "current" color locations for each block
--        local platformABXlocations = {}
--        local platformABYlocations = {}
        local totalABblocks = 0
        
        
    amtABarrays = amtABarrays + 1
--    local platformABGroup = display.newGroup()
    platformAB[amtABarrays] = {}
    --local platformAB = {}
    
    local pixXaddSideB = pixXadd + (newPixSizeX * randomVarB)
    for i = 1, (platformAtotalBlocks - (platformAtotalBlocks - randomVarA)) - randomVarB, 1 do
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    --tempHeiLoc = (display.contentHeight - (newPixSizeY/2)) 
    tempHeiLoc = (0 + (newPixSizeY/2)) + nextYlocation
                if colorCount+changeVar >= 19 then changeVar = 0 end
    platformAB[amtABarrays][i] = display.newImage(platformABGroup, colorOption[colorCount+changeVar], (newPixSizeX/2) + pixXaddSideB, tempHeiLoc )
            
    platformABColorlocations[i] = colorCount
    platformABXlocations[i] = (newPixSizeX/2) + pixXaddSideB
    platformABYlocations[i] = tempHeiLoc
    totalABblocks = totalABblocks + 1
            
            --print(colorCount)
            physics.addBody( platformAB[amtABarrays][i],"static", {friction = 1.7 } )
            platformAB[amtABarrays][i].id = "Ablock"
    --platformAB[i]:addEventListener("collision",switchGroundTriggered)
    --platformAB[i]:addEventListener("collision",mainGroundTrigger)
            
--            local nw, nh = platformAB[i].width*conXdif*0.2, platformAB[i].height*(conYdif)*0.2;
--            --local nw, nh = platformAB[i].width*conXdif*0.5, platformAB[i].height*(conYdif)*0.5;
--        --physics.addBody( platformAB[i],"static", { friction = 1.7, shape={-nw,nh - 10,nw,nh - 10,nw,nh,-nw,nh} } )
--        --physics.addBody( platformAB[i],"static", { friction = 1.7, shape={-nw,-nh+10,nw,-nh+10,nw,nh,-nw,nh} } )
--        physics.addBody( platformAB[i],"static", { friction = 1.7, shape={-nw,-nh,nw,-nh,nw,-nh+10,-nw,-nh+10} } )
            
--    physics.addBody( platformAB[i],"static", {friction = 1.7 } )
    platformAB[amtABarrays][i].isPlatform = true
    platformAB[amtABarrays][i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(platformAB[amtABarrays][i])
    pixXaddSideB = pixXaddSideB + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end --else cCvar = true end
            end --colorCount = 1 end
    end
        
        end -- end of generatePlatforms function
    
    
--    generatePlatform(9,4,525)
--    generatePlatform((AHBnew - 2),4,825)
--    generatePlatform(9,4,1125)
--    generatePlatform(4,(AHBnew - 2),1425)
--    generatePlatform(9,7,1725)
    
    generatePlatform(9,4,325)
    generatePlatform((AHBnew - 2),4,725)
    generatePlatform(9,4,1125)
    generatePlatform(4,(AHBnew - 2),1525)
    
    
    --generatePlatform(9,7,1925)
    --print(table.getn(platformAA))
    
    
    
    
    
    
    
    
    
       local function ifHasCollided( obj1, obj2) -- this one is for non-physic circle collision
        if( obj1 == nil ) then
            return false
            end
        if( obj2 == nil ) then
            return true
            end
        
        local dx = obj1.x - obj2.x
        local dy = obj1.y - obj2.y
        
        local distance = math.sqrt( dx*dx + dy*dy )
        local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)
        
        if( distance < objectSize ) then
            return true
            end
        return false
        end
    
    
    
    
    local checkCollision = function()
    if composer.getSceneName("current") == "1" and isPaused == false then
            
    local holdBool  
        
    holdBool = ifHasCollided( runningMan, invertGravBlock)
    if( holdBool == true ) and (gravUp == false) then 
    runningMan.yScale = -(runManScaleY) physics.setGravity(0, -8.8) gravUp = true isInverted = true end
            
    holdBool = ifHasCollided( runningMan, normalGravBlock)
    if( holdBool == true ) and (gravUp == true) then
    runningMan.yScale = (runManScaleY) physics.setGravity(0, 8.8) gravUp = false isInverted = false end
        
    for i,x in pairs(leftWall) do
    holdBool = ifHasCollided( runningMan, leftWall[i])
    if( holdBool == true ) and (switchToRight == false) then
    switchToLeft = false switchToRightFunc() end
                end
    for i,x in pairs(rightWall) do
    holdBool = ifHasCollided( runningMan, rightWall[i])
    if( holdBool == true ) and (switchToLeft == false) then
    switchToRight = false switchToLeftFunc() end
                end
            
    for i,x in pairs(sawBlade) do        
    holdBool = ifHasCollided( runningMan, sawBlade[i])
    if( holdBool == true ) then
                --print("Game Over!")
                GameOver()
                DarkenObjects()
                end
            end
            
        
            end
        end
    Runtime:addEventListener("enterFrame",checkCollision)
    
    
    
--    local ifIsPaused = function()
--        if isPaused == true then pauseGame() end
--        end
--    Runtime:addEventListener("enterFrame", ifIsPaused)
    
    
    
    
--    runningMan.fill.effect = "filter.brightness"
--    runningMan.fill.effect.intensity = -0.3
--    background2.fill.effect = "filter.brightness"
--    background2.fill.effect.intensity = -0.3
--    cloudArrangementA.fill.effect = "filter.brightness"
--    cloudArrangementA.fill.effect.intensity = -0.3
--    cloudArrangementAcopy.fill.effect = "filter.brightness"
--    cloudArrangementAcopy.fill.effect.intensity = -0.3
--    cloudArrangementB.fill.effect = "filter.brightness"
--    cloudArrangementB.fill.effect.intensity = -0.3
--    cloudArrangementBcopy.fill.effect = "filter.brightness"
--    cloudArrangementBcopy.fill.effect.intensity = -0.3
    
--local DarkenObjects = function()
--    runningMan.fill.effect = "filter.brightness"
--    runningMan.fill.effect.intensity = -0.3
--    background2.fill.effect = "filter.brightness"
--    background2.fill.effect.intensity = -0.3
--    cloudArrangementA.fill.effect = "filter.brightness"
--    cloudArrangementA.fill.effect.intensity = -0.3
--    cloudArrangementAcopy.fill.effect = "filter.brightness"
--    cloudArrangementAcopy.fill.effect.intensity = -0.3
--    cloudArrangementB.fill.effect = "filter.brightness"
--    cloudArrangementB.fill.effect.intensity = -0.3
--    cloudArrangementBcopy.fill.effect = "filter.brightness"
--    cloudArrangementBcopy.fill.effect.intensity = -0.3
--    invertGravBlock.fill.effect = "filter.brightness"
--    invertGravBlock.fill.effect.intensity = -0.3
--    normalGravBlock.fill.effect = "filter.brightness"
--    normalGravBlock.fill.effect.intensity = -0.3
--        
--        for i,x in pairs(bottomWall) do
--    bottomWall[i].fill.effect = "filter.brightness"
--    bottomWall[i].fill.effect.intensity = -0.3
--            end
--        for i,x in pairs(platformAA) do
--    for z,v in pairs(platformAA[i]) do
--    platformAA[i][z].fill.effect = "filter.brightness"
--    platformAA[i][z].fill.effect.intensity = -0.3   
--                end
--            end
--        for i,x in pairs(platformAB) do
--    for z,v in pairs(platformAB[i]) do
--    platformAB[i][z].fill.effect = "filter.brightness"
--    platformAB[i][z].fill.effect.intensity = -0.3   
--                end
--            end
--        end -- end of function DarkenObjects
--    
--    
--    
--local NormalObjects = function()
--    runningMan.fill.effect = "filter.brightness"
--    runningMan.fill.effect.intensity = 0.0
--    background2.fill.effect = "filter.brightness"
--    background2.fill.effect.intensity = 0.0
--    cloudArrangementA.fill.effect = "filter.brightness"
--    cloudArrangementA.fill.effect.intensity = 0.0
--    cloudArrangementAcopy.fill.effect = "filter.brightness"
--    cloudArrangementAcopy.fill.effect.intensity = 0.0
--    cloudArrangementB.fill.effect = "filter.brightness"
--    cloudArrangementB.fill.effect.intensity = 0.0
--    cloudArrangementBcopy.fill.effect = "filter.brightness"
--    cloudArrangementBcopy.fill.effect.intensity = 0.0
--    invertGravBlock.fill.effect = "filter.brightness"
--    invertGravBlock.fill.effect.intensity = 0.0
--    normalGravBlock.fill.effect = "filter.brightness"
--    normalGravBlock.fill.effect.intensity = 0.0
--        
--        for i,x in pairs(bottomWall) do
--    bottomWall[i].fill.effect = "filter.brightness"
--    bottomWall[i].fill.effect.intensity = 0.0
--            end
--        for i,x in pairs(platformAA) do
--    for z,v in pairs(platformAA[i]) do
--    platformAA[i][z].fill.effect = "filter.brightness"
--    platformAA[i][z].fill.effect.intensity = 0.0  
--                end
--            end
--        for i,x in pairs(platformAB) do
--    for z,v in pairs(platformAB[i]) do
--    platformAB[i][z].fill.effect = "filter.brightness"
--    platformAB[i][z].fill.effect.intensity = 0.0  
--                end
--            end
--        end -- end of function NormalObjects
    
    
    
    
    
--    DarkenObjects()
--    NormalObjects()
    
    
--    sawBlades.fill.effect = "filter.brightness"
--    sawBlades.fill.effect.intensity = -0.3
    
    
--    local Acount = 0
--    local Bcount = 0
--    local changeVariable = 0
--    local switchBlockColors = function()
--        changeVariable = changeVariable + 1
--        for i = 1, amtAAarrays, 1 do
--            for z = 1, table.getn(platformAA[i]), 1 do
--                Acount = Acount + 1
--platformAA[i][z] = display.newImage(platformAAGroup, colorOption[platformAAColorlocations[Acount + changeVariable]],
--                    platformAAXlocations[Acount], platformAAYlocations[Acount] )
--                end
--            end
--        
--        for i = 1, amtABarrays, 1 do
--            for z = 1, table.getn(platformAB[i]), 1 do
--                Bcount = Bcount + 1
--platformAB[i][z] = display.newImage(platformABGroup, colorOption[platformABColorlocations[Bcount + changeVariable]],
--                    platformABXlocations[Bcount], platformAAYlocations[Bcount] )                
--            end
--        end
--        
--    end
--    
--    switchBlockColors()

--    local key = 0
--    switchBlockColors = function()
--    if composer.getSceneName("current") == "1" and isPaused == false then
--            key = key + 1
--            if key == 10 then
--                
----        changeVar = changeVar+1
----    generatePlatform(9,4,525)
----    generatePlatform((AHBnew - 2),4,825)
----    generatePlatform(9,4,1125)
----    generatePlatform(4,(AHBnew - 2),1425)
----    generatePlatform(9,7,1725)
--                key = 0
--                --print("yep")
--                
--                end
--            end
--        end
----    switchBlockColors()
--    
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
----    switchBlockColors()
--    
--    
--Runtime:addEventListener("enterFrame", switchBlockColors)
    
    
    
    
    
    
--    local function createStar()
--			local starSpeed = 50
--			local starTime = 12000
--			local powerUpRandom = math.random
--				timer.performWithDelay(10, function()
--				local starDown = display.newRect(0,0,10,10)
--				starDown:setFillColor(255,235,0)
--				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
--				starDown:applyForce(2*(powerUpRandom(starSpeed*-1,starSpeed)),2*(powerUpRandom(starSpeed*-1,starSpeed)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)))
--				starDown:applyTorque(3*powerUpRandom(25,35))
--				starDown.x = display.contentWidth * .5
--				starDown.y = display.contentHeight * .5
--				sceneGroup:insert(starDown)
--				transition.to(starDown, {time=starTime, alpha=.1})
--				return starDown
--			end, 15)
--		end
--    createStar()
    
    
    
    
    
    
    
    
    
--    local function colorFountain()
--			local starSpeed = 50
--			local starTime = 12000
--			local powerUpRandom = math.random
--				timer.performWithDelay(10, function()
--                 if composer.getSceneName("current") == "1" and isPaused == false then
--				local starDown = display.newRect(0,0,10,10)
--				starDown:setFillColor(0,0,0)
--				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
--				starDown:applyForce(2*(powerUpRandom(starSpeed*-1,starSpeed)),2*(powerUpRandom(starSpeed*-1,starSpeed)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)))
--				starDown:applyTorque(3*powerUpRandom(25,35))
--				starDown.x = display.contentWidth * .5
--				starDown.y = display.contentHeight * -.01
--				sceneGroup:insert(starDown)
--				transition.to(starDown, {time=starTime, alpha=.1})
--				return starDown
--                    end
--			end, 0) -- zero means to recur indefinately
--		end
--    colorFountain()
    
    
    
    
    
    
   local function blocksEffectSpawner(aVar, bVar, cVar, dVar)
			local starSpeed = 50
			local starTime = 12000
			local powerUpRandom = math.random
				timer.performWithDelay(500, function()
                 if composer.getSceneName("current") == "1" and isPaused == false then
				local starDown = display.newRect(0,0,10,10)
				starDown:setFillColor(0,0,0)
				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
                    
				starDown:applyForce( 7 *(powerUpRandom(starSpeed*-1,-25)),2*(powerUpRandom(cVar,dVar)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)) )
                starDown.alpha = .10
				starDown:applyTorque(3*powerUpRandom(25,35))
				starDown.x = display.contentWidth * aVar -- 1.00
				starDown.y = display.contentHeight * bVar -- -.01
                    starDown.gravityScale = 0.00
                    
--                    platformAAGroup:toFront()
--                    platformABGroup:toFront()
                    
				sceneGroup:insert(starDown)
--				transition.to(starDown, {time=starTime, alpha=.1})
                transition.to(starDown, {time=starTime})
				return starDown
                    end
			end, 0) -- zero means to recur indefinately
		end
    
    
--    blocksEffectSpawner(1.00, .05, -10, 0)
--    blocksEffectSpawner(1.00, .1, -10, 0)
--    blocksEffectSpawner(1.00, .15, -10, 0)
--    blocksEffectSpawner(1.00, .20, -10, 0)
--    blocksEffectSpawner(1.00, .25, -10, 0)
--    blocksEffectSpawner(1.00, .30, -10, 0)
--    blocksEffectSpawner(1.00, .35, -10, 0)
--    blocksEffectSpawner(1.00, .40, -10, 0)
--    blocksEffectSpawner(1.00, .45, -10, 0)
--    blocksEffectSpawner(1.00, .50, -10, 0)
--    blocksEffectSpawner(1.00, .55, -10, 0)
--    blocksEffectSpawner(1.00, .60, -10, 0)
--    blocksEffectSpawner(1.00, .65, -10, 0)
--    blocksEffectSpawner(1.00, .70, -10, 0)
--    blocksEffectSpawner(1.00, .75, -10, 0)
--    blocksEffectSpawner(1.00, .80, -10, 0)
--    blocksEffectSpawner(1.00, .85, -10, 0)
--    blocksEffectSpawner(1.00, .90, -10, 0)
--    blocksEffectSpawner(1.00, .95, -10, 0)
    
    
    
    
    
    
    
--    blocksEffectSpawner(1.00, .5, -500)
--    blocksEffectSpawner(1.00, .5, -50) 
    
    
    
    
--    --local myLine = display.newLine(10, 100, 300, 100)
--    local star = display.newLine( 200,90, 227,165 )
--    star:append( 305,165, 243,216, 265,290,
--                 200,245, 135,290, 157,215,
--                95,165, 173,165, 200,90 )
--    star.strokeWidth = 3
--    star:setStrokeColor( 255, 102, 102 )
--    local myRect = display.newRect(200,40, 200,50)
--    myRect.strokeWidth = 10
--    myRect:setStrokeColor(0, 0, 255)
--    myRect:setFillColor(0, 224, 255)
--    local myCircle = display.newCircle(100, 100, 30)
--    
--    local rectA = display.newRoundedRect(400, 300, 100, 20, 10)
--    rectA:setFillColor(1,0,0)
--    rectA.stroke = {type="image", filename="run1.png"}
--    rectA.strokeWidth = 6
--    rectA:setStrokeColor(1,0,0)
--    
--    local curve
--    local pathPoints = {}
--    local curveSegments = 100
--    local followeParams = {
--    segmentTime=50, constantRate=true,
--    showPoints=true }
    
--    local PolygonA = display.newPolygon( 0, 0, { 0,-28, 30,28, 0,20, -30,28 })
--    PolygonA.stroke = {type="image", filename="run1.png"}
--    PolygonA.strokeWidth = 6
--    PolygonA:setStrokeColor(1,0,0)
--    PolygonA:setFillColor( 1 )
--    PolygonA.x = 500
--    PolygonA.y = 200
--    PolygonA.rotation = 0
    
--    local PolygonA = display.newPolygon( 0, 0, { 0,-88, 80,88, 0,72, -80,88 })
--    PolygonA.stroke = {type="image", filename="run1.png"}
--    PolygonA.strokeWidth = 10
--    PolygonA:setStrokeColor(1,0,0)
--    PolygonA:setFillColor( 1 )
--    PolygonA.x = 500
--    PolygonA.y = 200
--    PolygonA.rotation = 0
    
    
    
    
    
    
--    local bezier = {}
--    
--    function bezier:curve(xv, yv)
--    local reductor = {__index = function(self, ind)
--            return setmetatable({tree = self, level = ind}, {__index = function(curves, ind)
--                        return function(t)
--                                local x1, y1 = curves.tree[curves.level-1][ind](t)
--                                local x2, y2 = curves.tree[curves.level-1][ind+1](t)
--                                return x1 + (x2 - x1) * t, y1 + (y2 - y1) * t
--                                end
--                        end})
--                end
--            }
--        --end
--        local points = {}
--        for i = 1, #xv do
--            points[i] = function(t) return xv[i], yv[i] end
--            end
--        return setmetatable({points}, reductor)[#points][1]
--        end
--    --return bezier
--    --print(bezier)
--    
--        for i = 1, #hb do
--        
--        end
    
    
    
    
    
    
--    local superHeroes = {
--        { name = "batman", level = 3, age = 35 },
--        { name = "superman", level = 2, age = 30 },
--        { name = "robin", level = 1, age = 17 }
--    }
--    --local stuffToSave = json.encode( superHeroes )
--    --local newSuperHeroes = json.decode( serializedString )
--    
--    local gameSettings = {
--        musicOn = true,
--        soundOn = true,
--        difficulty = "easy",
--        highscrore = 10000,
--        highestLevel = 7
--    }
    
--   loadsave.saveTable( gameSettings, "settings.json" )

--    loadsave.saveTable( myData, "settings.json" )
--    local loadedSettings = loadsave.loadTable( "settings.json" )
----    loadedSettings.

--    local loadedSettings = loadsave.loadTable( "settings.json" )
--    print(loadedSettings.musicOn)
    
    --print(loadedSettings.musicOn)
    
    
    
    
    
    
    
    
--    --print(display.contentWidth / (20))
--    local AmtofHorizBlocks = (display.contentWidth / (20 * conXdif)) - 2 -- minus 2 because the "corner" blocks are going to be vertical blocks
--    local AmtofVertBlocks = (display.contentHeight / (20 * conYdif))
--    --print(20 * conYdif)
--    --leftWall[1]:scale()
--    --print( ((scalingFactorY) * (20 * conYdif)) ) -- new pix block size :: 20 is the set image pix dimens 20x20
--    --print( display.contentHeight / ((28.4 / 28) * (20 * conYdif)) ) -- new block amount
--    --print( (20*(conYdif * 1.0142857142857)) )
--    local scalingFactorX = (AmtofHorizBlocks / math.floor(AmtofHorizBlocks)) -- this is the new scaling factor
--    local scalingFactorY = (AmtofVertBlocks / math.floor(AmtofVertBlocks)) -- this is the new scaling factor
--    --local HorizScale = conXdif * scalingFactorX
--    --local VertScale = conYdif * scalingFactorY
--    local AHBnew = display.contentWidth / ( (scalingFactorX) * (20 * conXdif) )
--    local AVBnew = display.contentHeight / ( (scalingFactorY) * (20 * conYdif) )
--    print(scalingFactorX)
--    print(scalingFactorY)
--    leftWall[1]:scale(scalingFactorX,scalingFactorY)
    
--    print(AVBnew)
    --print(AmtofHorizBlocks)
    --print(AmtofVertBlocks)
    
    
    
    --print(display.contentWidth) -- currently the same as .pixelWidth

    
----wall start
--local wall3 = display.newImage( "wall3.png", Xvar1B, Yperspective ) --regular X is set at 14
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.3)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar2B, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.3)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar3B, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.3)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar4B, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.3)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar5B, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
----physics.addBody( wall3, "static", { friction=1.7 } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.3)
--sceneGroup:insert(wall3)

--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar1 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
----physics.addBody( wall3sideways, "static", { friction=1.7 } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar2 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar3 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar4 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar5 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar6 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar7 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB, Yvar8 )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)



--break

Xreg2 = 557 / 1136
--Xperspective2 = Xreg2 * pixHeight
--XpersB2 = (309 / 640) * pixWidth

--Yconstant2 = 306 / 640
--Yperspective2 = Yconstant2 * pixWidth
    
--Xvar1B = (35 / 640) * pixWidth
--Xvar2B = (108 / 640) * pixWidth
--Xvar3B = (181 / 640) * pixWidth
--Xvar4B = (254 / 640) * pixWidth
--Xvar5B = (327 / 640) * pixWidth
--    
--Yvar1B = (62 / 1136) * pixHeight
--Yvar2B = (127 / 1136) * pixHeight
--Yvar3B = (192 / 1136) * pixHeight
--Yvar4B = (257 / 1136) * pixHeight
--Yvar5B = (322 / 1136) * pixHeight
--Yvar6B = (387 / 1136) * pixHeight
--Yvar7B = (452 / 1136) * pixHeight
--Yvar8B = (514 / 1136) * pixHeight
    
XpersB2 = display.contentWidth * .96   -- 1-.6

Yvar1B = display.contentHeight * .12
Yvar2B = display.contentHeight * .23
Yvar3B = display.contentHeight * .34
Yvar4B = display.contentHeight * .45
Yvar5B = display.contentHeight * .56
Yvar6B = display.contentHeight * .67
Yvar7B = display.contentHeight * .78
Yvar8B = display.contentHeight * .89
    
locationX1 = display.contentWidth * 1-.8
--Yperspective = display.contentHeight * .97
Yperspective = display.contentHeight * .975
Xvar1AB = display.contentWidth * .03
Xvar2AB = display.contentWidth * .20
Xvar3AB = display.contentWidth * .43
Xvar4AB = display.contentWidth * .66
Xvar5AB = display.contentWidth * .89
    
    
    
--local wall3 = display.newImage( "wall3.png", Xvar1AB, Yperspective ) -- regular X value is set at 557
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.6)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar2AB, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.6)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar3AB, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.6)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar4AB, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.6)
--sceneGroup:insert(wall3)
--
--local wall3 = display.newImage( "wall3.png", Xvar5AB, Yperspective )
--local nw, nh = wall3.width*conXdif*0.5, wall3.height*(conYdif)*0.5;
--physics.addBody( wall3, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
----physics.addBody( wall3, "static", { friction=1.7 } )
--wall3.isPlatform = true -- custom flag, used in drag function above
--    wall3:scale(conXdif, conYdif+.6)
--sceneGroup:insert(wall3)

--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar1B ) -- Y is usually set to 306
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
----physics.addBody( wall3sideways, "static", { friction=1.7 } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar2B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar3B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)

--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar4B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar5B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar6B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar7B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
--
--local wall3sideways = display.newImage( "wall3sideways.png", XpersB2, Yvar8B )
--local nw, nh = wall3sideways.width*conXdif*0.5, wall3sideways.height*(conYdif)*0.5;
--physics.addBody( wall3sideways, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall3sideways.isPlatform = true -- custom flag, used in drag function above
--    wall3sideways:scale(conXdif, conYdif)
--sceneGroup:insert(wall3sideways)
----wall end



----maze start
--    
--    YmazeDisp = (110 / 1136) * pixHeight
--    --XmazeDisp = ()
--    
--    --start of vertical maze images
--    XvertTemp1 = display.contentWidth * .14
--    XvertTemp2 = display.contentWidth * .255
--    XvertTemp3 = display.contentWidth * .37 
--    XvertTemp4 = display.contentWidth * .74 
--    XvertTemp5 = display.contentWidth * .85
--local wall32 = display.newImage( "wall32.png", XvertTemp1, display.contentHeight * .195 )
--local nw, nh = wall32.width*conXdif*0.5, wall32.height*(conYdif)*0.5;
--physics.addBody( wall32, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
----physics.addBody( wall32, "static", { friction=1.7 } )
--wall32.isPlatform = true -- custom flag, used in drag function above
--    wall32:scale(conXdif, conYdif)
--sceneGroup:insert(wall32)
--
--local wall32 = display.newImage( "wall32.png", XvertTemp2, display.contentHeight * .195 )
--local nw, nh = wall32.width*conXdif*0.5, wall32.height*(conYdif)*0.5;
--physics.addBody( wall32, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall32.isPlatform = true -- custom flag, used in drag function above
--    wall32:scale(conXdif, conYdif)
--sceneGroup:insert(wall32)
--
--local wall32 = display.newImage( "wall32.png", XvertTemp3, display.contentHeight * .195 )
--local nw, nh = wall32.width*conXdif*0.5, wall32.height*(conYdif)*0.5;
--physics.addBody( wall32, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall32.isPlatform = true -- custom flag, used in drag function above
--    wall32:scale(conXdif, conYdif)
--sceneGroup:insert(wall32)
----break
--local wall32 = display.newImage( "wall32.png", XvertTemp4, display.contentHeight * .195 )
--local nw, nh = wall32.width*conXdif*0.5, wall32.height*(conYdif)*0.5;
--physics.addBody( wall32, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall32.isPlatform = true -- custom flag, used in drag function above
--    wall32:scale(conXdif, conYdif)
--sceneGroup:insert(wall32)
--
--local wall32 = display.newImage( "wall32.png", XvertTemp5, display.contentHeight * .195 )
--local nw, nh = wall32.width*conXdif*0.5, wall32.height*(conYdif)*0.5;
--physics.addBody( wall32, "static", { friction=1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
--wall32.isPlatform = true -- custom flag, used in drag function above
--    wall32:scale(conXdif, conYdif)
--sceneGroup:insert(wall32)
--    --end of vertical maze images
--
----maze end














    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
--    local orangeCube = display.newImageRect("orangeCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    orangeCube.x = display.contentCenterX
--    orangeCube.y = display.contentHeight * .15
--    orangeCube.isVisible = false
--    -- split
--    local blueCube = display.newImageRect("blueCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    blueCube.x = display.contentCenterX
--    blueCube.y = display.contentHeight * .15
--    blueCube.isVisible = false
--    -- split
--    local darkerBlueCube = display.newImageRect("darkerBlueCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    darkerBlueCube.x = display.contentCenterX
--    darkerBlueCube.y = display.contentHeight * .15
--    darkerBlueCube.isVisible = false
--    -- split
--    local purpleCube = display.newImageRect("purpleCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    purpleCube.x = display.contentCenterX
--    purpleCube.y = display.contentHeight * .15
--    purpleCube.isVisible = false
--    -- split
--    local redCube = display.newImageRect("redCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    redCube.x = display.contentCenterX
--    redCube.y = display.contentHeight * .15
--    redCube.isVisible = false
--    -- split
--    local lightRedCube = display.newImageRect("lightRedCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    lightRedCube.x = display.contentCenterX
--    lightRedCube.y = display.contentHeight * .15
--    lightRedCube.isVisible = false
--    -- split
--    local pinkCube = display.newImageRect("pinkCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    pinkCube.x = display.contentCenterX
--    pinkCube.y = display.contentHeight * .15
--    pinkCube.isVisible = false
--    -- split
--    local greenCube = display.newImageRect("greenCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    greenCube.x = display.contentCenterX
--    greenCube.y = display.contentHeight * .15
--    greenCube.isVisible = false
--    -- split
--    local yellowCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    yellowCube.x = display.contentCenterX
--    yellowCube.y = display.contentHeight * .15
--    yellowCube.isVisible = false
--    -- split
--    
--    local blankCubeA = orangeCube
--    blankCubeA.isVisible = true
--    
--    
--    local fakeCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
--    yellowCube.x = display.contentCenterX
--    yellowCube.y = display.contentHeight * .15
--    yellowCube.isVisible = false
    
    
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
    
--    local transitionSizeX = function(i) -- to give the effect that the "coin" is spinning
--                --if (i-1) >= 1 then 
--            --while blankCube[i].width > -200.00 do
--            --for x = 1, 10, 1 do blankCube[x].width = blankCube[x].width - 1.00 end
--            --transition.to( blankCube[i-1], { time=5, width = blankCube[i-1].width - 1  } )  -- time : 2000
--                --end
--        print(i)
--            if blankCube[i].width > -200.00 then blankCube[i].width = blankCube[i].width - 10.00 end
--            if blankCube[i].width <= -200.00 then blankCube[i].width = blankCube[i].width + 10.00 end
--            --while blankCube[i].width <= -200.00 do 
--            --for x = 1, 10, 1 do blankCube[x].width = blankCube[x].width + 1.00 end
--            --transition.to( blankCube[i-1], { time=5, width = blankCube[i-1].width + 1  } )  -- time : 2000
--                --end
--            --end
--        end
    
    for i = 1 , 10, 1 do
        blankCube[i]:scale(.4 + (conXdifNew - 1), .4 + (conYdifNew - 1))
        blankCube[i].x = display.contentWidth * .72
        blankCube[i].y = display.contentHeight * .9
        --transitionSizeX(i)
    end
    --print( blankCube[1].xScale )
    
    --blankCube[2].isVisible = true
    blankCube[1].isVisible = true
    
    
--    local resetCubes = function()
--
--    
--        
--        end
    
    
    phaseNum = 1
    phaseVar = 1
    local count = 1
    function transitionCube (event)
    

        --for i = 1, 10, 1 do transitionSizeX(i) end

        blankCube[9].isVisible = false
        phaseVar = 1
        if phaseNum == 9 then phaseVar = -8 end
        transition.dissolve( blankCube[phaseNum], blankCube[phaseNum+phaseVar], 3000, 0 ) -- original delay : 200 
        phaseNum = phaseNum + 1
        if phaseNum == 9 then transition.dissolve( blankCube[9], blankCube[1], 3000, 0 )
            phaseNum = 1 end --print("hey") end --resetCubes() end --animeisOver = true end
            --end
        

    end

    
    local function spinImage (event)
        --transitionCube()
        --timer.performWithDelay( 2000, transitionCube )
        if composer.getSceneName("current") == "1" then
            --switchBlockColors()
        blankCube[1].isVisible = true
        transitionCube()
            end

        blankCube[10].isVisible = false
        transition.to( blankCube[10], { rotation = blankCube[10].rotation-360, time=2500, onComplete=spinImage } )
--            end
--        animeisOver = false
end
spinImage()
    
    
    
    
    
    
    
    
    
DarkenObjects = function()
    runningMan.fill.effect = "filter.brightness"
    runningMan.fill.effect.intensity = -0.3
    background2.fill.effect = "filter.brightness"
    background2.fill.effect.intensity = -0.3
    cloudArrangementA.fill.effect = "filter.brightness"
    cloudArrangementA.fill.effect.intensity = -0.3
    cloudArrangementAcopy.fill.effect = "filter.brightness"
    cloudArrangementAcopy.fill.effect.intensity = -0.3
    cloudArrangementB.fill.effect = "filter.brightness"
    cloudArrangementB.fill.effect.intensity = -0.3
    cloudArrangementBcopy.fill.effect = "filter.brightness"
    cloudArrangementBcopy.fill.effect.intensity = -0.3
    invertGravBlock.fill.effect = "filter.brightness"
    invertGravBlock.fill.effect.intensity = -0.3
    normalGravBlock.fill.effect = "filter.brightness"
    normalGravBlock.fill.effect.intensity = -0.3
        
        for i,x in pairs(sawBladeOn) do
    sawBladeOffCopy[i].fill.effect = "filter.brightness"
    sawBladeOffCopy[i].fill.effect.intensity = -0.3 
    sawBladeOff[i].fill.effect = "filter.brightness"
    sawBladeOff[i].fill.effect.intensity = -0.3 
    sawBladeOn[i].fill.effect = "filter.brightness"
    sawBladeOn[i].fill.effect.intensity = -0.3 
    sawBladeOnCopy[i].fill.effect = "filter.brightness"
    sawBladeOnCopy[i].fill.effect.intensity = -0.3 
            end
        
        for i,x in pairs(blankCube) do
    blankCube[i].fill.effect = "filter.brightness"
    blankCube[i].fill.effect.intensity = -0.3 
            end
        
        for i,x in pairs(bottomWall) do
    bottomWall[i].fill.effect = "filter.brightness"
    bottomWall[i].fill.effect.intensity = -0.3
            end
        for i,x in pairs(platformAA) do
    for z,v in pairs(platformAA[i]) do
    platformAA[i][z].fill.effect = "filter.brightness"
    platformAA[i][z].fill.effect.intensity = -0.3   
                end
            end
        for i,x in pairs(platformAB) do
    for z,v in pairs(platformAB[i]) do
    platformAB[i][z].fill.effect = "filter.brightness"
    platformAB[i][z].fill.effect.intensity = -0.3   
                end
            end
        end -- end of function DarkenObjects
    
    
    
NormalObjects = function()
    runningMan.fill.effect = "filter.brightness"
    runningMan.fill.effect.intensity = 0.0
    background2.fill.effect = "filter.brightness"
    background2.fill.effect.intensity = 0.0
    cloudArrangementA.fill.effect = "filter.brightness"
    cloudArrangementA.fill.effect.intensity = 0.0
    cloudArrangementAcopy.fill.effect = "filter.brightness"
    cloudArrangementAcopy.fill.effect.intensity = 0.0
    cloudArrangementB.fill.effect = "filter.brightness"
    cloudArrangementB.fill.effect.intensity = 0.0
    cloudArrangementBcopy.fill.effect = "filter.brightness"
    cloudArrangementBcopy.fill.effect.intensity = 0.0
    invertGravBlock.fill.effect = "filter.brightness"
    invertGravBlock.fill.effect.intensity = 0.0
    normalGravBlock.fill.effect = "filter.brightness"
    normalGravBlock.fill.effect.intensity = 0.0
        
        for i,x in pairs(sawBladeOn) do
    sawBladeOffCopy[i].fill.effect = "filter.brightness"
    sawBladeOffCopy[i].fill.effect.intensity = 0.0 
    sawBladeOff[i].fill.effect = "filter.brightness"
    sawBladeOff[i].fill.effect.intensity = 0.0 
    sawBladeOn[i].fill.effect = "filter.brightness"
    sawBladeOn[i].fill.effect.intensity = 0.0 
    sawBladeOnCopy[i].fill.effect = "filter.brightness"
    sawBladeOnCopy[i].fill.effect.intensity = 0.0 
            end
        
        for i,x in pairs(blankCube) do
    blankCube[i].fill.effect = "filter.brightness"
    blankCube[i].fill.effect.intensity = 0.0 
            end
        
        for i,x in pairs(bottomWall) do
    bottomWall[i].fill.effect = "filter.brightness"
    bottomWall[i].fill.effect.intensity = 0.0
            end
        for i,x in pairs(platformAA) do
    for z,v in pairs(platformAA[i]) do
    platformAA[i][z].fill.effect = "filter.brightness"
    platformAA[i][z].fill.effect.intensity = 0.0  
                end
            end
        for i,x in pairs(platformAB) do
    for z,v in pairs(platformAB[i]) do
    platformAB[i][z].fill.effect = "filter.brightness"
    platformAB[i][z].fill.effect.intensity = 0.0  
                end
            end
        end -- end of function NormalObjects





















--imageResizeRatioX = 640
--imageResizeRatioY = 1136
    
--door
    
--    percentageDoorX = 1
--    percentageDoorY = 1
--    ratioDoorXorig = (62 / imageResizeRatioX)
--    ratioDoorYorig = (62 / imageResizeRatioY)
--    ratioDoorX = (62 / pixWidth)
--    ratioDoorY = (62 / pixHeight)
    
    --if ratioDoorX > ratioDoorXorig then ratioDoorX = (ratioDoorX - ratioDoorXorig) end
    --ratioDoorX = (ratioDoorX - ratioDoorXorig)
    --split ifs
    --if ratioDoorY > ratioDoorYorig then ratioDoorY = (ratioDoorY - ratioDoorYorig) end
    --ratioDoorY = (ratioDoorY - ratioDoorYorig)
    
    
    
--local door = display.newImage( "opendoor.png", (display.contentWidth*.555), (display.contentHeight*.12) )
--    door:scale(pixXdif, pixYdif)
--sceneGroup:insert(door)
----physics module has been removed
--door.isPlatform = true -- custom flag, used in drag function above
--
--    --ratioBigMistX = (1279 / imageResizeRatioX)
--    --ratioBigMistY = (800 / imageResizeRatioY)
----local bigmist = display.newImage( "big mist.png", ((90/640)*pixWidth), ((194/1136)*pixHeight) )
--local bigmist = display.newImage( "big mist.png", (display.contentWidth*.5), (display.contentHeight*.5) )
--    bigmist:scale(pixXdif, pixYdif)
--sceneGroup:insert(bigmist)
--
--
--
--local crate = display.newImage( "crate.png", (display.contentWidth*.35), (display.contentHeight*.55) )
--physics.addBody( crate, "dynamic",{ density=3.0, friction=700, bounce=0.4 } )
--    crate:scale(pixXdif, pixYdif)
--sceneGroup:insert(crate)
--    --local function checkCrate() if crate.x==display.contentWidth*.18 then print("6") end end
--
--local ghost = display.newImage( "ghost-512.png", (display.contentWidth*.7), (display.contentHeight*.6) )
--physics.addBody( ghost, "kinematic", { friction=700 } )
--ghost.isPlatform = true -- custom flag again
--    ghost:scale(pixXdif, pixYdif)
--sceneGroup:insert(ghost)
    
--    physics.addBody( crate, "dynamic",{ density=3.0, friction=700, bounce=0.4 } )
--    physics.addBody( ghost, "kinematic", { friction=700 } )
--sceneGroup:insert(door)
--sceneGroup:insert(bigmist)
    --bigmist:toBack()
    background2:toBack()
--    background:toBack()
--sceneGroup:insert(crate)
    sceneGroup:insert(runningMan)
--sceneGroup:insert(ghost)


















--local block = display.newImage( "books_red.png", 240, 125 )
--physics.addBody( block, { density=1.0, bounce=1.0 } )
--block.isFixedRotation = true -- books blocks don't rotate, they just fall straight down

-- Add touch event listeners to objects
--wall:addEventListener( "touch", startDrag )
    
--ghost:addEventListener( "touch", startDrag )
    
--bigmist:addEventListener("touch", onSceneTouch)
    transSwipeDetect:addEventListener("touch", onSceneTouch)
--door:addEventListener("collision", winGame)
runningMan:addEventListener("collision", switchDirectionMan)
--runningMan:addEventListener("collision", canJump)
--cube:addEventListener( "touch", startDrag )
--crate:addEventListener( "touch", startDrag )
--block:addEventListener( "touch", startDrag )








--countdown timer start--



--
---- Keep track of time in seconds
--local secondsLeft = 1 * 60   -- x minutes * 60 seconds
--
--    clockTextrelocateX = (display.contentWidth*.24)
--    clockTextrelocateY = (display.contentHeight*.12)
--    
--local clockText = display.newText("01:00", clockTextrelocateX, clockTextrelocateY, native.systemFontBold, 20)
--clockText:setFillColor( 1, .8, .6 )
--    clockText:scale(conXdif, conYdif)
--sceneGroup:insert(clockText)
--
--local function updateTime()
--	-- decrement the number of seconds
--	secondsLeft = secondsLeft - 1
--	
--	-- time is tracked in seconds.  We need to convert it to minutes and seconds
--	local minutes = math.floor( secondsLeft / 60 )
--
--
--	local seconds = secondsLeft % 60
--	
--
--	-- make it a string using string format.  
--	local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
--	clockText.text = timeDisplay
--
--
--
----below i am testing to get the timer to end game once it hits 0
--        --print(secondsLeft)
--if (secondsLeft == 0) then
--
--            print("You Lose!")
----composer.removeScene( "game", false )
----        composer.gotoScene( "game", { effect = "crossFade", time = 222 } )        
--
--
--    end
--
--
--
--
--end
--
--
--
---- run them timer
--local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
--
----countdown timer end--



    
    
    
    
    
    
    
     local function characterDisperse()
			local starSpeed = 50
			local starTime = 450
            local yForceUp = true
            local xForceLeft = true
			local powerUpRandom = math.random
				timer.performWithDelay(10, function()
				local starDown = display.newRect(0,0,10,10)
				starDown:setFillColor(255,235,0)
				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
--				starDown:applyForce(2*(powerUpRandom(starSpeed*-1,starSpeed)),2*(powerUpRandom(starSpeed*-2,starSpeed*-.3)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)))
                
                local yForce = 0
                if yForceUp == true then yForce = 2*(powerUpRandom(starSpeed*-2,0))  yForceUp = false
                else yForce = 2*(powerUpRandom(0,starSpeed*2)) yForceUp = true end
                
                local xForce = 0
                if xForceLeft == true then xForce = 2*(powerUpRandom(starSpeed*-2,0))  xForceLeft = false
                else xForce = 2*(powerUpRandom(0,starSpeed*2)) xForceLeft = true end
                    
                starDown:applyForce( 2*(powerUpRandom(starSpeed*-1,starSpeed)), yForce, starDown.x*(powerUpRandom(1,10)), 0 )
				starDown:applyTorque(3*powerUpRandom(25,35))
                starDown.gravityScale = 0.00
				starDown.x = runningMan.x
				starDown.y = runningMan.y
				sceneGroup:insert(starDown)
				transition.to(starDown, {time=starTime, alpha=0.0})
				return starDown
			end, 10)
		end
    
    
    local function characterDisperseB()
        
        end



    --local gameOverImg = display.newImage("gameOver.png", display.contentWidth*.5, display.contentHeight*-.1)

    
    local dropGameOverImg = function()
local gameOverImg = display.newImage("gameOver.png", display.contentWidth*.5, display.contentHeight*-.1)
--local ImgBounce = display.newImageRect("bgless2.png", display.contentWidth, 1)
--        ImgBounce.x = display.contentWidth * .50
--        ImgBounce.y = display.contentHeight * .75
----        ImgBounce.y = display.contentHeight * 1.00
--        ImgBounce.alpha = 0.00
        
--        local lockSound = audio.loadStream( "lockMechSound.mp3" )
--        local lockSoundP1 = audio.loadStream( "lockMechSoundPartOne.mp3" )
--        local lockSoundP2 = audio.loadStream( "lockMechSoundPartTwo.mp3" )
        
local triggerUpLock = false
function touched()
    --local holdBool = ifHasCollided( gameOverImg, ImgBounce)
    --if( holdBool == false ) then
            
    if( gameOverImg.y < display.contentHeight*.60 and triggerUpLock == false) then
        gameOverImg.y = gameOverImg.y + 70 end
            
--            local lockSound = audio.loadStream( "lockMechSound.mp3" )
    if( gameOverImg.y >= display.contentHeight*.60) then 
                local lockSound = audio.loadStream( "lockMechSound.mp3" )
                triggerUpLock = true audio.play( lockSound ) end
            
    if( gameOverImg.y > display.contentHeight*.5 and triggerUpLock == true) then
        gameOverImg.y = gameOverImg.y - 50 end
                
        end
        
Runtime:addEventListener("enterFrame",touched)
        
        
        end
    
    
    
    
    
--    local cameraTexture = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
----shape.anchorX = display.contentWidth*.5
----shape.anchorY = display.contentHeight*.5
--cameraTexture.x = display.contentWidth*.5
--cameraTexture.y = display.contentHeight*.5
--cameraTexture.fill = { type="camera" }
--cameraTexture.fill.effect = "filter.sobel"
    
    
    
    
function GameOver()
        isPaused = true
--        gameOverImg.alpha = 1.0
--        dropGameOverImg()
        
        DarkenObjects()
        runningMan:pause()
        --physics.pause()
        canRunBool = false
        pauseBtn.isVisible = false
        resumeBtn.isVisible = false
        menuBtn.isVisible = false
        levelBtn.isVisible = false
        restartBtn.isVisible = false
        runningMan.alpha = 0.00
        runningMan.gravityScale = 0.00
        characterDisperse()
        
        timer.performWithDelay(1000, dropGameOverImg, 1 )
        end


--local BasicButtonSound = audio.loadStream( "BasicButtonSound.mp3" )
--local playBBSound = audio.play( BasicButtonSound )

    
    
    
    
    
    
    
    

--pause game
function pauseGame(event)
    --if end of touch event
    if(event.phase == "ended") then
--        local BasicButtonSound = audio.loadStream( "BasicButtonSound.mp3" )
--        audio.play( BasicButtonSound )
            
            
        --pause the physics
        isPaused = true
            DarkenObjects()
        runningMan:pause()
        physics.pause()
        canRunBool = false
        --timer.pause(countDownTimer)
        --make pause button invisible
        pauseBtn.isVisible = false
        --make resume button visible
        resumeBtn.isVisible = true

        menuBtn.isVisible = true
        levelBtn.isVisible = true
        restartBtn.isVisible = true


        -- indicates successful touch
        return true
    end
end
 
--resume game
function resumeGame(event)
    --if end of touch event
    if(event.phase == "ended") then
        local BasicButtonSound = audio.loadStream( "BasicButtonSound.mp3" )
        audio.play( BasicButtonSound )
        --resume physics
        isPaused = false
            NormalObjects()
        runningMan:play()
        physics.start()
        canRunBool = true
        --timer.resume(countDownTimer)
        --make pause button visible
        pauseBtn.isVisible = true
        --make resume button invisible
        resumeBtn.isVisible = false

         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false


        -- indicates successful touch
        return true
    end
end





















--pause button start------------------------------





  --define button dimensions
     btnW, btnH = 305, 15
     btnW2, btnH2 = 90, 194
     
    --create pause button
    pausebtnXval = (display.contentWidth*.952)
    pausebtnYval = (display.contentHeight*.032)
      pauseBtn = display.newImage( "pausebutton.png", pausebtnXval, pausebtnYval )
    pauseBtn:scale(conXdif, conYdif)
sceneGroup:insert(pauseBtn)
    
     
    --add event
     pauseBtn:addEventListener( "touch", pauseGame ) 
    
     
    --create resume button
    playbtnXval = (display.contentWidth*.952)
    playbtnYval = (display.contentHeight*.032)
     resumeBtn = display.newImage( "playbutton2.png", playbtnXval, playbtnYval )
    resumeBtn:scale(conXdif, conYdif)
sceneGroup:insert(resumeBtn)

    
    btnXval = (display.contentWidth*.5)
    btnYval1 = (display.contentHeight*.39)
    btnYval2 = (display.contentHeight*.5)
    btnYval3 = (display.contentHeight*.61)
     --create menubutton
     menuBtn = display.newImage( "menubutton.png", btnXval, btnYval1 )
    menuBtn:scale(conXdif, conYdif)
     --create levelselectbutton
     levelBtn = display.newImage( "levelselectbutton.png", btnXval, btnYval2 )
    levelBtn:scale(conXdif, conYdif)
     --create restartbutton
     restartBtn = display.newImage( "restartbutton.png", btnXval, btnYval3)
    restartBtn:scale(conXdif, conYdif)
    
    --and hide it
    resumeBtn.isVisible = false

    menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
     
    --add event
    resumeBtn:addEventListener( "touch", resumeGame ) 
    

     menuBtn:addEventListener( "touch", loadmenu ) 
    
     levelBtn:addEventListener( "touch", loadlevelselect ) 
    
     restartBtn:addEventListener( "touch", restart ) 
    




end



--crate:addEventListener( "outBounds", rePosition )


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )






--pause button end --------------------------------------------



--local function sound ()
--    if ball.y > 500 then
--        audio.play(win)
--    end
--end
--Runtime:addEventListener("enterFrame", sound )















--buttonsend


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

return scene 

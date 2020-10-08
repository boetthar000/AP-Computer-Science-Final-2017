display.setStatusBar(display.HiddenStatusBar)

local composer = require( "composer" )
local scene = composer.newScene()
local conf = require("config")
local widget = require( "widget" )
local utility = require( "utility" )
local myData = require( "mydata" )
local json = require("json")
local loadsave = require( "loadsave" )  
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
    pixXdif = pixWidth / 640
    pixYdif = pixHeight / 1136
conXdif = conWidth / origXwid
conYdif = conHeight / origYhei
conXdifNew = conWidth / origXwidIphoneSixPlus
conYdifNew = conHeight / origYheiIphoneSixPlus
runManScaleX = (conXdifNew + (.0923)) + .5
runManScaleY = (conYdifNew + (-.04)) + .5
local isPaused = false
local gravUp = false
local isInverted = false
local actualMoveUp = false
local actualMoveDown = false
local hasLanded = false
local transSwipeDetect = display.newImageRect ("bgpink.png", display.contentWidth, display.contentHeight)
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
            
            runningMan.xScale = runManScaleX
            manMoveAmt = math.abs(manMoveAmtB)
            runningMan:play()
end
if event.xStart > event.x and (event.xStart - event.x) >= 100 and isPaused == false then
        
        runningMan.xScale = -(runManScaleX)
            manMoveAmt = -(math.abs(manMoveAmtB))
            runningMan:play()
end
if event.yStart < event.y and (event.y - event.yStart) >= 100 and isPaused == false then
            
            
            
            
            
            
            
            
        
            
            
            if hasLanded == false and isPaused == false and isInverted == false then
                local runningManOrigY = runningMan.y
                physics.setGravity(0,88.0) 
            end
            
            if hasLanded == true and isPaused == false and isInverted == true then
                local runningManOrigY = runningMan.y
                for i = 0 , 160, 1 do
                runningMan.y = runningManOrigY + i
                end 
            end
            
            
            
end
if event.yStart > event.y and (event.yStart - event.y) >= 100 then
        
            
            
            if hasLanded == true and isPaused == false and isInverted == false then
                local runningManOrigY = runningMan.y
                for i = 0 , 160, 1 do
                runningMan.y = runningManOrigY - i
                end 
            end
            
            hasLanded = false
            groundTriggered = false
            
end
        
end
end
local invertGravBlock = display.newImage("redCube.png", display.contentWidth * .50, display.contentHeight * .92)
invertGravBlock:scale(.07, .07)
invertGravBlock.id = "invertGravBlock"
local normalGravBlock = display.newImage("blueCube.png", display.contentWidth * .15, display.contentHeight * .88)
normalGravBlock:scale(.07, .07)
normalGravBlock.id = "normalGravBlock"
local transXBool = true
local transXBoolOP = false
local allTrue = {}
local transitionSizeX = function(i) 
               
        
        
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
    
    
    
local background2 = display.newImage( "backgroundSky.png", display.contentWidth*.5, display.contentHeight*.5, true )
background2.height = display.contentHeight
background2.width = display.contentWidth * 3
    
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
local sawBlade = {}
local goRight = {}
local goFartherRight = {}
local goFartherLeft = {}
local RightCheck = {}
local sawBladeOn = {}
local sawBladeOnCopy = {}
local sawBladeOff = {}
local sawBladeOffCopy = {}
 
    
local moveBackground = function()
    
    
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
local bladeCount = 0
local moveBlade = {}
local generateBlade = function(xLoc, yLoc, xChangeA, xChangeB, moveLength, reverseAll)
    bladeCount = bladeCount + 1
    
    
    
    sawBlade[bladeCount] = display.newGroup()
    goRight[bladeCount] = true
    goFartherRight[bladeCount] = false
    goFartherLeft[bladeCount] = false
    RightCheck[bladeCount] = false
    
    sawBladeOffCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOffinverted.png", 0, 0)
    sawBladeOffCopy[bladeCount]:scale(.35,.35)
    sawBladeOffCopy[bladeCount].alpha = 0.00
    
    
    sawBladeOff[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOff.png", 0, 0)
    sawBladeOff[bladeCount]:scale(.35,.35)
    sawBladeOff[bladeCount].alpha = 0.00
    
    
    sawBladeOn[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOn.png", 0, 0)
    sawBladeOn[bladeCount]:scale(.35,.35)
    sawBladeOn[bladeCount].alpha = 1.00
    
    
    sawBladeOnCopy[bladeCount] = display.newImage( sawBlade[bladeCount],"sawBladeOninverted.png", 0, 0)
    sawBladeOnCopy[bladeCount]:scale(.35,.35)
    sawBladeOnCopy[bladeCount].alpha = 0.00
    
    
    sawBlade[bladeCount].x = xLoc
    sawBlade[bladeCount].y = yLoc
    
moveBlade[bladeCount] = function(bladeCountB)
    if isPaused == false and composer.getSceneName("current") == "2" then
        
            
            
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
            
            
            
            
            
        
            
            
            
            
        
        
            
            
            
        
        local holdVar = (xLoc + (200 * reverseVar))
            
            
        if sawBlade[bladeCountB].x == holdVar and goRight[bladeCountB] == true
            then 
            goRight[bladeCountB] = false
            goFartherRight[bladeCountB] = true
            goFartherLeft[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 1.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
            
        
        holdVar = xLoc - 0
         if sawBlade[bladeCountB].x == holdVar and goRight[bladeCountB] == false
            then
            goRight[bladeCountB] = true
            goFartherRight[bladeCountB] = false
            goFartherLeft[bladeCountB] = true
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 1.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
        
        holdVar = (xLoc + (240 * reverseVar))
            
        if sawBlade[bladeCountB].x >= holdVar 
        then 
            RightCheck[bladeCountB] = true
            goFartherRight[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 0.00
            sawBladeOnCopy[bladeCountB].alpha = 1.00
        end
            
            holdVar = (xLoc - (40 * reverseVar))
            if sawBlade[bladeCountB].x <= holdVar 
        then
            RightCheck[bladeCountB] = true
            goFartherLeft[bladeCountB] = false
            sawBladeOffCopy[bladeCountB].alpha = 0.00
            sawBladeOff[bladeCountB].alpha = 0.00
            sawBladeOn[bladeCountB].alpha = 1.00
            sawBladeOnCopy[bladeCountB].alpha = 0.00
        end
            
        
        
        
            
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
    
    
    
end 
local moveBlades = function()
    for i,x in pairs(moveBlade) do moveBlade[i](i) end
    end
Runtime:addEventListener("enterFrame", moveBlades)
generateBlade( display.contentWidth*.55, display.contentHeight*.35, 1, 2, .40, false)
generateBlade( display.contentWidth*.75, display.contentHeight*.55, 1, 2, .40, true)
generateBlade( display.contentWidth*.25, display.contentHeight*.77, 1, 2, .40, false)
local options =
{
    
    width = 65,
    height = 75,
    numFrames = 10,
     
    sheetContentWidth = 650,  
    sheetContentHeight = 77   
}
local imageSheet = graphics.newImageSheet( "spritesheetC.png", options )
local sequenceData =
{
    name="runningMan",
    start=1,
    count=10,
    
    
    time=1700,
    loopCount = 0,   
    loopDirection = "forward"    
}
 
runningMan = display.newSprite( imageSheet, sequenceData )
local canRunBool = true
runningMan.x = display.contentWidth * .15
runningMan.y = display.contentHeight * .1
runningMan:scale(runManScaleX,runManScaleY)
runningMan:play()
runningManlocationX = (display.contentCenterX)
runningManlocationY = (display.contentCenterY)
manMoveAmt = 25.00
manMoveAmtB = 25.00
local updateManMovement = function()
    runningMan.x = runningMan.x + manMoveAmt
    runningMan.rotation = 0.00
    
    end
local gameLoopA = function()
        if composer.getSceneName("current") == "2" then
        
    
        
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
    
    runningMan.rotation = 0
    for i = 1, 10, 1 do transitionSizeX(i) end
    timer.performWithDelay( 125, gameLoopA)
end
 
    
    
    gameInitA()
local switchToLeft = false
local switchToRight = false
local directionBool = true 
local function switchDirectionMan( event )
	
    
    if switchToLeft == true then runningMan.xScale = -(runManScaleX) manMoveAmt = -(math.abs(manMoveAmt)) switchToLeft = false end
    
    if switchToRight == true then runningMan.xScale = runManScaleX manMoveAmt = math.abs(manMoveAmt) switchToRight = false end
    
    
    end
currentLev = myData.settings.currentLevel
myData.activeScenes[currentLev] = true
local function loadmenu( event )
    if ( "ended" == event.phase ) then 
        
        
        composer.gotoScene( "game", { effect = "crossFade", time = 333 } )
        
        
        
        pauseBtn.isVisible = false
        resumeBtn.isVisible = false
         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end
local function loadlevelselect( event )
    if ( "ended" == event.phase ) then
        
        composer.gotoScene( "levelselect", { effect = "crossFade", time = 333 } )
        
        
        pauseBtn.isVisible = false
        resumeBtn.isVisible = false
         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end
local function restart( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "2", false )
        composer.gotoScene( "2", { effect = "crossFade", time = 333 } )
        
        
        menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
    end
end
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
local physics = require("physics")
physics.start()
physics.setPositionIterations(32)
physics.setGravity(0, 8.8)
CratefinalRadius = ((conXdif+conYdif)/2) * 20
local nw, nh = runningMan.width*conXdif*0.2, runningMan.height*(conYdif)*0.2;
physics.addBody(runningMan, "dynamic", { friction = 1.7, shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} } )
runningMan.id = "runningMan"
runningMan.isFixedRotation = true
local function startDrag( event )
	local t = event.target
    
    
    
    
	local phase = event.phase
	if "began" == phase then
        
		display.getCurrentStage():setFocus( t )
		t.isFocus = true
		
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
		
		
		event.target.bodyType = "kinematic"
        
		
		event.target:setLinearVelocity( 0, 0 )
		event.target.angularVelocity = 0
	elseif t.isFocus then
		if "moved" == phase then
            
			t.x = event.x - t.x0
			t.y = event.y - t.y0
		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
			
			
			if ( not event.target.isPlatform ) then
				event.target.bodyType = "dynamic"
			end
		end
	end
	
	return true
end
local function winGame( event )
	local t = event.target
    print("You Win!")
    
    
    end 
function scene:create( event )
    local sceneGroup = self.view
    params = event.params
        
    
    
    
    
sceneGroup:insert(transSwipeDetect)
    
for k,v in pairs(sawBlade) do    
sceneGroup:insert(sawBlade[k])
        end
sceneGroup:insert(invertGravBlock)
sceneGroup:insert(normalGravBlock)
    
    
    
    
    
    
sceneGroup:insert(background2)
sceneGroup:insert(cloudArrangementB)
sceneGroup:insert(cloudArrangementBcopy)
sceneGroup:insert(cloudArrangementA)
sceneGroup:insert(cloudArrangementAcopy) 
    
    
    
    
Xreg = 14 / 1136
    
    
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
Yperspective = display.contentHeight * .03
Xvar1B = display.contentWidth * -.03
Xvar2B = display.contentWidth * .20
Xvar3B = display.contentWidth * .43
Xvar4B = display.contentWidth * .66
Xvar5B = display.contentWidth * .89
    
    
    
    
    
    
    
    
    
    
    local orangeCube = display.newImageRect("orangeCube.png", 200 * conXdifNew, 200 * conYdifNew)
    orangeCube.x = display.contentCenterX
    orangeCube.y = display.contentHeight * .15
    orangeCube.isVisible = false
    
    local blueCube = display.newImageRect("blueCube.png", 200 * conXdifNew, 200 * conYdifNew)
    blueCube.x = display.contentCenterX
    blueCube.y = display.contentHeight * .15
    blueCube.isVisible = false
    
    local darkerBlueCube = display.newImageRect("darkerBlueCube.png", 200 * conXdifNew, 200 * conYdifNew)
    darkerBlueCube.x = display.contentCenterX
    darkerBlueCube.y = display.contentHeight * .15
    darkerBlueCube.isVisible = false
    
    local purpleCube = display.newImageRect("purpleCube.png", 200 * conXdifNew, 200 * conYdifNew)
    purpleCube.x = display.contentCenterX
    purpleCube.y = display.contentHeight * .15
    purpleCube.isVisible = false
    
    local redCube = display.newImageRect("redCube.png", 200 * conXdifNew, 200 * conYdifNew)
    redCube.x = display.contentCenterX
    redCube.y = display.contentHeight * .15
    redCube.isVisible = false
    
    local lightRedCube = display.newImageRect("lightRedCube.png", 200 * conXdifNew, 200 * conYdifNew)
    lightRedCube.x = display.contentCenterX
    lightRedCube.y = display.contentHeight * .15
    lightRedCube.isVisible = false
    
    local pinkCube = display.newImageRect("pinkCube.png", 200 * conXdifNew, 200 * conYdifNew)
    pinkCube.x = display.contentCenterX
    pinkCube.y = display.contentHeight * .15
    pinkCube.isVisible = false
    
    local greenCube = display.newImageRect("greenCube.png", 200 * conXdifNew, 200 * conYdifNew)
    greenCube.x = display.contentCenterX
    greenCube.y = display.contentHeight * .15
    greenCube.isVisible = false
    
    local yellowCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
    yellowCube.x = display.contentCenterX
    yellowCube.y = display.contentHeight * .15
    yellowCube.isVisible = false
    
    
    local blankCubeA = orangeCube
    blankCubeA.isVisible = true
    
    
    local fakeCube = display.newImageRect("yellowCube.png", 200 * conXdifNew, 200 * conYdifNew)
    yellowCube.x = display.contentCenterX
    yellowCube.y = display.contentHeight * .15
    yellowCube.isVisible = false
    
    
    local allPlatformCubes = {} 
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
    
    local sizeOfOrigImage = 15 
    local AmtofVertBlocks = (display.contentHeight / (sizeOfOrigImage * conYdif))
    local scalingFactorY = (AmtofVertBlocks / math.floor(AmtofVertBlocks))
    local newPixSizeY = ((scalingFactorY) * (sizeOfOrigImage * conYdif))
    local AmtofHorizBlocks = ((display.contentWidth) / (sizeOfOrigImage * conXdif)) - 0
    local AVBnew = display.contentHeight / ( (scalingFactorY) * (sizeOfOrigImage * conYdif) )
    local scalingFactorX = (AmtofHorizBlocks / math.floor(AmtofHorizBlocks))
    local AHBnew = display.contentWidth / ( (scalingFactorX) * (sizeOfOrigImage * conXdif) )
    local newPixSizeX = ((scalingFactorX) * (sizeOfOrigImage * conXdif))
    local platformPadding = 200
    local currentPaddingAdd = 0
    
    
    
    
    local colorOption = {}
    
    
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
    
    for i = 1, AVBnew, 1 do 
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    leftWall[i] = display.newImage(leftWallGroup, colorOption[colorCount], -(newPixSizeX/2), (newPixSizeY/2) + pixYadd )
    
    physics.addBody( leftWall[i],"static", {friction = 1.7 } )
    leftWall[i].isPlatform = true
    leftWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(leftWall[i])
    pixYadd = pixYadd + newPixSizeY
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
      if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end 
            end 
        
    end
    
    
    local bottomWallGroup = display.newGroup()
    local bottomWall = {}
    
    local pixXadd = 0
    
    for i = 1, AHBnew - 0, 1 do 
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    tempHeiLoc = (display.contentHeight - (newPixSizeY/2))
    bottomWall[i] = display.newImage(bottomWallGroup, colorOption[colorCount], (newPixSizeX/2) + pixXadd, tempHeiLoc + newPixSizeY - 10 )
    
    physics.addBody( bottomWall[i],"static", {friction = 1.7 } )
        bottomWall[i].id = "Ablock"
    bottomWall[i].isPlatform = true
    bottomWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(bottomWall[i])
    pixXadd = pixXadd + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end 
            end 
    end
    
    
    
    
    local rightWallGroup = display.newGroup()
    local rightWall = {}
    
    local pixYadd = 0
    
    for i = 1, AVBnew, 1 do 
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    tempWidLoc = (display.contentWidth - (newPixSizeX/2))
    tempHeiLoc = (display.contentHeight - (newPixSizeY/2))
    rightWall[i] = display.newImage(rightWallGroup, colorOption[colorCount], tempWidLoc + (newPixSizeX), tempHeiLoc - pixYadd )
    
    physics.addBody( rightWall[i],"static", {friction = 1.7 } )
    rightWall[i].isPlatform = true
    rightWall[i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(rightWall[i])
    pixYadd = pixYadd + newPixSizeY
    if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
      if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end 
            end 
        
    end
    
    
    
    local topWallGroup = display.newGroup()
    local topWall = {}
    
    local pixXadd = 0
    
    for i = 1, AHBnew - 0, 1 do 
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
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
            if cCvar == true then cCvar = false end 
            end 
        
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
local function mainGroundTrigger( event )
        
        
    if ( event.phase == "began" ) then          
        
        if((event.object1.id=="runningMan" and event.object2.id=="Ablock") 
        or (event.object1.id=="Ablock" and event.object2.id=="runningMan")) 
            then
        
        doubleSwipeUp = 0 doubleSwipeDown = 0
                hasLanded = true
                actualMoveUp = false
                actualMoveDown = false
                
            end
            
        end
        if ( event.phase == "ended" ) and (actualMoveUp == true) and 
        ( (event.object1.id=="runningMan" and event.object2.id=="Ablock") or
        (event.object1.id=="Ablock" and event.object2.id=="runningMan") ) then
            hasLanded = false
            end
    end 
Runtime:addEventListener("collision",mainGroundTrigger)
    
    
    
    
    
    
        local platformAAColorlocations = {} 
        local platformAAXlocations = {}
        local platformAAYlocations = {}
    
        local platformABColorlocations = {} 
        local platformABXlocations = {}
        local platformABYlocations = {}
        local changeVar = 0
    
    
    local amtAAarrays = 0
    local platformAA = {}
    local amtABarrays = 0
    local platformAB = {}
        local platformAAGroup = display.newGroup()
        local platformABGroup = display.newGroup()
    
        local generatePlatform = function(randomVarA,randomVarB,nextYlocation) 
        
   
        
        local totalAAblocks = 0
        
        amtAAarrays = amtAAarrays + 1
    platformAA[amtAAarrays] = {}
    local platformAtotalBlocks = (AHBnew - 0)
    
    local pixXadd = 0 + 0
    for i = 1, (platformAtotalBlocks - randomVarA), 1 do
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    
    tempHeiLoc = (0 + (newPixSizeY/2)) + nextYlocation
            if colorCount+changeVar >= 19 then changeVar = 0 end
    platformAA[amtAAarrays][i] = display.newImage(platformAAGroup, colorOption[colorCount+changeVar], (newPixSizeX/2) + pixXadd, tempHeiLoc )
            
    platformAAColorlocations[i] = colorCount
    platformAAXlocations[i] = (newPixSizeX/2) + pixXadd
    platformAAYlocations[i] = tempHeiLoc
    totalAAblocks = totalAAblocks + 1
            
            physics.addBody( platformAA[amtAAarrays][i],"static", {friction = 1.7 } )
            platformAA[amtAAarrays][i].id = "Ablock"
    
    
    platformAA[amtAAarrays][i].isPlatform = true
    platformAA[amtAAarrays][i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(platformAA[amtAAarrays][i])
    pixXadd = pixXadd + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end 
            end 
    end
        
        
        local totalABblocks = 0
        
        
    amtABarrays = amtABarrays + 1
    platformAB[amtABarrays] = {}
    
    
    local pixXaddSideB = pixXadd + (newPixSizeX * randomVarB)
    for i = 1, (platformAtotalBlocks - (platformAtotalBlocks - randomVarA)) - randomVarB, 1 do
    if cCvar == true then colorCount = colorCount + 1 else colorCount = colorCount - 1 end
    
    tempHeiLoc = (0 + (newPixSizeY/2)) + nextYlocation
                if colorCount+changeVar >= 19 then changeVar = 0 end
    platformAB[amtABarrays][i] = display.newImage(platformABGroup, colorOption[colorCount+changeVar], (newPixSizeX/2) + pixXaddSideB, tempHeiLoc )
            
    platformABColorlocations[i] = colorCount
    platformABXlocations[i] = (newPixSizeX/2) + pixXaddSideB
    platformABYlocations[i] = tempHeiLoc
    totalABblocks = totalABblocks + 1
            
            
            physics.addBody( platformAB[amtABarrays][i],"static", {friction = 1.7 } )
            platformAB[amtABarrays][i].id = "Ablock"
    
    
            
            
    platformAB[amtABarrays][i].isPlatform = true
    platformAB[amtABarrays][i]:scale(conXdif*scalingFactorX,conYdif*scalingFactorY)
    sceneGroup:insert(platformAB[amtABarrays][i])
    pixXaddSideB = pixXaddSideB + newPixSizeX
        if (colorCount == 1) and (cCvar == false) then colorCount = colorCount + 4 cCvar = true end 
    if colorCount == 18 then colorCount = colorCount - 1 
            if cCvar == true then cCvar = false end 
            end 
    end
        
        end 
    
    
    
    generatePlatform(9,4,325)
    generatePlatform((AHBnew - 2),4,725)
    generatePlatform(9,4,1125)
    generatePlatform(4,(AHBnew - 2),1525)
    
    
    
    
    
    
    
    
    
    
    
    
    
       local function ifHasCollided( obj1, obj2) 
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
    if composer.getSceneName("current") == "2" and isPaused == false then
            
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
                
                GameOver()
                DarkenObjects()
                end
            end
            
        
            end
        end
    Runtime:addEventListener("enterFrame",checkCollision)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   local function blocksEffectSpawner(aVar, bVar, cVar, dVar)
			local starSpeed = 50
			local starTime = 12000
			local powerUpRandom = math.random
				timer.performWithDelay(500, function()
                 if composer.getSceneName("current") == "2" and isPaused == false then
				local starDown = display.newRect(0,0,10,10)
				starDown:setFillColor(0,0,0)
				physics.addBody( starDown, "dynamic",{ density = 3.0, isSensor=true } )
                    
				starDown:applyForce( 7 *(powerUpRandom(starSpeed*-1,-25)),2*(powerUpRandom(cVar,dVar)), starDown.x*(powerUpRandom(1,10)), starDown.y*(powerUpRandom(1,10)) )
                starDown.alpha = .10
				starDown:applyTorque(3*powerUpRandom(25,35))
				starDown.x = display.contentWidth * aVar 
				starDown.y = display.contentHeight * bVar 
                    starDown.gravityScale = 0.00
                    
                    
				sceneGroup:insert(starDown)
                transition.to(starDown, {time=starTime})
				return starDown
                    end
			end, 0) 
		end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
Xreg2 = 557 / 1136
    
    
XpersB2 = display.contentWidth * .96   
Yvar1B = display.contentHeight * .12
Yvar2B = display.contentHeight * .23
Yvar3B = display.contentHeight * .34
Yvar4B = display.contentHeight * .45
Yvar5B = display.contentHeight * .56
Yvar6B = display.contentHeight * .67
Yvar7B = display.contentHeight * .78
Yvar8B = display.contentHeight * .89
    
locationX1 = display.contentWidth * 1-.8
Yperspective = display.contentHeight * .975
Xvar1AB = display.contentWidth * .03
Xvar2AB = display.contentWidth * .20
Xvar3AB = display.contentWidth * .43
Xvar4AB = display.contentWidth * .66
Xvar5AB = display.contentWidth * .89
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        blankCube[10] = fakeCube 
    
    
    for i = 1 , 10, 1 do
        blankCube[i]:scale(.4 + (conXdifNew - 1), .4 + (conYdifNew - 1))
        blankCube[i].x = display.contentWidth * .72
        blankCube[i].y = display.contentHeight * .9
        
    end
    
    
    
    blankCube[1].isVisible = true
    
    
    
    
    phaseNum = 1
    phaseVar = 1
    local count = 1
    function transitionCube (event)
    
        
        blankCube[9].isVisible = false
        phaseVar = 1
        if phaseNum == 9 then phaseVar = -8 end
        transition.dissolve( blankCube[phaseNum], blankCube[phaseNum+phaseVar], 3000, 0 ) 
        phaseNum = phaseNum + 1
        if phaseNum == 9 then transition.dissolve( blankCube[9], blankCube[1], 3000, 0 )
            phaseNum = 1 end 
            
        
    end
    
    local function spinImage (event)
        
        
        if composer.getSceneName("current") == "2" then
            
        blankCube[1].isVisible = true
        transitionCube()
            end
        blankCube[10].isVisible = false
        transition.to( blankCube[10], { rotation = blankCube[10].rotation-360, time=2500, onComplete=spinImage } )
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
        end 
    
    
    
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
        end 
    
    
    
    
    
    
    
    
    
    
    
    
    
    background2:toBack()
    sceneGroup:insert(runningMan)
    
    
    transSwipeDetect:addEventListener("touch", onSceneTouch)
runningMan:addEventListener("collision", switchDirectionMan)
    
    
    
    
    
    
    
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
    
    
    local dropGameOverImg = function()
local gameOverImg = display.newImage("gameOver.png", display.contentWidth*.5, display.contentHeight*-.1)
        
        
local triggerUpLock = false
function touched()
    
    
            
            
    if( gameOverImg.y < display.contentHeight*.60 and triggerUpLock == false) then
        gameOverImg.y = gameOverImg.y + 70 end
            
    if( gameOverImg.y >= display.contentHeight*.60) then 
                local lockSound = audio.loadStream( "lockMechSound.mp3" )
                triggerUpLock = true audio.play( lockSound ) end
            
    if( gameOverImg.y > display.contentHeight*.5 and triggerUpLock == true) then
        gameOverImg.y = gameOverImg.y - 50 end
                
        end
        
Runtime:addEventListener("enterFrame",touched)
        
        
        end
    
    
    
    
    
    
    
    
    
function GameOver()
        isPaused = true
        
        
        
        DarkenObjects()
        runningMan:pause()
        
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
function pauseGame(event)
    
    if(event.phase == "ended") then
        
            
            
        
        isPaused = true
            DarkenObjects()
        runningMan:pause()
        physics.pause()
        canRunBool = false
        
        
        pauseBtn.isVisible = false
        
        resumeBtn.isVisible = true
        menuBtn.isVisible = true
        levelBtn.isVisible = true
        restartBtn.isVisible = true
        
        return true
    end
end
 
function resumeGame(event)
    
    if(event.phase == "ended") then
        local BasicButtonSound = audio.loadStream( "BasicButtonSound.mp3" )
        audio.play( BasicButtonSound )
        
        isPaused = false
            NormalObjects()
        runningMan:play()
        physics.start()
        canRunBool = true
        
        
        pauseBtn.isVisible = true
        
        resumeBtn.isVisible = false
         menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
        
        return true
    end
end
  
     btnW, btnH = 305, 15
     btnW2, btnH2 = 90, 194
     
    
    pausebtnXval = (display.contentWidth*.952)
    pausebtnYval = (display.contentHeight*.032)
      pauseBtn = display.newImage( "pausebutton.png", pausebtnXval, pausebtnYval )
    pauseBtn:scale(conXdif, conYdif)
sceneGroup:insert(pauseBtn)
    
     
    
     pauseBtn:addEventListener( "touch", pauseGame ) 
    
     
    
    playbtnXval = (display.contentWidth*.952)
    playbtnYval = (display.contentHeight*.032)
     resumeBtn = display.newImage( "playbutton2.png", playbtnXval, playbtnYval )
    resumeBtn:scale(conXdif, conYdif)
sceneGroup:insert(resumeBtn)
    
    btnXval = (display.contentWidth*.5)
    btnYval1 = (display.contentHeight*.39)
    btnYval2 = (display.contentHeight*.5)
    btnYval3 = (display.contentHeight*.61)
     
     menuBtn = display.newImage( "menubutton.png", btnXval, btnYval1 )
    menuBtn:scale(conXdif, conYdif)
     
     levelBtn = display.newImage( "levelselectbutton.png", btnXval, btnYval2 )
    levelBtn:scale(conXdif, conYdif)
     
     restartBtn = display.newImage( "restartbutton.png", btnXval, btnYval3)
    restartBtn:scale(conXdif, conYdif)
    
    
    resumeBtn.isVisible = false
    menuBtn.isVisible = false
    levelBtn.isVisible = false
    restartBtn.isVisible = false
     
    
    resumeBtn:addEventListener( "touch", resumeGame ) 
    
     menuBtn:addEventListener( "touch", loadmenu ) 
    
     levelBtn:addEventListener( "touch", loadlevelselect ) 
    
     restartBtn:addEventListener( "touch", restart ) 
    
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene 


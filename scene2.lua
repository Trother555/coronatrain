
local composer = require( "composer" )
local physics = require("physics")
physics.start()
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local particleSystem
local platform
local textVanya
local hourglass

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    particleSystem = physics.newParticleSystem(
    {
        filename = "./scene2/particle.png",
        radius = 2,
        imageRadius = 4
    })
    
    platform = display.newRect(sceneGroup, display.contentCenterX,
            display.contentCenterY, 200, 100 )
    platform:setFillColor(0,0,1)
    physics.addBody( platform, "static" )
    textVanya = display.newText(sceneGroup, "Vanya", display.contentCenterX,
            display.contentCenterY, "Wilhelm Klingspor Gotisch.ttf", 100)
    local hgHeight = 100
    local hgWidth = 60
    local hgStep = 10
    local hgOffsetX = 150
    local hgOffsetY = 100

    --[[for k in pairs(hourglassVerices) do
        if k%2 ~= 0 then
            hourglassVerices[k] = hourglassVerices[k] + hgOffsetX
        else
            hourglassVerices[k] = hourglassVerices[k] + hgOffsetY
        end
    end]]
    hourglass = display.newRect(sceneGroup, 150, 100, hgWidth, hgHeight)
    local hgTop = {
        -hgWidth/2, hgHeight/2,
        -hgWidth/2, hgHeight/2 - hgStep,
        hgWidth/2, hgHeight/2 - hgStep,
        hgWidth/2, hgHeight/2
    }
    local hgBot = {
        -hgWidth/2, -hgHeight/2,
        -hgWidth/2, -hgHeight/2 + hgStep,
        hgWidth/2, -hgHeight/2 + hgStep,
        hgWidth/2, -hgHeight/2
    }
    local hgLeftUp = {
        -hgWidth/2, hgHeight/2 - hgStep,
        -2*hgStep, 0,
        -hgStep/2, 0,
        -2*hgStep, hgHeight/2 - hgStep,
    }
    local hgRightUp = {
        hgWidth/2, hgHeight/2 - hgStep,
        2*hgStep, 0,
        hgStep/2, 0,
        2*hgStep, hgHeight/2 - hgStep,
    }
    local hgLeftDown = {
        -hgWidth/2, -hgHeight/2 + hgStep,
        -2*hgStep, 0,
        -hgStep/2, 0,
        -2*hgStep, -hgHeight/2 + hgStep,
    }
    local hgRightDown = {
        hgWidth/2, -hgHeight/2 + hgStep,
        2*hgStep, 0,
        hgStep/2, 0,
        2*hgStep, -hgHeight/2 + hgStep,
    }
    physics.addBody( hourglass, "static",
        {shape=hgTop},
        {shape=hgBot},
        {shape=hgLeftUp},
        {shape=hgRightUp},
        {shape=hgLeftDown},
        {shape=hgRightDown});
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
        local function onTimer( event )
 
            particleSystem:createParticle(
            {
                x = 150,
                y = 100,
                velocityX = 256,
                velocityY = 480,
                color = { 1, 0.2, 0.4, 1 },
                lifetime = 32.0,
                flags = { "water", "colorMixing", "fixtureContactListener" }
            })
        end
        timer.performWithDelay( 20, onTimer, 0 )
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

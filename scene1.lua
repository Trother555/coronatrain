
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local embossedText



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
	local sceneGroup = self.view

	-- Code here runs when the scene is first created but has not yet appeared on screen
	local color = 
	{
		highlight = { r=1, g=0, b=0.5 },
		shadow = { r=0.3, g=0.3, b=0.3 }
	}
	embossedText = display.newEmbossedText(sceneGroup, "Hello", 
		display.contentCenterX, display.contentCenterY, "Wilhelm Klingspor Gotisch", 100)
	embossedText:setEmbossColor(color)

	-- Table of emitter parameters
	local emitterParams = {
		startColorAlpha = 1,
		startParticleSizeVariance = 53.47,
		startColorGreen = 0.3031555,
		yCoordFlipped = -1,
		blendFuncSource = 770,
		rotatePerSecondVariance = 153.95,
		particleLifespan = 0.7237,
		tangentialAcceleration = -144.74,
		finishColorBlue = 0.3699196,
		finishColorGreen = 0.5443883,
		blendFuncDestination = 1,
		startParticleSize = 50.95,
		startColorRed = 0.8373094,
		textureFileName = "fire.png",
		startColorVarianceAlpha = 1,
		maxParticles = 256,
		finishParticleSize = 64,
		duration = -1,
		finishColorRed = 1,
		maxRadiusVariance = 72.63,
		finishParticleSizeVariance = 64,
		gravityy = -671.05,
		speedVariance = 90.79,
		tangentialAccelVariance = -92.11,
		angleVariance = -142.62,
		angle = -244.11
	}
	
	-- Create the emitter
	local emitter = display.newEmitter( emitterParams )
	
	-- Center the emitter within the content area
	emitter.x = display.contentCenterX
	emitter.y = display.contentCenterY

	--sceneGroup:insert(emitter)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

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

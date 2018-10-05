
local composer = require( "composer" )
local json = require( "json" )
local mymod = require("mymodule")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local embossedText
local emitter

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
	embossedText = display.newText(sceneGroup, "Hello", 
		display.contentCenterX, display.contentCenterY, "Wilhelm Klingspor Gotisch.ttf", 100)
	embossedText:setFillColor(1,0,0)

	local status
	status, emitter = pcall(mymod.loadParticle, './scene1/fire')
	if(not status) then
		print('Unable to load texture fire')
	else
		emitter.x = display.contentWidth - 30
		emitter.y = display.contentCenterY
		sceneGroup:insert(emitter)
	end

	status, emitter = pcall(mymod.loadParticle, './scene1/fire')
	if(not status) then
		print('Unable to load texture fire')
	else
		emitter.x = 30
		emitter.y = display.contentCenterY
		sceneGroup:insert(emitter)
	end
	
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

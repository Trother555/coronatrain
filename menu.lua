
local composer = require( "composer" )

local scene = composer.newScene()


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

function gotoScene(event)
    composer.gotoScene( event.target.sceneName )
end

--[[
	options = {
		displayGroup,
		buttonName,
		sceneName,	
	}
]]
local buttonsGroup

function newSceneButton(o)
	local textBaseX = display.contentCenterX
	local textBaseY = 100
	local buttonStep = 50

	local sceneButton = display.newText(o.displayGroup, 
		o.buttonName, textBaseX, 
		textBaseY + 50*buttonsGroup.numChildren, native.systemFont, 44 )
	sceneButton.sceneName = o.sceneName
	sceneButton:addEventListener("tap", gotoScene)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	buttonsGroup = display.newGroup()
	sceneGroup:insert(buttonsGroup)

	newSceneButton({displayGroup = buttonsGroup, buttonName = "Scene1", sceneName = "scene1"})
	
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

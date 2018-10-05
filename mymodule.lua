local mymodule = {}

local json = require( "json" )

--- Load particle emitter from path
-- It is implied that you have a particle definition and its texture in the same folder
-- and they have the same name; e.g. ./particles/fire.png and ./particles/fire.json
-- then you can just	local emitter = loadParticle('./particles/fire')
-- @param path Path to the particle and texture
function mymodule.loadParticle(path)
	local filePath = system.pathForFile( path..'.json' )
	local f = io.open( filePath, "r" )
	local emitterData = f:read( "*a" )
    f:close()
	-- Decode the string
    local emitterParams = json.decode( emitterData )
	emitterParams.textureFileName = path..'.png'
    
	-- Create the emitter with the decoded parameters
	local emitter = display.newEmitter( emitterParams )

	return emitter
end

return mymodule
-- This demo renders a scene with several uses of stencil maps (skip down to comment "Stencils here")
--
-- Sample contributed by andi mcc

local scene = {}

function scene.load()
	-- So we can see the effects of the stencils, we want to put some things in our scene.

	-- A checkerboard floor:
	scene.floorSize = 6

	-- A series of sideways-drifting cubes (these will be stenciled)
	scene.driftCubeCount = 60
	scene.boundMin = lovr.math.newVec3(-10, -1, -10)
	scene.boundMax = lovr.math.newVec3( 10,  9,  10)
	scene.speed = 1
	scene.driftCubeSize = 0.6
	scene.driftCubes = {}
	for i=1,scene.driftCubeCount do
		scene.generateDriftCube(i, true)
	end

	-- A 3x3 cube made of two different stencil types
	scene.stencilCubeCenter = lovr.math.newVec3(0, 1.5, -0.5)
	scene.stencilCubeRad = 0.125
	scene.stencilCubeRotateSpeed = 1
	local stencilCubes = {}
	for z=1,3 do for y=1,3 do for x=1,3 do -- Iterate over every cube
		if not (x==2 and y==2 and z==2) then -- Except the center
			table.insert(stencilCubes, {lovr.math.newVec3(x,y,z), math.random(1,2)}) -- Cube center and stencil type
		end
	end end end

	-- Three cubemap skyboxes, of different colors
	scene.skybox = {}
	local skyboxTextureSize = 16
	local bandSize=3
	for cube_index,colors in ipairs{
		{{1, 0.5, 1}, {1,1,1}},     -- Fuschia and white
		{{0, 0, 0},   {1, 1, 0.5}}, -- Black and yellow
		{{1,1,1}, {0.9,0.9,0.9}},   -- White and silver
	} do
		local layers = {}
		for layer=1,6 do -- 6 layers to a cubemap
			local data = lovr.data.newImage(skyboxTextureSize, skyboxTextureSize, "rgba8")
			for y=1,skyboxTextureSize do for x=1,skyboxTextureSize do
				local isBorder = x==1 or x==skyboxTextureSize or y==1 or y==skyboxTextureSize -- Solid color in corners
				local direction = cube_index==3 and -1 or 1                          -- Reverse direction on third cubemap
				local whichColor = (isBorder or ((x+direction*y-2)%(bandSize*2)>=bandSize)) and 1 or 2 -- Diagonal stripes
				data:setPixel(x-1,y-1,unpack(colors[whichColor]))
			end end
			table.insert(layers, data)
		end
		table.insert(scene.skybox, lovr.graphics.newTexture(layers))
	end

	scene.sampler = lovr.graphics.newSampler({filter="nearest"})
end

local function randomQuaternion() -- Generate one random rotation
	-- Formula from http://planning.cs.uiuc.edu/node198.html
	local u,v,w = math.random(), math.random(), math.random()
	return lovr.math.newQuat( math.sqrt(1-u)*math.sin(2*v*math.pi),
		        math.sqrt(1-u)*math.cos(2*v*math.pi),
		        math.sqrt(u)*math.sin(2*w*math.pi),
		        math.sqrt(u)*math.cos(2*w*math.pi),
		        true ) -- Raw components
end

function scene.generateDriftCube(i, randomZ) -- Generate one cube with random position and color and a random rotational velocity
	local cube = {}
	cube.at = lovr.math.newVec3()
	cube.at.x = scene.boundMin.x + math.random()*(scene.boundMax.x-scene.boundMin.x)
	cube.at.y = scene.boundMin.y + math.random()*(scene.boundMax.y-scene.boundMin.y)
	if randomZ then
		cube.at.z = scene.boundMin.z + math.random()*(scene.boundMax.z-scene.boundMin.z)
	else
		cube.at.z = scene.boundMin.z
	end
	cube.rotateBasis = randomQuaternion()
	cube.rotateTarget = lovr.math.newQuat(cube.rotateBasis:conjugate())
	cube.rotate = cube.rotateBasis
	scene.driftCubes[i] = cube
end

function scene.update(dt) -- On each frame, move each cube and spin it a little
	for i,cube in ipairs(scene.driftCubes) do
		cube.at.x = cube.at.x + scene.speed*dt
		if cube.at.x > scene.boundMax.x then -- If cube left the scene bounds respawn it
			scene.generateDriftCube(i)
		else
			local rotateAmount = (cube.at.x - scene.boundMin.x)/(scene.boundMax.x-scene.boundMin.x)
			cube.rotate = cube.rotateBasis:slerp( cube.rotateTarget, rotateAmount )
		end
	end
end

function scene.draw(pass)
	-- First, draw the skybox
	pass:setSampler(scene.sampler)
	pass:skybox(scene.skybox[3])

	-- Next, draw a floor
	local floorRecenter = scene.floorSize/2 + 0.5
	for x=1,scene.floorSize do for y=1,scene.floorSize do
		if (x+y)%2==0 then
			pass:setColor(0.25,0.25,0.25)
		else
			pass:setColor(0.5,0.5,0.5)
		end
		pass:plane(x-floorRecenter,0,y-floorRecenter, 1,1, math.pi/2,1,0,0)
	end end

	-- Draw driftCubes
	for _,cube in ipairs(scene.driftCubes) do
		pass:setColor(0.5,0.5,0.5,0.5)
		pass:cube(cube.at.x, cube.at.y, cube.at.z, scene.driftCubeSize, cube.rotate:unpack())
	end
end

-- Handle lovr

function lovr.load()
	lovr.graphics.setBackgroundColor(1,0,0) -- Red to show up clearly if something goes wrong
	scene.load()
end

function lovr.update(dt)
	scene.update(dt)
end

function lovr.draw(pass)
	scene.draw(pass)
end

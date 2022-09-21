-- This demo renders a scene into a cubemap, then displays the rendered screen reflected on a sphere surface within the screen.
--
-- Sample contributed by andi mcc with help from holo

-- First a simple scene, a checkerboard floor and some floating cubes
-- Want to see how the cubemap is done? Skip this whole section

local scene = {}

function scene.load()
	scene.floorSize = 6
	scene.cubeCount = 60
	scene.boundMin = lovr.math.newVec3(-10, -1, -10)
	scene.boundMax = lovr.math.newVec3(10,   9,  10)
	scene.speed = 1
	scene.rotateSpeed = 1
	scene.cubeSize = 0.2
	scene.cubes = {}

	scene.sphereCenter = lovr.math.newVec3(0, 1.5, -0.5)
	scene.sphereRad = 0.125

	for i=1,scene.cubeCount do
		scene.generate(i, true)
	end
end

local function randomQuaternion()
	-- Formula from http://planning.cs.uiuc.edu/node198.html
	local u,v,w = math.random(), math.random(), math.random()
	return lovr.math.newQuat( math.sqrt(1-u)*math.sin(2*v*math.pi),
		        math.sqrt(1-u)*math.cos(2*v*math.pi),
		        math.sqrt(u)*math.sin(2*w*math.pi),
		        math.sqrt(u)*math.cos(2*w*math.pi),
		        true ) -- Raw components
end

function scene.generate(i, randomZ) -- Generate each cube with random position and color and a random rotational velocity
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
	cube.color = {math.random()*0.8, math.random()*0.8, math.random()*0.8}
	scene.cubes[i] = cube
end

function scene.update(dt) -- On each frame, move each cube and spin it a little
	for i,cube in ipairs(scene.cubes) do
		cube.at.z = cube.at.z + scene.speed*dt
		if cube.at.z > scene.boundMax.z then -- If cube left the scene bounds respawn it
			scene.generate(i)
		else
			local rotateAmount = (cube.at.z - scene.boundMin.z)/(scene.boundMax.z-scene.boundMin.z)
			cube.rotate = cube.rotateBasis:slerp( cube.rotateTarget, rotateAmount )
		end
	end
end

function scene.draw(pass)

	-- First, draw a floor
	local floorRecenter = scene.floorSize/2 + 0.5
	for x=1,scene.floorSize do for y=1,scene.floorSize do
		if (x+y)%2==0 then
			pass:setColor(0.25,0.25,0.25)
		else
			pass:setColor(0.5,0.5,0.5)
		end
		pass:plane(x-floorRecenter,0,y-floorRecenter, 1,1, math.pi/2,1,0,0)
	end end

	-- Draw cubes
	for _,cube in ipairs(scene.cubes) do
		pass:setColor(unpack(cube.color))
		pass:cube(cube.at.x, cube.at.y, cube.at.z, scene.cubeSize, cube.rotate:unpack())
	end
end

-- Now the cubemap stuff

local cubemap = {}

local unitX = lovr.math.newVec3(1,0,0)
local unitY = lovr.math.newVec3(0,1,0)
local unitZ = lovr.math.newVec3(0,0,1)

function cubemap.load()
	-- Create cubemap textures
	local cubemapWidth, cubemapHeight = 256, 256
	cubemap.texture = lovr.graphics.newTexture(cubemapWidth, cubemapHeight, { type = "cube", mipmaps = false })
	cubemap.faces = {}

	-- Precalculate cubemap View-Projection matrices
	local center = scene.sphereCenter
	cubemap.facePerspective = lovr.math.newMat4():perspective(math.rad(90.0), 1, .1, 0)
	for i,matrix in ipairs{
    -- Not sure why the x flip is needed!
		lovr.math.mat4():lookAt(center, center - unitX, vec3(0, 1, 0)),
		lovr.math.mat4():lookAt(center, center + unitX, vec3(0, 1, 0)),
		lovr.math.mat4():lookAt(center, center + unitY, vec3(0, 0, -1)),
		lovr.math.mat4():lookAt(center, center - unitY, vec3(0, 0, 1)),
		lovr.math.mat4():lookAt(center, center + unitZ, vec3(0, 1, 0)),
		lovr.math.mat4():lookAt(center, center - unitZ, vec3(0, 1, 0))
	} do
		-- Each face will contain a matrix
		local face = {}
		face.matrix = lovr.math.newMat4(matrix)
		cubemap.faces[i] = face
	end

	-- Create reflection shader
	cubemap.shader = lovr.graphics.newShader('unlit', [[
		layout(set = 2, binding = 0) uniform textureCube cubemap;

		vec4 lovrmain() {
      vec3 V = normalize(CameraPositionWorld - PositionWorld);
      vec3 N = normalize(Normal);
      vec3 R = reflect(-V, N);
			vec4 sphereColor = Color * getPixel(cubemap, R * vec3(-1, 1, 1));
			float ndi = dot(N, V) * 0.5 + 0.5; // Darken the sphere a little around the edges to give it apparent depth
			return vec4(sphereColor.rgb * ndi, 1.);
		}
	]])
end

function cubemap.draw(pass)
  local cubemapper = lovr.graphics.getPass('render', { cubemap.texture, samples = 1, depth = false })

  for i = 1, 6 do
    cubemapper:setProjection(i, cubemap.facePerspective)
    cubemapper:setViewPose(i,cubemap.faces[i].matrix,true)
  end

  scene.draw(cubemapper)

  return cubemapper
end

-- Handle lovr

function lovr.load()
	lovr.graphics.setBackgroundColor(0.9,0.9,0.9)
	scene.load()
	cubemap.load()
end

function lovr.update(dt)
	scene.update(dt)
end

function lovr.draw(pass)
	local cubemapPass = cubemap.draw(pass)

	scene.draw(pass)

	-- Draw sphere textured with cube map
	pass:setColor(1,0.6,0.6)
  pass:setShader(cubemap.shader)
	pass:send("cubemap", cubemap.texture)
	pass:sphere(scene.sphereCenter.x, scene.sphereCenter.y, scene.sphereCenter.z, scene.sphereRad)

  return lovr.graphics.submit(cubemapPass, pass)
end

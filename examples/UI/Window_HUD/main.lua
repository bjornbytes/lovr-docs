-- "Second screen experience" demo
-- Click grid on desktop screen to build a scene simultaneously visible in VR space
-- NOTE: does not currently work properly with the desktop driver, since lovr.mirror clears the window
--
-- Sample contributed by andi mcc

local shader = require 'shader'

-- In order for lovr.mouse to work, and therefore for this example to work,
-- we must be using LuaJIT and we must be using GLFW (ie: we can't be on Android)
if type(jit) == 'table' and lovr.system.getOS() ~= "android" then
	lovr.mouse = require 'mouse'
end

local mirror = lovr.mirror              -- Backup lovr.mirror before it is overwritten
local font = lovr.graphics.newFont(24)  -- Font appropriate for screen-space usage
font:setPixelDensity(1)

-- Simple 2D triangle mesh
local triangle = lovr.graphics.newBuffer(
	{{0,-1,0}, {0.75,1,0}, {-0.75,1,0}}, {'vec3:VertexPosition'})

-- Constants
local pixwidth = lovr.system.getWindowWidth()   -- Window pixel width and height
local pixheight = lovr.system.getWindowHeight()
local aspect = pixwidth/pixheight           -- Window aspect ratio
local height = 2                            -- Window width and height in screen coordinates
local width = aspect*2                      -- ( We will pick the coordinate system [[-1,1],[-aspect,aspect]] )
local topmargin = 0.2                       -- Space between top of screen and top of grid
local cells = 7                             -- Number of cells in grid (per side)
local towerscalexz = 2                      -- How wide is one block in 3D space?
local towerscaley = 3                       -- How tall (maximum) is one block in 3D space?

-- Derived constants
local gridheight = (height-topmargin*2)             -- Height of grid
local gridspan = gridheight/2                       -- Half height of grid
local cellheight = gridheight/cells                 -- Height of one grid cell
local cellspan = cellheight/2                       -- Half height of one grid cell
local bannedcell = math.ceil(cells/2)               -- Do not allow clicks at this x,y coordinate
local fontscale = height/pixheight  -- Scale argument to screen-space print() functions

-- Screen-space coordinate system
local matrix = lovr.math.newMat4():orthographic(-aspect, aspect, -1, 1, -64, 64)

-- State: We will store the blocks to draw as a 2D array of heights (nil for no block)
local grid = {}
for x=1,cells do grid[x] = {} end

function lovr.load()
	lovr.handlers['mousepressed'] = function(x,y)
		local inx = x * width / pixwidth - width/2    -- Convert pixel x,y to our coordinate system
		local iny = y * height / pixheight - height/2
		local gridorigin = -gridspan - cellheight     -- Upper left of grid ()
		local gx = (inx - gridorigin) / cellheight    -- Convert coordinate system to grid cells
		local gy = (iny - gridorigin) / cellheight
		local fx = math.floor(gx)
		local fy = math.floor(gy)
		if fx >= 1 and fy >= 1 and fx <= cells and fy <= cells   -- If the click was within the grid
		   and not (fx == bannedcell and fy == bannedcell) then  -- and was not the banned center cell
			if grid[fx][fy] then
				grid[fx][fy] = nil                -- toggle off
			else
				grid[fx][fy] = lovr.math.random() -- toggle on (random height)
			end
		end
	end
end

function drawGrid(pass)
	-- Draw cell backgrounds (where present)
	for _x=1,cells do for _y=1,cells do
		local gray = grid[_x][_y]
		if gray then
			local x = -gridspan + _x * cellheight - cellspan -- Center of cell
			local y = -gridspan + _y * cellheight - cellspan

			pass:setColor(gray,gray,gray,1)
			pass:plane(x, y, 0, cellheight, cellheight)
		end
	end end

	-- Draw grid lines
	pass:setColor(1,1,1,1)
	for c=0,cells do
		local x = -gridspan + c * cellheight
		local y = -gridspan + c * cellheight
		pass:line(-gridspan, y, 0, gridspan, y, 0)
		pass:line(x, -gridspan, 0, x, gridspan, 0)
	end

	-- Draw a red triangle indicating the position and orientation of the headset player
	pass:push()
	local x, y, z, angle, ax, ay, az = lovr.headset.getPose()
	-- Flatten the 3-space current rotation of the headset into just its xz axis
	-- Equation from: http://www.euclideanspace.com/maths/geometry/rotations/conversions/angleToEuler/index.htm
	local s = math.sin(angle)
	local c = math.cos(angle)
	local t = 1-c;
	local xzangle = math.atan2(ay*s - ax*az*t , 1 - (ay*ay + az*az) * t);
  pass:setColor(1,0,0,1)
	pass:translate(x / towerscalexz, z / towerscalexz, 0)
	pass:scale(cellheight*0.5*0.75)
	pass:rotate(-xzangle, 0, 0, 1)
  pass:mesh(triangle)
	pass:pop()
end

-- Draw HUD overlay
function lovr.mirror(pass)
	if mirror then mirror() end
	pass:origin()
  pass:setViewPose(1, mat4())
	pass:setProjection(1, matrix) -- Switch to screen space coordinates
	drawGrid(pass)

	-- Draw instructions
	pass:setColor(1,1,1,1)
	pass:setFont(font)
	pass:text("Instructions: Click the grid to create or remove blocks.", 0, (gridheight+cellheight)/2, 0, fontscale)
end

-- Draw one block
function floorbox(pass,_x,_y,gray)
	local x = -gridspan + _x * cellheight - cellspan
	local z = -gridspan + _y * cellheight - cellspan
	local height = gray * towerscaley
	pass:box(x*towerscalexz, height/2, z*towerscalexz, cellheight*towerscalexz, height, cellheight*towerscalexz)
end

-- Draw 3D scene
function lovr.draw(pass)
	pass:setShader(shader)
	pass:setColor(0,1,1)
	for x=1,cells do for y=1,cells do
		local gray = grid[x][y]
		if gray then floorbox(pass,x,y,gray) end
	end end
	pass:setShader()

	if not lovr.mouse then -- If you can't click, you can't create any blocks
		pass:text('This example only works on a desktop computer.', 0, 1.7, -3, .2)
	end
end

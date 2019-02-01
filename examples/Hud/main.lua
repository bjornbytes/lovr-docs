-- Sample contributed by andi mcc

local shader = require 'shader'
lovr.mouse = require 'mouse'

local mirror = lovr.mirror
local font = lovr.graphics.newFont(36)
font:setFlipEnabled(true)
font:setPixelDensity(1)

local triangle = lovr.graphics.newMesh(
	{{ 'lovrPosition', 'float', 3 }, { 'lovrNormal', 'float', 3 }},
	{{0,-1,0, 0,0,1}, {0.75,1,0, 0,0,1}, {-0.75,1,0, 0,0,1}},
	'triangles', 'static'
	)

-- Constants
local pixwidth = lovr.graphics.getWidth()
local pixheight = lovr.graphics.getHeight()
local aspect = pixwidth/pixheight
local height = 2
local width = aspect*2
local topmargin = 0.2
local cells = 7
local gridheight = (height-topmargin*2)
local gridspan = gridheight/2
local cellheight = gridheight/cells
local cellspan = cellheight/2
local bannedcell = math.ceil(cells/2)
local towerscalexz = 2
local towerscaley = 3
local fontscale = height/lovr.graphics.getHeight()

local matrix = lovr.math.mat4():orthographic(-aspect, aspect, -1, 1, -64, 64)

local grid = {}
for x=1,cells do grid[x] = {} end

function lovr.load()
	lovr.handlers['mousepressed'] = function(x,y)
		local inx = x * width / pixwidth - width/2
		local iny = y * height / pixheight - height/2
		local gridorigin = -gridspan - cellheight
		local gx = (inx - gridorigin) / cellheight
		local gy = (iny - gridorigin) / cellheight
		print('mouse:', pixwidth, pixheight, x, y, inx, iny, gx, gy)
		local fx = math.floor(gx)
		local fy = math.floor(gy)
		if fx >= 1 and fy >= 1 and fx <= cells and fy <= cells
		   and not (fx == bannedcell and fy == bannedcell) then
			if grid[fx][fy] then
				grid[fx][fy] = nil
			else
				grid[fx][fy] = lovr.math.random()
			end
		end
	end
end

function drawGrid()
	for _x=1,cells do for _y=1,cells do
		local x = -gridspan + _x * cellheight - cellspan
		local y = -gridspan + _y * cellheight - cellspan

		local gray = grid[_x][_y]
		if gray then
			lovr.graphics.setColor(gray,gray,gray,1)
			lovr.graphics.plane('fill', x, y, 0, cellheight, cellheight)
		end
	end end

	lovr.graphics.setColor(1,1,1,1)
	for c=0,cells do
		local x = -gridspan + c * cellheight
		local y = -gridspan + c * cellheight
		lovr.graphics.line(-gridspan, y, 0, gridspan, y, 0)
		lovr.graphics.line(x, -gridspan, 0, x, gridspan, 0)
	end

	lovr.graphics.push()
	local x, y, z, angle, ax, ay, az = lovr.headset.getPose()
	-- Equation from: http://www.euclideanspace.com/maths/geometry/rotations/conversions/angleToEuler/index.htm
	local s = math.sin(angle);
	local c = math.cos(angle);
	local t = 1-c;
	local xzangle = math.atan2(ay*s - ax*az*t , 1 - (ay*ay + az*az) * t);
	lovr.graphics.setColor(1,0,0,1)
	lovr.graphics.translate(x / towerscalexz, z / towerscalexz, 0)
	lovr.graphics.scale(cellheight*0.5*0.75)
	lovr.graphics.rotate(-xzangle, 0, 0, 1)
	triangle:draw()
	lovr.graphics.pop()
end

function lovr.mirror()
	mirror()
	--lovr.graphics.clear()
	lovr.graphics.setShader(nil)
	lovr.graphics.origin()
	lovr.graphics.setDepthTest(nil)
	lovr.graphics.setProjection(matrix)
	drawGrid()

	lovr.graphics.setColor(1,1,1,1)
	lovr.graphics.setFont(font)
	lovr.graphics.print("Instructions: Click the grid to create or remove blocks.", 0, (gridheight+cellheight)/2, 0, fontscale)
end

function floorbox(_x,_y,gray)
	local x = -gridspan + _x * cellheight - cellspan
	local z = -gridspan + _y * cellheight - cellspan
	local height = gray * towerscaley
	lovr.graphics.box('fill', x*towerscalexz, height/2, z*towerscalexz, cellheight*towerscalexz, height, cellheight*towerscalexz)
end

function lovr.draw()
	lovr.graphics.setDepthTest('lequal', true)
	lovr.graphics.setShader(shader)
	lovr.graphics.setColor(0,1,1)
	for x=1,cells do for y=1,cells do
		local gray = grid[x][y]
		if gray then floorbox(x,y,gray) end
	end end
end

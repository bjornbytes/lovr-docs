-- Display all input devices as floating text
-- Sample contributed by andi mcc

local function appendMovement(s, device)
  a,b,c = lovr.headset.getVelocity(device) a = a or -999 b = b or -999 c = c or -9999
  s = string.format("%s vel %1.1f,%1.1f,%1.1f", s,a,b,c)
  a,b,c = lovr.headset.getAngularVelocity(device) a = a or -999 b = b or -999 c = c or -9999
  s = string.format("%s   ang %1.1f,%1.1f,%1.1f", s,a,b,c)
  return s
end

local controllerData = {}
local function controllerFetch(k)
  if not controllerData[k] then controllerData[k] = {} end
  return controllerData[k]
end

local function drawText()
  local hands = lovr.headset.getHands()
  -- Head
  local s = string.format("%d controllers\nhead", #hands)
  s = appendMovement(s, "head")
  local i = 0
  for i,controller in ipairs(hands) do
  	local c = controllerFetch(controller)
    -- Axes
    local axes = ""
    for i2, axis in ipairs{"touchpad", "thumbstick"} do
      local x,y = lovr.headset.getAxis(controller, axis)
      if x and y and (x ~= 0 or y ~= 0) then c[axis] = true end
      if c[axis] then -- Show an axis if it is, or ever has been, non-nil non-zero
        axes = string.format("%s%s x %1.1f, y %1.1f; ", axes, axis, x,y)
      end
    end
    -- Controller name and axes
    s = string.format("%s\n\n%d (%s): %strig %1.1f; grip %1.1f", s, i, controller, axes, lovr.headset.getAxis(controller, "trigger") or -999, lovr.headset.getAxis(controller, "grip") or -999)
    s = appendMovement(s, controller)
    -- Buttons
    s = s .. "\nDOWN"
    for i,name in ipairs({"grip", "trigger", "touchpad", "thumbstick", "menu", "a", "b", "x", "y"}) do
    	s = s .. string.format(" %s:%d", name, lovr.headset.isDown(controller, name) and 1 or 0)
    end
    s = s .. "\nTOUCH"
    for i,name in ipairs({"grip", "trigger", "touchpad", "thumbstick", "menu", "a", "b", "x", "y"}) do
    	if i ~= 1 then s = s .. " " end
    	s = s .. string.format(" %s:%d", name, lovr.headset.isTouched(controller, name) and 1 or 0)
    end
  end
  -- Display
  lovr.graphics.print(s, 0, 2, -3, .5)
end

function lovr.draw()
	drawText()
end

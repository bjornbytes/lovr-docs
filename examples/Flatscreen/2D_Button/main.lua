-- Set the units of the default font to pixels instead of meters
local font = lovr.graphics.getDefaultFont()
font:setPixelDensity(1)

-- Set up a 2D orthographic projection, where (0, 0) is the upper
-- left of the window and the units are in pixels
local width, height = lovr.system.getWindowDimensions()
local projection = Mat4():orthographic(0, width, 0, height, -10, 10)

function lovr.draw(pass)
  pass:setViewPose(1, mat4():identity())
  pass:setProjection(1, projection)
  pass:setDepthTest()

  local button = { x = width / 2, y = height / 2, w = 180, h = 60 }

  local mx, my = lovr.system.getMousePosition()
  local pressed = lovr.system.isMouseDown(1)
  local hovered = mx > button.x - button.w / 2 and mx < button.x + button.w / 2 and
                  my > button.y - button.h / 2 and my < button.y + button.h / 2

  if hovered and pressed then
    pass:setColor(.25, .25, .27)
  elseif hovered then
    pass:setColor(.20, .20, .22)
  else
    pass:setColor(.15, .15, .17)
  end

  pass:plane(button.x, button.y, 0, button.w, button.h)

  pass:setColor(1, 1, 1)
  pass:text('Click me!', button.x, button.y, 0)
end

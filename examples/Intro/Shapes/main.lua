lovr.graphics.setBackgroundColor(.1, .1, .1)

local function drawLabel(pass, str, x, y, z)
  pass:setColor(1, 1, 1)
  pass:text(str, x, y, z, .1)
end

function lovr.draw(pass)
  local t = lovr.headset.getTime()
  local x, y, z

  -- Point
  x, y, z = -.3, 1.1, -1
  pass:setColor(1, 1, 1)
  pass:points(x, y, z)

  -- Line
  x, y, z = .3, 1.1, -1
  local points = {
    x - .1, y, z,
    x + .1, y, z
  }
  pass:setColor(1, 1, 1)
  pass:line(points)

  -- Plane
  local x, y, z = -.9, 1.7, -1.5
  pass:setColor(.94, .33, .31)
  pass:plane(x, y, z, .4, .4, t)

  -- Cube
  local x, y, z = -.3, 1.7, -1.5
  pass:setColor(.49, .34, .76)
  pass:cube(x, y, z, .3, t)

  -- Roundrect
  local x, y, z = .3, 1.7, -1.5
  pass:setColor(.79, .34, .84)
  pass:roundrect(x, y, z, .4, .4, .1, t, 0, 1, 0, .05)

  -- Box
  local x, y, z = .9, 1.7, -1.5
  pass:setColor(1, .65, .18)
  pass:box(x, y, z, .4, .2, .3, t)

  -- Cylinder
  local x, y, z = -1.2, 2.4, -2
  pass:setColor(.4, .73, .42)
  pass:cylinder(x, y, z, .1, .4, t)

  -- Cone
  local x, y, z = -.6, 2.2, -2
  pass:setColor(1, .95, .46)
  pass:cone(x, y, z, .18, .4, math.pi / 2, 1, 0, 0)

  -- Sphere
  local x, y, z = 0, 2.4, -2
  pass:setColor(.3, .82, 1)
  pass:sphere(x, y, z, .2)

  -- Capsule
  local x, y, z = .6, 2.4, -2
  pass:setColor(.3, .22, 1)
  pass:capsule(x, y, z, .1, .3, t)

  -- Torus
  local x, y, z = 1.2, 2.4, -2
  pass:setColor(.8, .8, .4)
  pass:torus(x, y, z, .25, .1, t)

  pass:setShader()
  drawLabel(pass, 'Point', -.3, 1.4, -1)
  drawLabel(pass, 'Line', .3, 1.4, -1)
  drawLabel(pass, 'Plane', -.9, 2.0, -1.5)
  drawLabel(pass, 'Cube', -.3, 2.0, -1.5)
  drawLabel(pass, 'Roundrect', .3, 2.0, -1.5)
  drawLabel(pass, 'Box', .9, 2.0, -1.5)
  drawLabel(pass, 'Cylinder', -1.2, 2.7, -2)
  drawLabel(pass, 'Cone', -.6, 2.7, -2)
  drawLabel(pass, 'Sphere', 0, 2.7, -2)
  drawLabel(pass, 'Capsule', .6, 2.7, -2)
  drawLabel(pass, 'Torus', 1.2, 2.7, -2)
end

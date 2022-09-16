function lovr.load()
  -- shadow shader
  shadowVertex = 'unlit'
  shadowFragment = [[
    Constants {
      vec4 left;
      vec4 right;
      vec4 head;
    };

    vec4 lovrmain() {
      vec4 shadowColor;
      if (
        (length( left.xz - PositionWorld.xz) <  left.w   &&    left.y > PositionWorld.y) ||
        (length(right.xz - PositionWorld.xz) < right.w   &&   right.y > PositionWorld.y) ||
        (length( head.xz - PositionWorld.xz) <  head.w   &&    head.y > PositionWorld.y)
      ) {
        shadowColor = vec4(.25, .625, 1, 1);
      } else {
        shadowColor = vec4(1, 1, 1, 1);
      }
      return shadowColor * Color * getPixel(ColorTexture, UV);
    }
  ]]
  shadowShader = lovr.graphics.newShader(shadowVertex, shadowFragment)

  -- grass texture
  grassTextureWidth = 256
  grassImage = lovr.data.newImage(grassTextureWidth, grassTextureWidth)
  for x = 0, grassTextureWidth - 1 do
    for y = 0, grassTextureWidth - 1 do
      grassImage:setPixel(x, y,
        lovr.math.noise(x + .5, y + .5 +  0) / 2,
        lovr.math.noise(x + .5, y + .5 + 16) / 2 + .5,
        lovr.math.noise(x + .5, y + .5 + 32) / 2
      )
    end
  end
  grassTexture = lovr.graphics.newTexture(grassImage)

  -- boxes
  boxes = {}
  for i = 1, 5 do
    table.insert(boxes, {
      x      = lovr.math.random() / 2,
      y      = lovr.math.random() / 2 + .5,
      z      = lovr.math.random() / 2,
      width  = lovr.math.random() / 3,
      height = lovr.math.random() / 3,
      depth  = lovr.math.random() / 3,
      r      = lovr.math.random(),
      g      = lovr.math.random(),
      b      = lovr.math.random()
    })
  end

  -- sky
  lovr.graphics.setBackgroundColor(0,.5,1)
end

function lovr.update()
  left = vec3(lovr.headset.getPosition('left'))
  right = vec3(lovr.headset.getPosition('right'))
  head = vec3(mat4(lovr.headset.getPose('head')):translate(0, -.1, -.1))
end

function lovr.draw(pass)

  -- grass
  pass:setShader(shadowShader)
  pass:send('left',  { left.x,  left.y,  left.z, .05}) -- x, y, z, radius
  pass:send('right', {right.x, right.y, right.z, .05})
  pass:send('head',  { head.x,  head.y,  head.z, .1 })
  pass:setMaterial(grassTexture)
  pass:setSampler('nearest')
  pass:box(0, 0, 0, 10, 1, 10)
  pass:setMaterial()
  pass:setSampler()
  pass:setShader()

  -- boxes
  pass:setShader(shadowShader)
  pass:send('left',  { left.x,  left.y,  left.z, .05}) -- x, y, z, radius
  pass:send('right', {right.x, right.y, right.z, .05})
  pass:send('head',  { head.x,  head.y,  head.z, .1 })
  for _, box in pairs(boxes) do
    pass:setColor(box.r, box.g, box.b)
    pass:box(box.x, box.y, box.z, box.width, box.height, box.depth)
  end
  pass:setShader()

  -- hands
  pass:setColor(.9, .7, .1)
  pass:sphere(vec3(lovr.headset.getPosition('left')), .05)
  pass:sphere(vec3(lovr.headset.getPosition('right')), .05)
end

function lovr.load()
  -- shadow shader
  shadowVertex = [[
    out vec3 fragPos;

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      fragPos = vec3(lovrModel * vertex);
      return projection * transform * vertex;
    }
  ]]
  shadowFragment = [[
    in vec3 fragPos;
    uniform vec4 left;
    uniform vec4 right;
    uniform vec4 head;

    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
      vec4 shadowColor;
      if (                                       // w is radius
        (length( left.xz - fragPos.xz) <  left.w   &&    left.y > fragPos.y) ||
        (length(right.xz - fragPos.xz) < right.w   &&   right.y > fragPos.y) ||
        (length( head.xz - fragPos.xz) <  head.w   &&    head.y > fragPos.y)
      ) {
        shadowColor = vec4(.25, .625, 1, 1);
      } else {
        shadowColor = vec4(1, 1, 1, 1);
      }
      return shadowColor * graphicsColor * lovrDiffuseColor * vertexColor * texture(image, uv);
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
  grassTexture:setFilter('nearest')
  grassMaterial = lovr.graphics.newMaterial(grassTexture)

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
end

function lovr.update()
  left = vec3(lovr.headset.getPosition('left'))
  right = vec3(lovr.headset.getPosition('right'))
  head = vec3(mat4(lovr.headset.getPose('head')):translate(0, -.1, -.1))

  shadowShader:send('left',  { left.x,  left.y,  left.z, .05}) -- x, y, z, radius
  shadowShader:send('right', {right.x, right.y, right.z, .05})
  shadowShader:send('head',  { head.x,  head.y,  head.z, .1 })
end

function lovr.draw()
  -- sky
  lovr.graphics.setBackgroundColor(0,.5,1)

  -- grass
  lovr.graphics.setColor(1, 1, 1)
  lovr.graphics.setShader(shadowShader)
  lovr.graphics.box(grassMaterial, 0, 0, 0, 10, 1, 10)
  lovr.graphics.setShader()

  -- boxes
  lovr.graphics.setShader(shadowShader)
  for _, box in pairs(boxes) do
    lovr.graphics.setColor(box.r, box.g, box.b)
    lovr.graphics.box('fill', box.x, box.y, box.z, box.width, box.height, box.depth)
  end
  lovr.graphics.setShader()

  -- hands
  lovr.graphics.setColor(.9, .7, .1)
  lovr.graphics.sphere(vec3(lovr.headset.getPosition('left')), .05)
  lovr.graphics.sphere(vec3(lovr.headset.getPosition('right')), .05)
end

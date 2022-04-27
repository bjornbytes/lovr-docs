-- red puffs are billboards oriented in GLSL
-- blue puffs are billboards oriented in Lua

function lovr.load()
  -- puff texture
  puffImageSize = 128                                                         -- try 16
  puffImage = lovr.data.newImage(puffImageSize, puffImageSize)
  for x = 0, puffImageSize - 1 do
    for y = 0, puffImageSize - 1 do
      local radius = puffImageSize / 2 - 1
      local distanceFromCenter = vec2(radius, radius):distance(vec2(x, y))
      local depth = math.sqrt(radius^2 - distanceFromCenter^2)
      puffImage:setPixel(x, y, 1, 1, 1, depth / radius)
      lovr.math.drain()
    end
  end
  puffTexture = lovr.graphics.newTexture(puffImage)
  -- puffTexture:setFilter('nearest')                                         -- try uncommenting
  puffMaterial = lovr.graphics.newMaterial(puffTexture)

  -- puff positions
  redPuffs = {}
  for i = 1, 100 do
    table.insert(redPuffs, {
      position = lovr.math.newVec3(
        lovr.math.random() - .5, 
        lovr.math.random() - .5 + 1.7,
        lovr.math.random() - .5
      )
    })
  end
  bluePuffs = {}
  for i = 1, 100 do
    table.insert(bluePuffs, {
      position = lovr.math.newVec3(
        lovr.math.random() - .5, 
        lovr.math.random() - .5 + 1.7,
        lovr.math.random() - .5
      )
    })
  end

  -- red puff billboard shader
  redPuffVertex = [[
    uniform vec3 headPosition;

    mat4 target(vec3 from, vec3 to, vec3 up) {
      mat4 m;
      vec3 z = normalize(from - to);
      vec3 x = normalize(cross(up, z));
      vec3 y = cross(z, x);
      m[0] = vec4(x, 0);
      m[1] = vec4(y, 0);
      m[2] = vec4(z, 0);
      m[3] = vec4(from, 1);
      return m;
    }

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      vec3 puffPosition = lovrModel[3].xyz;
      vec3 puffScale = vec3(length(lovrModel[0]), length(lovrModel[1]), length(lovrModel[2]));
      mat4 billboardModel = target(puffPosition, headPosition, vec3(0, 1, 0));
      billboardModel *= mat4(
        puffScale.x, 0,           0,           0,
        0,           puffScale.y, 0,           0,
        0,           0,           puffScale.z, 0,
        0,           0,           0,           1
      );
      return projection * lovrView * billboardModel * vertex;
    }
  ]]
  defaultFragment = [[
    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
      return graphicsColor * lovrDiffuseColor * lovrVertexColor * texture(image, uv);
    }
  ]]
  redPuffShader = lovr.graphics.newShader(redPuffVertex, defaultFragment)

  lovr.graphics.setBackgroundColor(0, .5, 1)
end

function lovr.draw()
  -- red puffs
  lovr.graphics.setColor(1, .9, .9)
  lovr.graphics.setDepthTest('lequal', false)
  lovr.graphics.setShader(redPuffShader)
  redPuffShader:send('headPosition', {lovr.headset.getPosition('head')})
  for _, puff in pairs(redPuffs) do
    lovr.graphics.plane(puffMaterial, puff.position, .1)
  end
  lovr.graphics.setDepthTest('lequal', true)
  lovr.graphics.setShader()

  -- blue puffs
  lovr.graphics.setColor(.9, 1, 1)
  lovr.graphics.setDepthTest('lequal', false)
  for _, puff in pairs(bluePuffs) do
    puff.orientation = quat(mat4():target(puff.position, vec3(lovr.headset.getPosition('head'))))
    lovr.graphics.plane(puffMaterial, puff.position, .1, .1, puff.orientation)
  end
  lovr.graphics.setDepthTest('lequal', true)
end
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
  puffMaterial = lovr.graphics.newMaterial({ texture = puffTexture })

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
    Constants {
      vec3 headPosition;
    };

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

    vec4 lovrmain() {
      vec3 puffPosition = Transform[3].xyz;
      vec3 puffScale = vec3(length(Transform[0]), length(Transform[1]), length(Transform[2]));
      mat4 billboardModel = target(puffPosition, headPosition, vec3(0, 1, 0));
      billboardModel *= mat4(
        puffScale.x, 0,           0,           0,
        0,           puffScale.y, 0,           0,
        0,           0,           puffScale.z, 0,
        0,           0,           0,           1
      );
      return Projection * View * billboardModel * VertexPosition;
    }
  ]]
  defaultFragment = [[
    vec4 lovrmain() {
      return DefaultColor;
    }
  ]]
  redPuffShader = lovr.graphics.newShader(redPuffVertex, defaultFragment)

  lovr.graphics.setBackgroundColor(0, .5, 1)
end

function lovr.draw(pass)
  pass:setSampler('nearest')                                         -- try uncommenting

  -- red puffs
  pass:setColor(1, .9, .9)
  pass:setMaterial(puffMaterial)
  pass:setDepthWrite(false)
  pass:setShader(redPuffShader)
  pass:send('headPosition', lovr.headset.getPosition('head'))
  for _, puff in pairs(redPuffs) do
    pass:plane(puff.position, .1)
  end
  pass:setShader()

  -- blue puffs
  pass:setColor(.9, 1, 1)
  for _, puff in pairs(bluePuffs) do
    puff.orientation = quat(mat4():target(puff.position, vec3(lovr.headset.getPosition('head'))))
    pass:plane(puff.position, .1, .1, puff.orientation)
  end
end

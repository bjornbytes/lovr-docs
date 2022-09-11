-- Surround yourself with monkeys, efficiently

function lovr.load()
  MONKEYS = 500

  -- Create some random transforms
  local transforms = {}
  local random, randomNormal = lovr.math.random, lovr.math.randomNormal
  for i = 1, MONKEYS do
    local position = vec3(randomNormal(8), randomNormal(8), randomNormal(8))
    local orientation = quat(random(2 * math.pi), random(), random(), random())
    local scale = vec3(.75)
    transforms[i] = mat4(position, scale, orientation)
  end

  transformBuffer = lovr.graphics.newBuffer(transforms, 'mat4')

  shader = lovr.graphics.newShader([[
    layout(set = 2, binding = 0) uniform Transforms {
      mat4 transforms[500];
    };

    vec4 lovrmain() {
      return Projection * View * transforms[InstanceIndex] * VertexPosition;
    }
  ]], 'normal')

  monkey = lovr.graphics.newModel('monkey.obj')
end

-- Draw many copies of the model with 1 draw, taking transforms from the buffer
function lovr.draw(pass)
  pass:setBlendMode()
  pass:setCullMode('back')
  pass:setShader(shader)
  pass:send('Transforms', transformBuffer)
  pass:draw(monkey, mat4(), nil, nil, MONKEYS)
end

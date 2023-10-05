-- Surround yourself with monkeys and efficiently move them with compute shaders

ASSUME_FRAMERATE = 1/120

function lovr.load()
  MONKEYS = 500

  -- Create some random transforms
  local random, randomNormal = lovr.math.random, lovr.math.randomNormal
  local transforms = {}
  for i = 1, MONKEYS do
    local position = vec3(randomNormal(8), randomNormal(8), randomNormal(8))
    local orientation = quat(random(2 * math.pi), random(), random(), random())
    local scale = vec3(.75)
    transforms[i] = mat4(position, scale, orientation)
  end

  -- More random transforms-- this will correspond to the transform applied to each monkey per frame
  local offsets = {}
  for i = 1, MONKEYS do
    local position = vec3(randomNormal(1), randomNormal(8), randomNormal(8)):mul(ASSUME_FRAMERATE)
    local radianSwing = ASSUME_FRAMERATE * math.pi / 2
    local orientation = quat(random(-radianSwing, radianSwing), random(), random(), random())
    local scale = vec3(1)
    offsets[i] = mat4(position, scale, orientation)
  end

  -- Create a Buffer to store positions for lots of models
  transformBuffer = lovr.graphics.newBuffer(transforms, 'mat4')
  offsetBuffer = lovr.graphics.newBuffer(offsets, 'mat4')

  -- Create the compute shader, we will run this once per frame
  computeShader = lovr.graphics.newShader([[
    layout(local_size_x = 32, local_size_y = 1, local_size_z = 1) in;

    layout(set = 0, binding = 0) buffer TransformBuffer { mat4 Transforms[]; };
    layout(set = 0, binding = 1) buffer OffsetBuffer { mat4 Offsets[]; };

    Constants {
      uint monkeyCount;
    };

    void lovrmain() {
      uint i = GlobalThreadID.x;
      if (i >= monkeyCount) return;
      Transforms[i] = Transforms[i] * Offsets[i];
    }
  ]])

  -- Create the display shader, injecting the shader code for the block
  shader = lovr.graphics.newShader([[
    layout(set = 2, binding = 0) buffer TransformBuffer { mat4 Transforms[]; };

    vec4 lovrmain() {
      return Projection * View * Transforms[InstanceIndex] * Transform * VertexPosition;
    }
  ]], 'normal')

  model = lovr.graphics.newModel('monkey.obj')
end

-- Draw many copies of the model using instancing, with transforms from a buffer
function lovr.draw(pass)
  pass:setShader(computeShader)
  pass:send('monkeyCount', MONKEYS)
  pass:send('TransformBuffer', transformBuffer)
  pass:send('OffsetBuffer', offsetBuffer)
  pass:compute(math.ceil(MONKEYS / 32))

  pass:setShader(shader)
  pass:send('TransformBuffer', transformBuffer)
  pass:setCullMode('back')
  pass:setBlendMode(nil)
  pass:draw(model, mat4(), MONKEYS)
end

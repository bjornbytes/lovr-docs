-- Surround yourself with monkeys, efficiently
-- This version uses a Blob instead of a table

local ffi = require 'ffi'

function lovr.load()
  MONKEYS = 500

  -- Write some random transforms to the block
  local transformBlob = lovr.data.newBlob(4*16*MONKEYS, "transformBlob")
  local pointer = ffi.cast("float*",transformBlob:getPointer())
  local random, randomNormal = lovr.math.random, lovr.math.randomNormal
  for i = 1, MONKEYS do
    local position = vec3(randomNormal(8), randomNormal(8), randomNormal(8))
    local orientation = quat(random(2 * math.pi), random(), random(), random())
    local scale = vec3(.75)
    local transform = mat4(position, scale, orientation)
    local components = {transform:unpack(true)}
    for i2,v in ipairs(components) do
      pointer[(i-1)*16 + (i2-1)] = v
    end
  end

  -- Create a Buffer to store positions for lots of models
  buffer = lovr.graphics.newBuffer(transformBlob, 'mat4')

  shader = lovr.graphics.newShader([[
    layout(set = 2, binding = 0) uniform TransformBuffer { mat4 transforms[500]; };

    vec4 lovrmain() {
      return Projection * View * Transform * transforms[InstanceIndex] * VertexPosition;
    }
  ]], 'normal')

  model = lovr.graphics.newModel('monkey.obj')
end

-- Draw many copies of the model using instancing, with transforms from the buffer
function lovr.draw(pass)
  pass:setShader(shader)
  pass:setCullMode('back')
  pass:setBlendMode(nil)
  pass:send('TransformBuffer', buffer)
  pass:draw(model, mat4(), nil, nil, MONKEYS)
end

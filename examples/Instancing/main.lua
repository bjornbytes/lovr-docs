-- Surround yourself with 1000 monkeys, efficiently

function lovr.load()
  MONKEYS = 1000

  -- Create a ShaderBlock to store positions for lots of models
  block = lovr.graphics.newShaderBlock('uniform', {
    modelPositions = { 'mat4', MONKEYS }
  }, { usage = 'static' })

  -- Write some random transforms to the block
  local transforms = {}
  for i = 1, MONKEYS do
    local transform = lovr.math.mat4()
    local random, randomNormal = lovr.math.random, lovr.math.randomNormal
    transform:translate(randomNormal(8), randomNormal(8), randomNormal(8))
    transform:rotate(random(2 * math.pi), random(), random(), random())
    transforms[i] = transform
  end
  block:send('modelPositions', transforms)

  -- Create the shader, injecting the shader code for the block
  shader = lovr.graphics.newShader(
    block:getShaderCode('ModelBlock') .. [[
    out vec3 vNormal;
    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      vNormal = lovrNormal;
      return projection * transform * modelPositions[lovrInstanceID] * vertex;
    }
  ]], [[
    in vec3 vNormal;
    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
      return vec4(vNormal * .5 + .5, 1.);
    }
  ]])

  -- Bind the block to the shader
  shader:sendBlock('ModelBlock', block)
  model = lovr.graphics.newModel('monkey.obj')
end

-- Draw the model 1000 times, using positions from the shader block
function lovr.draw()
  lovr.graphics.setCullingEnabled(true)
  lovr.graphics.setShader(shader)
  model:draw(lovr.math.mat4(), MONKEYS)
  lovr.graphics.setShader()
end

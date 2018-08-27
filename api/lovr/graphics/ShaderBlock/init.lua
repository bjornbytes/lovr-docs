return {
  summary = 'A big ol\' block of data that can be accessed in a Shader.',
  description = [[
    ShaderBlocks are objects that can hold large amounts of data and can be sent to Shaders.  It is
    common to use "uniform" variables to send data to shaders, but uniforms are usually limited to
    a few kilobytes in size.  ShaderBlocks are useful for a few reasons:

    - They can hold a lot more data.
    - Shaders can modify the data in them, which is really useful for compute shaders.
    - Setting the data in a ShaderBlock updates the data for all Shaders using the block, so you
      don't need to go around setting the same uniforms in lots of different shaders.

    On systems that support compute shaders, ShaderBlocks can optionally be "writable".  A writable
    ShaderBlock is a little bit slower than a non-writable one, but shaders can modify its contents
    and it can be much, much larger than a non-writable ShaderBlock.
  ]],
  constructor = 'lovr.graphics.newShaderBlock',
  example = [=[
    function lovr.load()
      -- Create a ShaderBlock to store positions for 1000 models
      block = lovr.graphics.newShaderBlock({
        modelPositions = { 'mat4', 1000 }
      }, { writable = false, usage = 'static' })

      -- Write some random transforms to the block
      local transforms = {}
      for i = 1, 1000 do
        local transform = lovr.math.newTransform()

        local x = lovr.math.randomNormal(10)
        local y = lovr.math.randomNormal(10)
        local z = lovr.math.randomNormal(10)
        transform:translate(x, y, z)
        local angle = lovr.math.random() * 2 * math.pi
        local ax, ay, az = lovr.math.random(), lovr.math.random(), lovr.math.random()
        transform:rotate(angle, ax, ay, az)

        transforms[i] = transform
      end

      -- Create the shader, injecting the shader code for the block
      shader = lovr.graphics.newShader(
        block:getShaderCode('ModelBlock') .. [[
        vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
          return projection * lovrTransform * modelPositions[gl_InstanceID] * vertex;
        }
      ]])

      -- Bind the block to the shader
      shader:sendBlock('ModelBlock', block)

      model = lovr.graphics.newModel('monkey.obj')
    end

    -- Draw the model 1000 times, using positions from the shader block
    function lovr.draw()
      lovr.graphics.setShader(shader)
      model:drawInstanced(1000)
      lovr.graphics.setShader()
    end
  ]=]
}

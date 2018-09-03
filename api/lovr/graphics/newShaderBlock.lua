return {
  tag = 'graphicsObjects',
  summary = 'Create a new ShaderBlock.',
  description = [[
    Creates a new ShaderBlock from a table of variable definitions with their names and types.
  ]],
  arguments = {
    {
      name = 'uniforms',
      type = 'table',
      description = [[
        A table where the keys are uniform names and the values are uniform types.  Uniform arrays
        can be specified by supplying a table as the uniform's value containing the type and the
        array size.
      ]]
    },
    {
      name = 'flags',
      type = 'table',
      default = '{}',
      description = 'Optional settings.',
      table = {
        {
          name = 'usage',
          type = 'BufferUsage',
          default = 'dynamic',
          description = 'How the data in the block will be updated.'
        },
        {
          name = 'writable',
          type = 'boolean',
          default = 'false',
          description = 'Whether Shaders can write to the data in the block.'
        }
      }
    }
  },
  returns = {
    {
      type = 'ShaderBlock',
      description = 'The new ShaderBlock.'
    }
  },
  notes = [[
    The writable flag can only be true if compute shaders are supported, see
    `lovr.graphics.getSupported`.  Writable blocks may be slightly slower than non-writable blocks,
    but they can also be much, much larger.  Non-writable blocks are usually limited to around 16
    kilobytes in size, depending on hardware.
  ]],
  example = {
    description = 'Create a ShaderBlock to hold a block of useful shader data.',
    code = [=[
      function lovr.load()
        block = lovr.graphics.newShaderBlock({
          time = 'float',
          lightCount = 'int',
          lightPositions = { 'vec3', 16 },
          lightColors = { 'vec3', 16 },
          objectCount = 'int',
          objectTransforms = { 'mat4', 256 }
        })

        shader = lovr.graphics.newShader(
          block:getShaderCode('Block') .. -- Define the block in the shader
          [[
            vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
              // ...use the object transforms from the block
              return projection * transform * vertex;
            }
          ]],

          block:getShaderCode('Block') ..
          [[
            vec4 color(vec4 gColor, sampler2D image, vec2 uv) {
              // ...use the lights from the block
              return gColor * texture(image, uv);
            }
          ]]
        )

        -- Bind the block to the shader
        shader:sendBlock('Block', block)
      end

      -- Update the data in the block every frame
      function lovr.update(dt)
        block:send('time', lovr.timer.getTime())
        block:send('lightCount', lightCount)
        block:send('lightPositions', { { x, y, z}, { x, y, z } })
        -- etc.
      end
    ]=]
  },
  related = {
    'lovr.graphics.newShader',
    'lovr.graphics.newComputeShader'
  }
}

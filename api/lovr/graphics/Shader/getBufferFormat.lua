return {
  summary = 'Get the format of a buffer in the Shader.',
  description = [[
    Returns the format of a uniform or storage buffer in the shader.  This matches the same syntax
    used by `lovr.graphics.newBuffer`, so it can be passed there to quickly create a Buffer that
    matches a variable in a Shader.
  ]],
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the buffer variable to return the format of.'
    }
  },
  returns = {
    format = {
      type = 'table',
      description = 'The x size of a workgroup.'
    },
    length = {
      type = 'number',
      description = 'The length of the array (or 1 if the variable is not an array).'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'format', 'length' }
    }
  },
  notes = [=[
    If the buffer only has a single array field, the format will be "unwrapped" to an array instead
    of a single-field struct with an array in it.  Example:

    ```
    shader = lovr.graphics.newShader([[
      layout(set = 0, binding = 0) buffer Numbers {
        uint numbers[64];
      };

      void lovrmain(){}
    ]])

    shader:getBufferFormat('Numbers')
    -- returns {{ name = 'numbers', type = 'u32' }}, 64
    -- not     {{ name = 'numbers', type = 'u32', length = 64 }}, 1
    ```

    Similarly, if the buffer only has a single struct field, the format will be "unwrapped" to the
    inner struct.  This lets you use a struct for a Buffer's data without having to wrap everything
    in an extra namespace.  Example:

    ```
    shader = lovr.graphics.newShader([[
      struct HandParams {
        vec3 position;
        float trigger;
      };

      layout(set = 0, binding = 0) buffer Hand {
        HandParams params;
      };

      void lovrmain(){}
    ]])

    shader:getBufferFormat('Hand')
    -- returns {{ name = 'position', type = 'vec3' }, { name = 'trigger', type = 'float' }}, 1
    -- not     {{ name = 'params', type = {...}}}, 1
    ```
  ]=],
  example = [=[
    shader = lovr.graphics.newShader([[
      layout(set = 2, binding = 0) uniform Transforms {
        mat4 transforms[32];
      };

      vec4 lovrmain() {
        return Projection * View * transforms[InstanceIndex] * VertexPosition;
      }
    ]], 'unlit')

    local format, length = shader:getBufferFormat('Transforms')
    print(length) --> 32
    print(format[1].name) --> 'transforms'
    print(format[1].type) --> 'mat4'

    -- Can pass the 2 results directly to newBuffer:
    transforms = lovr.graphics.newBuffer(shader:getBufferFormat('Transforms'))

    -- Or override the length with some initial data:
    transforms = lovr.graphics.newBuffer(shader:getBufferFormat('Transforms'), objects)
  ]=],
  related = {
    'lovr.graphics.newBuffer',
    'Buffer:getFormat'
  }
}

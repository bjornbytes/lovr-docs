return {
  summary = 'Update a uniform variable in the Shader.',
  description = 'Updates a uniform variable in the Shader.',
  arguments = {
    {
      name = 'uniform',
      type = 'string',
      description = 'The name of the uniform to update.'
    },
    {
      name = 'value',
      type = '*',
      description = 'The new value of the uniform.'
    }
  },
  returns = {},
  notes = [[
    The shader does not need to be active to update its uniforms.

    The following type combinations are supported:

    <table>
      <thead>
        <tr>
          <td>Uniform type</td>
          <td>LÖVR type</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>float</code></td>
          <td><code>number</code></td>
        </tr>
        <tr>
          <td><code>int</code></td>
          <td><code>number</code></td>
        </tr>
        <tr>
          <td><code>vec2</code></td>
          <td><code>{ x, y }</code></td>
        </tr>
        <tr>
          <td><code>vec3</code></td>
          <td><code>{ x, y, z }</code> or <code>vec3</code></td>
        </tr>
        <tr>
          <td><code>vec4</code></td>
          <td><code>{ x, y, z, w }</code></td>
        </tr>
        <tr>
          <td><code>ivec2</code></td>
          <td><code>{ x, y }</code></td>
        </tr>
        <tr>
          <td><code>mat2</code></td>
          <td>{ x, y, ... }</td>
        </tr>
        <tr>
          <td><code>mat3</code></td>
          <td><code>{ x, y, z, ... }</code></td>
        </tr>
        <tr>
          <td><code>mat4</code></td>
          <td><code>{ x, y, z, w, ... }</code> or <code>mat4</code></td>
        </tr>
        <tr>
          <td><code>sampler</code></td>
          <td><code>Texture</code></td>
        </tr>
        <tr>
          <td><code>image</code></td>
          <td><code>Texture</code></td>
        </tr>
      </tbody>
    </table>

    Uniform arrays can be wrapped in tables or passed as multiple arguments.

    Textures must match the type of sampler or image they are being sent to.

    The following sampler (and image) types are currently supported:

    - `sampler2D`
    - `sampler3D`
    - `samplerCube`
    - `sampler2DArray`

    An error is thrown if the uniform does not exist or is not used in the shader.  The
    `Shader:hasUniform` function can be used to check if a uniform variable exists.

    `Blob`s can be used to pass arbitrary binary data to Shader variables.
  ]],
  example = {
    description = 'Updating a `vec3` uniform:',
    code = [=[
      function lovr.load()
        shader = lovr.graphics.newShader [[
          uniform vec3 offset;
          vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
            vertex.xyz += offset;
            return projection * transform * vertex;
          }
        ]]

        shader:send('offset', { .3, .7, 0 })
      end
    ]=]
  },
  related = {
    'ShaderBlock:sendBlock',
    'Shader:sendBlock'
  }
}

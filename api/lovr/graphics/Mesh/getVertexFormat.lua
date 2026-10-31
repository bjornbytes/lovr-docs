return {
  summary = 'Get the vertex format of the Mesh.',
  description = [[
    Returns the vertex format of the Mesh, which is a list of "attributes" that make up the data for
    each vertex (position, color, UV, etc.).
  ]],
  arguments = {},
  returns = {
    format = {
      type = '{{string | DataType | number}}',
      description = [[
        The vertex format.  Each attribute is a table `{ name, type, offset }`, where the name is a
        string, the type is the `DataType` of the attribute, and the offset is a number indicating
        the byte offset of the attribute.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'format' }
    }
  },
  notes = [[
    If no vertex format is given when the Mesh is created, it will use a default format:

        {
          { 'VertexPosition', 'vec3', 0 },
          { 'VertexNormal', 'vec3', 12 },
          { 'VertexUV', 'vec2', 24 }
        }

    The name of the vertex attribute corresponds to an `in` input variable in a vertex shader.

    There are a few built-in attributes that all shaders will understand and use by default:

    <table>
      <thead>
        <tr>
          <td>Name</td>
          <td>Description</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>VertexPosition</code></td>
          <td>The position of the vertex.</td>
        </tr>
        <tr>
          <td><code>VertexNormal</code></td>
          <td>The normal vector of the vertex.</td>
        </tr>
        <tr>
          <td><code>VertexUV</code></td>
          <td>The texture coordinate of the vertex.</td>
        </tr>
        <tr>
          <td><code>VertexUV2</code></td>
          <td>The second texture coordinate of the vertex (often used for lightmapping).</td>
        </tr>
        <tr>
          <td><code>VertexColor</code></td>
          <td>The color of the vertex (linear color space).</td>
        </tr>
        <tr>
          <td><code>VertexTangent</code></td>
          <td>The tangent vector of the vertex.</td>
        </tr>
      </tbody>
    </table>

    See the `Shaders` and `Meshes` guides for more info.
  ]],
  related = {
    'Mesh:getVertexCount',
    'Mesh:getVertexStride',
    'lovr.graphics.newMesh'
  }
}

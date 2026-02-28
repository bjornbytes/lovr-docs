return {
  summary = 'Built-in Shader flags.',
  description = [[
    Built-in shader flags.  Shaders can use both user-created specialization constants (or simply
    "flags") alongside the following built-in ones.
  ]],
  values = {
    {
      name = 'pointSize',
      description = 'The point size when drawing points with e.g. `Pass:points`, in pixels.'
    },
    {
      name = 'passColor',
      description = [[
        Multiply the pass color (`Pass:setColor`) into the `Color` variable sent to the fragment
        shader.
      ]]
    },
    {
      name = 'materialColor',
      description = [[
        Multiply the material color (`Pass:setMaterial`) into the `Color` variable sent to the
        fragment shader.
      ]]
    },
    {
      name = 'vertexColors',
      description = [[
        Multiply the vertex color (from the `VertexColor` attribute) into the `Color` variable sent
        to the fragment shader.
      ]]
    },
    {
      name = 'uvTransform',
      description = 'Apply the UV transform from the material to the `VertexUV` attribute.'
    },
    {
      name = 'alphaCutoff',
      description = [[
        Enable alpha cutoff.  When enabled, pixels will be discarded if their alpha is less than the
        `alphaCutoff` value of the material.
      ]]
    },
    {
      name = 'glow',
      description = [[
        Enable glow.  When enabled, the Material\'s `glowTexture` and `glow` property will get added
        to the color of the pixel returned by `lovrmain`.  This is also called an "emissive" texture
        and is used for parts of an object that give off light, like an LED screen or the headlights
        on a car.
      ]]
    },
    {
      name = 'normalMap',
      description = [[
        Use the normal map texture in the material to affect the normal direction of surfaces.  This
        only affects the `normal` variable in the `Surface` struct.
      ]]
    },
    {
      name = 'vertexTangents',
      description = [[
        Use the vertex tangents of the model for normal mapping.  When this is `false`, tangents
        will be computed in the fragment shader from the vertex positions, UVs, and normal vector.
      ]]
    },
    {
      name = 'colorTexture',
      description = [[
        Use the color texture of the material.  If this is `false`, the color will only be derived
        from the `Color` variable (pass color, material color, vertex color), and the color texture
        will be ignored.
      ]]
    },
    {
      name = 'glowTexture',
      description = [[
        Sample the `glowTexture` of the material when applying glow.  Note that glow is only active
        when the `glow` flag is also enabled.  If this is false, then materials will give off a
        constant glow using their `glow` property, and the glow texture is ignored.
      ]]
    },
    {
      name = 'metalnessTexture',
      description = [[
        Sample the blue channel of the material's metalness texture when computing the metalness
        value of a `Surface`. When false, the surface will have a constant metalness based on the
        material's `metalness` property, instead of using a texture.
      ]]
    },
    {
      name = 'roughnessTexture',
      description = [[
        Sample the green channel of the material's roughness texture when computing the roughness
        value of a `Surface`. When false, the surface will have a constant roughness based on the
        material's `roughness` property, instead of using a texture.
      ]]
    },
    {
      name = 'ambientOcclusion',
      description = [[
        Sample the red channel of the `occlusionTexture` of the material to compute the occlusion
        property of a `Surface`.  When false, the occlusion will be `1.0` (no occlusion).
      ]]
    },
    {
      name = 'clearcoatTexture',
      description = [[
        Sample the red channel of the material's `clearcoatTexture` to compute the `clearcoat`
        property of a `Surface`.  When false, only the `clearcoat` property of the material will be
        used, and the texture will be ignored.
      ]]
    },
    {
      name = 'tonemap',
      description = [[
        Apply ACES tonemapping to the final color output.  This will compress color channel values
        down to the 0-1 range while attempting to preserve detail in highlights and shadows.
      ]]
    },
  },
  notes = [[
    The types and default values for the flags are:

    <table>
      <thead>
        <tr>
          <td>Flag</td>
          <td>Type</td>
          <td>Default</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><code>pointSize</code></td>
          <td><code>float</code></td>
          <td><code>1.0</code></td>
        </tr>
        <tr>
          <td><code>passColor</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>materialColor</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>vertexColors</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>uvTransform</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>alphaCutoff</code></td>
          <td><code>boolean</code></td>
          <td><code>false</code></td>
        </tr>
        <tr>
          <td><code>glow</code></td>
          <td><code>boolean</code></td>
          <td><code>false</code></td>
        </tr>
        <tr>
          <td><code>normalMap</code></td>
          <td><code>boolean</code></td>
          <td><code>false</code></td>
        </tr>
        <tr>
          <td><code>vertexTangents</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>colorTexture</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>glowTexture</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>metalnessTexture</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>roughnessTexture</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>ambientOcclusion</code></td>
          <td><code>boolean</code></td>
          <td><code>true</code></td>
        </tr>
        <tr>
          <td><code>clearcoatTexture</code></td>
          <td><code>boolean</code></td>
          <td><code>false</code></td>
        </tr>
        <tr>
          <td><code>tonemap</code></td>
          <td><code>boolean</code></td>
          <td><code>false</code></td>
        </tr>
      </tbody>
    </table>

  ]],
  related = {
    'lovr.graphics.newShader',
    'Shader:clone'
  }
}

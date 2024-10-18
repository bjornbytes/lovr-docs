Shaders
===

Shaders are small GPU programs that can be used to customize rendering or perform arbitrary
computation.  This guide explains how shaders work in LÖVR.

GLSL
---

Shaders are written in GLSL.  GLSL is a lower-level language than Lua, so shaders are a bit harder
to learn at first.  Explaining GLSL is outside the scope of these docs, but some good ways to learn
it are:

- The [OpenGL wiki](https://www.khronos.org/opengl/wiki/OpenGL_Shading_Language)
  is a good reference.
- Copying random shaders from the internet and changing them until they do interesting things is
  another recommended approach.

LÖVR uses GLSL version `4.60`.

Basics
---

There are 2 types of shaders, given by `ShaderType`:

- `graphics` shaders are used for rendering.  They compute vertex positions and pixel colors.
- `compute` shaders run in compute passes.  They can perform arbitrary GPU computation.

Shaders have one or more "stages", which are basically functions, given by `ShaderStage`:

- `graphics` shaders have 2 stages:
    - The `vertex` stage computes vertex positions.  It loads vertex data from meshes and applies
      transformations to get the final "on-screen" position for triangles.
    - The `fragment` stage computes pixel colors.  It uses material data to compute lighting and other
      effects, returning the final color of the pixel.
- `compute` shaders have a single `compute` stage.  It doesn't have any semantic meaning, instead
  performing arbitrary computation by writing to `Buffer` and `Texture` objects.

Each `Pass` has an **active shader** it uses to process draws.  `Pass:setShader` changes the active
shader.  The active shader will affect all draws until the shader is changed again. When the active
shader is `nil`, LÖVR will use a built-in shader based on the type of draw (`unlit` for meshes,
`font` for text, etc.).

The set of shaders built in to LÖVR are given by `DefaultShader`.

Writing Shaders
---

LÖVR uses the `lovrmain` function as the GLSL entrypoint. For vertex stages, `lovrmain` should
return the final transformed vertex position.  Here's the default vertex shader:

    vec4 lovrmain() {
      return Projection * View * Transform * VertexPosition;
    }

It can also be written using the `DefaultPosition` shorthand:

    vec4 lovrmain() {
      return DefaultPosition;
    }

The vertex position is multiplied by several matrices to get it into "normalized device
coordinates", which is the coordinate space the GPU uses internally to process vertices.

For fragment shaders, `lovrmain` should return the final color of the pixel.  Here's the default
fragment shader:

    vec4 lovrmain() {
      return Color * getPixel(ColorTexture, UV);
    }

It can also be written using the `DefaultColor` shorthand:

    vec4 lovrmain() {
      return DefaultColor;
    }

The default pixel color is calculated by multiplying the `Color` from the vertex stage (which
includes the vertex color, material color, and pass color) with a pixel sampled from the color
texture.

Compute shaders implement the `void lovrmain()` function, and don't return anything.

Shaders are created with `lovr.graphics.newShader`, with the code for each stage:

    shader = lovr.graphics.newShader([[
      vec4 lovrmain() {
        return DefaultPosition;
      }
    ]], [[
      vec4 lovrmain() {
        return DefaultColor;
      }
    ]])

The code can also be loaded from a filename or a `Blob`.  Also, a `DefaultShader` can be used for
the code of one or both of the stages:

    shader = lovr.graphics.newShader('vertex.glsl', 'unlit')

Shader Builtins
---

The following built-in variables and macros are available in vertex and fragment shaders:

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Type</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>PI</code></td>
      <td>float</td>
      <td></td>
    </tr>
    <tr>
      <td><code>TAU</code></td>
      <td>float</td>
      <td><code>(PI * 2)</code></td>
    </tr>
    <tr>
      <td><code>PI_2</code></td>
      <td>float</td>
      <td><code>(PI / 2)</code></td>
    </tr>
    <tr>
      <td><code>Resolution</code></td>
      <td>vec2</td>
      <td>The size of the render pass texture, in pixels.</td>
    </tr>
    <tr>
      <td><code>Time</code></td>
      <td>float</td>
      <td>Current time in seconds (<code>lovr.headset.getTime</code>).</td>
    </tr>
    <tr>
      <td><code>CameraPositionWorld</code></td>
      <td>vec3</td>
      <td>The position of the current view (<code>Pass:setViewPose</code>).</td>
    </tr>
    <tr>
      <td><code>Sampler</code></td>
      <td>sampler</td>
      <td>The default sampler (<code>Pass:setSampler</code>).</td>
    </tr>
  </tbody>
</table>

The following built-in variables are available only in vertex shaders:

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Type</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>VertexPosition</code></td>
      <td>vec4</td>
      <td>The local position of the current vertex.</td>
    </tr>
    <tr>
      <td><code>VertexNormal</code></td>
      <td>vec3</td>
      <td>The normal vector of the current vertex.</td>
    </tr>
    <tr>
      <td><code>VertexUV</code></td>
      <td>vec2</td>
      <td>The texture coordinate of the current vertex.</td>
    </tr>
    <tr>
      <td><code>VertexColor</code></td>
      <td>vec4</td>
      <td>The color of the current vertex.</td>
    </tr>
    <tr>
      <td><code>VertexTangent</code></td>
      <td>vec4</td>
      <td>The tangent vector of the current vertex (w is sign of tangent basis).</td>
    </tr>
    <tr>
      <td><code>Projection</code></td>
      <td>mat4</td>
      <td>The projection matrix of the current view (<code>Pass:setProjection</code>).</td>
    </tr>
    <tr>
      <td><code>View</code></td>
      <td>mat4</td>
      <td>The view matrix of the current view (<code>Pass:setViewPose</code>).</td>
    </tr>
    <tr>
      <td><code>ViewProjection</code></td>
      <td>mat4</td>
      <td>The projection matrix multiplied with the view matrix.</td>
    </tr>
    <tr>
      <td><code>InverseProjection</code></td>
      <td>mat4</td>
      <td>The inverse of the projection matrix.</td>
    </tr>
    <tr>
      <td><code>Transform</code></td>
      <td>mat4</td>
      <td>The model matrix (includes transform stack and draw transform).</td>
    </tr>
    <tr>
      <td><code>NormalMatrix</code></td>
      <td>mat3</td>
      <td>Transforms normal vectors from local space to world space.</td>
    </tr>
    <tr>
      <td><code>ClipFromLocal</code></td>
      <td>mat4</td>
      <td>Transforms from local space to clip space (<code>Projection * View * Transform</code>).</td>
    </tr>
    <tr>
      <td><code>ClipFromWorld</code></td>
      <td>mat4</td>
      <td>Transforms from world space to clip space (<code>Projection * View</code>).</td>
    </tr>
    <tr>
      <td><code>ClipFromView</code></td>
      <td>mat4</td>
      <td>Transforms from view space to clip space (<code>Projection</code>).</td>
    </tr>
    <tr>
      <td><code>ViewFromLocal</code></td>
      <td>mat4</td>
      <td>Transforms from local space to view space (<code>View * Transform</code>).</td>
    </tr>
    <tr>
      <td><code>ViewFromWorld</code></td>
      <td>mat4</td>
      <td>Transforms from world space to view space (<code>View</code>).</td>
    </tr>
    <tr>
      <td><code>ViewFromClip</code></td>
      <td>mat4</td>
      <td>Transforms from clip space to view space (<code>InverseProjection</code>).</td>
    </tr>
    <tr>
      <td><code>WorldFromLocal</code></td>
      <td>mat4</td>
      <td>Transforms from local space to world space (<code>Transform</code>).</td>
    </tr>
    <tr>
      <td><code>WorldFromView</code></td>
      <td>mat4</td>
      <td>Transforms from view space to world space (<code>inverse(View)</code>).</td>
    </tr>
    <tr>
      <td><code>WorldFromClip</code></td>
      <td>mat4</td>
      <td>Transforms from clip space to world space (<code>inverse(ViewProjection)</code>).</td>
    </tr>
    <tr>
      <td><code>PassColor</code></td>
      <td>vec4</td>
      <td>The color set with <code>Pass:setColor</code>.</td>
    </tr>
  </tbody>
</table>

The following built-in variables and macros are available only in fragment shaders:

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Type</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>PositionWorld</code></td>
      <td>vec3</td>
      <td>The position of the pixel, in world space.</td>
    </tr>
    <tr>
      <td><code>Normal</code></td>
      <td>vec3</td>
      <td>The normal vector of the pixel, in world space.</td>
    </tr>
    <tr>
      <td><code>Color</code></td>
      <td>vec4</td>
      <td>The vertex, material, and pass colors multiplied together.</td>
    </tr>
    <tr>
      <td><code>UV</code></td>
      <td>vec2</td>
      <td>The texture coordinate of the current pixel.</td>
    </tr>
    <tr>
      <td><code>Tangent</code></td>
      <td>vec3</td>
      <td>The tangent vector of the current pixel, in world space.</td>
    </tr>
    <tr>
      <td><code>TangentMatrix</code></td>
      <td>mat3</td>
      <td>The tangent matrix, used for normal mapping.</td>
    </tr>
  </tbody>
</table>

The properties of the active material, set using `Pass:setMaterial`, can be accessed in vertex and
fragment shaders.  Textures can be sampled using the `getPixel` helper function.  The `Material` and
`lovr.graphics.newMaterial` pages have more info on these properties.

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Type</td>
      <td>Notes</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Material.color</code></td>
      <td>vec4</td>
      <td>The material color.</td>
    </tr>
    <tr>
      <td><code>Material.glow</code></td>
      <td>vec4</td>
      <td>The material glow color (alpha is glow strength).</td>
    </tr>
    <tr>
      <td><code>Material.uvShift</code></td>
      <td>vec2</td>
      <td>The material UV shift.</td>
    </tr>
    <tr>
      <td><code>Material.uvScale</code></td>
      <td>vec2</td>
      <td>The material UV scale.</td>
    </tr>
    <tr>
      <td><code>Material.metalness</code></td>
      <td>float</td>
      <td>The material metalness.</td>
    </tr>
    <tr>
      <td><code>Material.roughness</code></td>
      <td>float</td>
      <td>The material roughness.</td>
    </tr>
    <tr>
      <td><code>Material.clearcoat</code></td>
      <td>float</td>
      <td>The material clearcoat factor.</td>
    </tr>
    <tr>
      <td><code>Material.clearcoatRoughness</code></td>
      <td>float</td>
      <td>The roughness of the clearcoat layer.</td>
    </tr>
    <tr>
      <td><code>Material.occlusionStrength</code></td>
      <td>float</td>
      <td>The strength of the occlusion texture.</td>
    </tr>
    <tr>
      <td><code>Material.normalScale</code></td>
      <td>float</td>
      <td>The strength of the normal map texture.</td>
    </tr>
    <tr>
      <td><code>Material.alphaCutoff</code></td>
      <td>float</td>
      <td>The alpha cutoff.</td>
    </tr>
    <tr>
      <td><code>ColorTexture</code></td>
      <td>texture2D</td>
      <td>The color texture.</td>
    </tr>
    <tr>
      <td><code>GlowTexture</code></td>
      <td>texture2D</td>
      <td>The glow texture.</td>
    </tr>
    <tr>
      <td><code>OcclusionTexture</code></td>
      <td>texture2D</td>
      <td>The ambient occlusion texture.</td>
    </tr>
    <tr>
      <td><code>MetalnessTexture</code></td>
      <td>texture2D</td>
      <td>The metalness texture.</td>
    </tr>
    <tr>
      <td><code>RoughnessTexture</code></td>
      <td>texture2D</td>
      <td>The roughness texture.</td>
    </tr>
    <tr>
      <td><code>ClearcoatTexture</code></td>
      <td>texture2D</td>
      <td>The clearcoat texture.</td>
    </tr>
    <tr>
      <td><code>NormalTexture</code></td>
      <td>texture2D</td>
      <td>The normal map.</td>
    </tr>
  </tbody>
</table>

Shader Inputs
---

It's also possible to send values or objects from Lua to a Shader.  There are a few different ways
to do this, each with their own tradeoffs (speed, size, ease of use, etc.).

### Constants

Shaders can declare constants, which can be booleans, numbers, vectors, or matrices.  There is a
very limited amount of space for constants (usually 128 or 256 bytes, depends on the GPU), but they
are very easy and inexpensive to update.

Constants are declared in shader code in a `Constants` block, then individual constants are modified
from Lua using `Pass:send`:

    function lovr.load()
      shader = lovr.graphics.newShader('unlit', [[
        Constants {
          vec4 color1;
          vec4 color2;
        };

        // Apply a vertical gradient using the 2 colors from the constants:

        vec4 lovrmain() {
          return mix(color1, color2, dot(Normal, vec3(0, 1, 0)) * .5 + .5);
        }
      ]])
    end

    function lovr.draw(pass)
      pass:setShader(shader)

      pass:send('color1', { 1, 0, 1, 1 })
      pass:send('color2', { 0, 1, 1, 1 })

      pass:sphere(0, 1.7, -2)
    end

The vertex and fragment stages share the constants block, so they should match or one should be a
subset of the other.

When the active shader is changed, constants will be preserved.

### Vertex Attributes

Vertex attributes are the data for each vertex of a mesh.  They should be used for data that varies
on a per-vertex basis.  Attributes have a name, a type, and a location (an integer ID).  LÖVR uses
the following default vertex attributes for shapes and meshes:

<table>
  <thead>
    <tr>
      <td>Name</td>
      <td>Type</td>
      <td>Location</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>VertexPosition</td>
      <td>vec4</td>
      <td>10</td>
    </tr>
    <tr>
      <td>VertexNormal</td>
      <td>vec3</td>
      <td>11</td>
    </tr>
    <tr>
      <td>VertexUV</td>
      <td>vec2</td>
      <td>12</td>
    </tr>
    <tr>
      <td>VertexColor</td>
      <td>vec4</td>
      <td>13</td>
    </tr>
    <tr>
      <td>VertexTangent</td>
      <td>vec3</td>
      <td>14</td>
    </tr>
  </tbody>
</table>

Custom vertex attributes can be declared for locations 0 through 9:

    layout(location = 3) in vec3 customAttribute;

The data in a buffer can then be associated with the attribute, either by name:

    vertices = lovr.graphics.newBuffer(vertexCount, {
      { type = 'vec3', name = 'customAttribute' }
    })

Or by location:

    vertices = lovr.graphics.newBuffer(vertexCount, {
      { type = 'vec3', location = 3 }
    })

### Buffers

Shaders can access data in `Buffer` objects.  Buffers can store large arrays of data from Lua tables
or Blobs.  The GPU can also write to buffers using compute shaders.

Data in buffers can be accessed in 2 ways:

- **Uniform** buffers have a smaller size limit, may be faster, and are read-only in shaders.
- **Storage** buffers have a large size limit, may be slower, and compute shaders can write to them.

First, the buffer should be declared in the shader.  Here's an example declaring a uniform buffer:

    layout(set = 2, binding = 0) uniform Colors {
      vec4 colors[100];
    };

And an example storage buffer:

    layout(set = 2, binding = 0) buffer Colors {
      vec4 colors[100];
    };

The first part declares the set and binding of the variable.  Right now the set should always be 2
(LÖVR uses set 0 and 1 internally).  The binding is a number that can be used to identify the
variable.  After that, `uniform` or `buffer` is used to declare which type of buffer it is, followed
by the name of the variable.  Finally, there is a block declaring the format of the data in the
buffer, which should match the format used to create the Buffer in Lua (structs can be used if the
buffer has multiple fields per element).

A Buffer can be sent to one of the above variables like this:

    -- palette is a table with 100 colors in it
    buffer = lovr.graphics.newBuffer('vec4', palette)

    -- bind it to the shader later
    pass:send('Colors', buffer)

The shader can then use the `colors` array to access the data from the `palette` table.

It's possible to bind a subset of a buffer to the shader by passing the range as extra arguments to
`Pass:send`.

### Textures

Shaders can also access data from `Texture` objects.  Similar to buffers, textures can be accessed
in 2 ways:

- Sampled textures are read-only, and can use `Sampler` objects.
- Storage textures can be written to using compute shaders.

Sampled textures are declared like this:

    layout(set = 2, binding = 0) uniform texture2D myTexture;

The texture type can be `texture2D`, `textureCube`, `texture2DArray`, or `texture3D` (see
`TextureType`).

Storage textures are declared like this:

    layout(set = 2, binding = 0) uniform image2D myImage;

A texture can be sent to the shader variable using `Pass:send`.

The `getPixel` helper function can be used to sample from a texture:

    getPixel(myTexture, UV)

This will sample from the texture using the UV coordinates and the default sampler set using
`Pass:setSampler`.  It's the same as writing this for 2D textures:

    texture(sampler2D(myTexture, Sampler), UV)

It's also possible to declare a custom sampler variable and use it to sample textures:

    layout(set = 2, binding = 0) uniform sampler mySampler;

    // texture(sampler2D(myTexture, mySampler), UV)

A `Sampler` object can be sent to the shader using `Pass:send`, similar to buffers and textures.

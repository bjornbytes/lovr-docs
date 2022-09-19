Shaders
===

Shaders are small GPU programs that can be used to customize rendering or perform arbitrary
computation.  This guide explains how shaders work in LÖVR.

GLSL
---

Shaders are written in GLSL.  GLSL is a lower-level language than Lua, so shaders are a bit harder
to learn at first.  Explaining GLSL is outside the scope of these docs, but some good ways to learn
it are:

- The [OpenGL wiki](https://www.khronos.org/opengl/wiki/OpenGL_Shading_Languagehttps://www.khronos.org/opengl/wiki/OpenGL_Shading_Language)
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

Shader Inputs
---

It's possible to send values or objects from Lua to a Shader.  There are a few different ways to do
this, each with their own tradeoffs (speed, size, ease of use, etc.).

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
      <td>`vec4`</td>
      <td>10</td>
    </tr>
    <tr>
      <td>VertexNormal</td>
      <td>`vec3`</td>
      <td>11</td>
    </tr>
    <tr>
      <td>VertexUV</td>
      <td>`vec2`</td>
      <td>12</td>
    </tr>
    <tr>
      <td>VertexColor</td>
      <td>`vec4`</td>
      <td>13</td>
    </tr>
    <tr>
      <td>VertexTangent</td>
      <td>`vec4`</td>
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

### Objects

- syntax
- :send
- limits
- dirtying

### Materials

### Flags

Built-ins
---

### Variables
### Flags

SPIR-V
---

Descriptor Set Interface
---

return {
  summary = 'GPU program.',
  description = [=[
    A Shader is a small program written in GLSL that runs on the GPU during drawing.

    GLSL
    ---

    GLSL is a lower-level language than Lua, so shaders are a bit harder to learn at first.
    Explaining GLSL is outside the scope of these docs, but some good ways to learn it are:

    - The [OpenGL wiki](https://www.khronos.org/opengl/wiki/OpenGL_Shading_Languagehttps://www.khronos.org/opengl/wiki/OpenGL_Shading_Language) is a good reference.
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
      - The `fragment` stage computes pixel colors.  It uses material data to compute lighting and
        other effects, returning the final color of the pixel.
    - `compute` shaders have a single `compute` stage.  It doesn't have any semantic meaning,
      instead performing arbitrary computation by writing to `Buffer` and `Texture` objects.

    Each `Pass` has an **active shader** it uses to process draws.  To set the active shader, call
    `Pass:setShader`.  The active shader will affect all draws until the shader is changed again.
    When the active shader is `nil`, LÖVR will use a built-in shader based on the type of draw
    (`unlit` for meshes, `font` for text, etc.).

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

    The code can also be loaded from a filename or a `Blob`.  Also, a `DefaultShader` can be used
    for the code of one or both of the stages:

        shader = lovr.graphics.newShader('vertex.glsl', 'unlit')

    Shader Inputs
    ---

    ### Constants

    ### Vertex Attributes

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
  ]=],
  constructors = {
    'lovr.graphics.newShader',
    'Shader:clone'
  }
}

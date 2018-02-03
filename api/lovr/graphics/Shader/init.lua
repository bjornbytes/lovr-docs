return {
  summary = 'A GLSL program used for low-level control over rendering.',
  description = [[
    Shaders are GLSL programs that transform the way vertices and pixels show up on the screen.
    They can be used for lighting, postprocessing, particles, animation, and much more.  You can use
    `lovr.graphics.setShader` to change the active Shader.
  ]],
  constructor = 'lovr.graphics.newShader',
  notes = [[
    The current GLSL version used is 150.

    The default vertex shader:

        vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
          return projection * transform * vertex;
        }

    The default fragment shader:

        vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
          return graphicsColor * texture(image, uv);
        }

    Additionally, the following headers are prepended to the shader source, giving you convenient
    access to a default set of uniform variables and vertex attributes.

    Vertex shader header:

        uniform mat4 lovrModel;
        uniform mat4 lovrView;
        uniform mat4 lovrTransform;
        uniform mat4 lovrNormalMatrix;
        uniform mat4 lovrProjection;
        in vec3 lovrPosition;
        in vec3 lovrNormal;
        in vec2 lovrTexCoord;
        out vec2 texCoord;

    Fragment shader header:

        uniform vec4 lovrColor;
        uniform sampler2D lovrTexture;
        in vec2 texCoord;
        in vec4 gl_FragCoord;
        out vec4 lovrFragColor;
  ]],
  example = {
    description = 'Set a simple shader that colors pixels based on vertex normals.',
    code = [=[
      function lovr.load()
        lovr.graphics.setShader(lovr.graphics.newShader([[
          out vec3 vNormal; // This gets passed to the fragment shader

          vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
            vNormal = lovrNormal;
            return projection * transform * vertex;
          }
        ]], [[
          in vec3 vNormal; // This gets passed from the vertex shader

          vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
            return vec4(vNormal * .5 + .5, 1.0);
          }
        ]]))

        model = lovr.graphics.newModel('model.fbx')
      end

      function lovr.draw()
        model:draw(x, y, z, 1)
      end
    ]=]
  }
}

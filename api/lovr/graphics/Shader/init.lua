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
          return graphicsColor * lovrDiffuseColor * vertexColor * texture(image, uv);
        }

    Additionally, the following headers are prepended to the shader source, giving you convenient
    access to a default set of uniform variables and vertex attributes.

    Vertex shader header:

        uniform mat4 lovrModel;
        uniform mat4 lovrView;
        uniform mat4 lovrProjection;
        uniform mat4 lovrTransform; // Model-View matrix
        uniform mat4 lovrNormalMatrix;
        uniform mat4 lovrViews[2];  // View matrices for both eyes
        uniform mat4 lovrTransforms[2]; // Model-View matrices for both eyes
        uniform mat4 lovrProjections[2]; // Projection matrices for both eyes
        uniform mat4 lovrNormalMatrices[2]; // Normal matrices for both eyes
        uniform float lovrPointSize;
        uniform mat4 lovrPose[48];
        uniform int lovrIsStereo;
        in vec3 lovrPosition;
        in vec3 lovrNormal;
        in vec2 lovrTexCoord;
        in vec4 lovrVertexColor;
        in vec3 lovrTangent;
        in ivec4 lovrBones;
        in vec4 lovrBoneWeights;
        out vec2 texCoord;
        out vec4 vertexColor;
        flat out int lovrEye;

    Additionally, the `lovrInstanceID` variable should be used to get the current instance ID when
    using instanced rendering.

    Fragment shader header:

        uniform float lovrMetalness;
        uniform float lovrRoughness;
        uniform vec4 lovrColor;
        uniform vec4 lovrDiffuseColor;
        uniform vec4 lovrEmissiveColor;
        uniform sampler2D lovrDiffuseTexture;
        uniform sampler2D lovrEmissiveTexture;
        uniform sampler2D lovrMetalnessTexture;
        uniform sampler2D lovrRoughnessTexture;
        uniform sampler2D lovrOcclusionTexture;
        uniform sampler2D lovrNormalTexture;
        uniform samplerCube lovrEnvironmentTexture;
        in vec2 texCoord;
        in vec4 vertexColor;
        flat in int lovrEye;
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

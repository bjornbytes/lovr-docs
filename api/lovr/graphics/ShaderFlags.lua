return {
  summary = 'Built-in Shader flags.',
  description = 'Built-in shader flags. Shaders can use both user-created specialization constants (or simply "flags") alongside the following built-in ones.',
  values = {
    {
      name = 'pointSize',
      description = '(flag ID = 1000, default value = 1.f) Defines the point size in pixels when using "pass:points".'
    },
    {
      name = 'passColor',
      description = '(flag ID = 1002, default value = true) Use the pass color defined by "pass:setColor".'
    },
	{
      name = 'materialColor',
      description = '(flag ID = 1003, default value = true) Use the base color of the material.'
    },
    {
      name = 'vertexColors',
      description = '(flag ID = 1004, default value = true) Use the color contribution from the vertex colors.'
    },
    {
      name = 'uvTransform',
      description = '(flag ID = 1005, default value = true) TODO.'
    },
    {
      name = 'alphaCutoff',
      description = '(flag ID = 1006, default value = false) TODO.'
    },
    {
      name = 'glow',
      description = '(flag ID = 1007, default value = false) TODO.'
    },
    {
      name = 'normalMap',
      description = '(flag ID = 1008, default value = false) Use the normal map of the material.'
    },
    {
      name = 'vertexTangents',
      description = '(flag ID = 1009, default value = true) Use the vertex tangents of the model.'
    },
    {
      name = 'colorTexture',
      description = '(flag ID = 1010, default value = true) Use the color texture of the material.'
    },
    {
      name = 'glowTexture',
      description = '(flag ID = 1011, default value = true) Use the glow texture of the material.'
    },
    {
      name = 'metalnessTexture',
      description = '(flag ID = 1012, default value = true) Use the metalness texture of the material.'
    },
    {
      name = 'roughnessTexture',
      description = '(flag ID = 1013, default value = true) Use the roughness texture of the material.'
    },
    {
      name = 'ambientOcclusion',
      description = '(flag ID = 1014, default value = true) TODO.'
    },
    {
      name = 'clearcoatTexture',
      description = '(flag ID = 1015, default value = false) Use the clearcoat texture of the material.'
    },
    {
      name = 'tonemap',
      description = '(flag ID = 1016, default value = false) Use tonemap.'
    },
  },
  related = {
    'lovr.graphics.newShader'
  }
}
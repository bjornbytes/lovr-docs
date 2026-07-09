return {
  tag = 'graphics-objects',
  summary = 'Create a new Model.',
  description = [[
    Loads a 3D model from a file.  Currently, OBJ, glTF, and binary STL files are supported.
  ]],
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing 3D model data to import.'
    },
    modelData = {
      type = 'ModelData',
      description = 'An existing ModelData object to use for the Model.'
    },
    options = {
      type = 'table?',
      description = 'An optional table of Model options.',
      table = {
        {
          name = 'mipmaps',
          type = 'boolean?',
          default = 'true',
          description = 'Whether the textures created for the Model should have mipmaps generated.'
        },
        {
          name = 'materials',
          type = 'boolean?',
          default = 'true',
          description = [[
            Whether the textures and materials in the Model should be loaded.  When false, the
            model will use the material set with `Pass:setMaterial`, although it will apply to all
            nodes.
          ]]
        },
        {
          name = 'raytracer',
          type = 'table?',
          description = 'Optional raytracing options.',
          table = {
            {
              name = 'dynamic',
              type = 'boolean?',
              default = 'false',
              description = [[
                An optimization hint indicating that raytracing data will be frequently rebuilt.
                Set this to `false` for models that have static geometry.
              ]]
            },
            {
              name = 'fasttrace',
              type = 'boolean?',
              default = 'true',
              description = [[
                An optimization hint indicating that raytracing data should be optimized for fast
                tracing in shaders instead of fast rebuilds.
              ]]
            },
            {
              name = 'fastbuild',
              type = 'boolean?',
              default = 'false',
              description = [[
                An optimization hint indicating that raytracing data should be optimized for fast
                rebuilds instead of fast tracing.  If `fasttrace` and `fastbuild` are both set,
                `fasttrace` wins.
              ]]
            },
            {
              name = 'compress',
              type = 'boolean?',
              default = 'false',
              description = [[
                An optimization hint indicating that raytracing data should use less VRAM, possibly
                at the cost of performance.
              ]]
            }
          }
        }
      }
    }
  },
  returns = {
    model = {
      type = 'Model',
      description = 'The new Model.'
    }
  },
  variants = {
    {
      arguments = { 'file', 'options' },
      returns = { 'model' }
    },
    {
      arguments = { 'modelData', 'options' },
      returns = { 'model' }
    }
  },
  notes = [[
    Currently, the following features are not supported by the model importer:

    - glTF: Only the default scene is loaded.
    - glTF: Currently, each skin in a Model can have up to 256 joints.
    - glTF: Meshes can't appear multiple times in the node hierarchy with different skins, they need
      to use 1 skin consistently.
    - glTF: `KHR_texture_transform` is supported, but all textures in a material will use the same
      transform.
    - STL: ASCII STL files are not supported.

    Diffuse and emissive textures will be loaded using sRGB encoding, all other textures will be
    loaded as linear.

    Loading a model file will fail if the asset references textures or other files using absolute
    paths.  Relative paths should be used instead, and will be relative to the model file within the
    virtual filesystem.
  ]],
  related = {
    'lovr.data.newModelData',
    'Pass:draw'
  }
}

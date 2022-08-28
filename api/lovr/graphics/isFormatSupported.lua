return {
  tag = 'graphics-misc',
  summary = 'Check if a Texture format is supported.',
  description = 'TODO',
  arguments = {
    format = {
      type = 'TextureFormat',
      description = 'TODO'
    },
    {
      name = '...features',
      type = 'TextureFeature',
      description = 'TODO'
    }
  },
  returns = {
    supported = {
      type = 'boolean',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'format' },
      returns = { 'supported' }
    }
  },
  related = {
    'lovr.graphics.getDevice',
    'lovr.graphics.getFeatures',
    'lovr.graphics.getLimits'
  }
}

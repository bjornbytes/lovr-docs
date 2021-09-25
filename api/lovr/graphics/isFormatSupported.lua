return {
  summary = 'Check if a Texture format is supported.',
  description = 'TODO',
  arguments = {
    {
      name = 'format',
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
    {
      name = 'supported',
      type = 'boolean',
      description = 'TODO'
    }
  },
  related = {
    'lovr.graphics.getHardware',
    'lovr.graphics.getFeatures',
    'lovr.graphics.getLimits'
  }
}

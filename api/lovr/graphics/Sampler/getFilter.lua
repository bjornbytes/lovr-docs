return {
  summary = 'Get the filter mode of the Sampler.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'min',
      type = 'FilterMode',
      description = 'TODO'
    },
    {
      name = 'mag',
      type = 'FilterMode',
      description = 'TODO'
    },
    {
      name = 'mip',
      type = 'FilterMode',
      description = 'TODO'
    }
  },
  related = {
    'Sampler:getWrap',
    'Sampler:getCompareMode',
    'Sampler:getAnisotropy',
    'Sampler:getMipmapRange'
  }
}

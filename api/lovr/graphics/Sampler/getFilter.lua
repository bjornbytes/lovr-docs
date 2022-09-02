return {
  summary = 'Get the filter mode of the Sampler.',
  description = 'Returns the filter mode of the Sampler.',
  arguments = {},
  returns = {
    {
      name = 'min',
      type = 'FilterMode',
      description = 'The filter mode used when the texture is minified.'
    },
    {
      name = 'mag',
      type = 'FilterMode',
      description = 'The filter mode used when the texture is magnified.'
    },
    {
      name = 'mip',
      type = 'FilterMode',
      description = 'The filter mode used to select a mipmap level.'
    }
  },
  related = {
    'Sampler:getWrap',
    'Sampler:getCompareMode',
    'Sampler:getAnisotropy',
    'Sampler:getMipmapRange'
  }
}

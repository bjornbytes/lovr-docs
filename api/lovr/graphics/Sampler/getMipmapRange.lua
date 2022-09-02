return {
  summary = 'Get the mipmap range of the Sampler.',
  description = [[
    Returns the mipmap range of the Sampler.  This is used to clamp the range of mipmap levels that
    can be accessed from a texture.
  ]],
  arguments = {},
  returns = {
    {
      name = 'min',
      type = 'number',
      description = 'The minimum mipmap level that will be sampled (0 is the largest image).'
    },
    {
      name = 'max',
      type = 'number',
      description = 'The maximum mipmap level that will be sampled.'
    }
  },
  related = {
    'Sampler:getFilter',
    'Sampler:getWrap',
    'Sampler:getCompareMode',
    'Sampler:getAnisotropy'
  }
}

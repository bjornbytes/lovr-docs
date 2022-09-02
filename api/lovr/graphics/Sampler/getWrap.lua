return {
  summary = 'Get the wrap mode of the Sampler.',
  description = [[
    Returns the wrap mode of the sampler, used to wrap or clamp texture coordinates when the extend
    outside of the 0-1 range.
  ]],
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'WrapMode',
      description = 'The wrap mode used in the horizontal direction.'
    },
    {
      name = 'y',
      type = 'WrapMode',
      description = 'The wrap mode used in the vertical direction.'
    },
    {
      name = 'z',
      type = 'WrapMode',
      description = 'The wrap mode used in the "z" direction, for 3D textures only.'
    }
  },
  related = {
    'Sampler:getFilter',
    'Sampler:getCompareMode',
    'Sampler:getAnisotropy',
    'Sampler:getMipmapRange'
  }
}

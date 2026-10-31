return {
  tag = 'graphics-objects',
  summary = 'Create a new Sampler.',
  description = [[
    Creates a new Sampler.  Samplers are immutable, meaning their parameters can not be changed
    after the sampler is created.  Instead, a new sampler should be created with the updated
    properties.
  ]],
  arguments = {
    parameters = {
      type = 'table',
      description = 'Parameters for the sampler.',
      table = {
        {
          name = 'filter',
          type = 'FilterMode? | {FilterMode}?',
          default = [['linear']],
          description = [[
            How the sampler smooths texture pixels.  Can be a single FilterMode, or a table of
            three: one for minification, one for magnification, and one for smoothing between mipmap
            levels.
          ]]
        },
        {
          name = 'wrap',
          type = 'WrapMode? | {WrapMode}?',
          default = [['repeat']],
          description = [[
            How the sampler behaves when wrapping UVs outside the 0-1 range.  Can be a table of 3
            WrapModes, for x, y, and z directions, or a single WrapMode to use for all three axes.
          ]]
        },
        {
          name = 'compare',
          type = 'CompareMode?',
          default = [['none']],
          description = 'The compare mode of the sampler (for shadow samplers).'
        },
        {
          name = 'anisotropy',
          type = 'number?',
          default = '1',
          description = 'The maximum amount of anisotropic filtering to use.'
        },
        {
          name = 'mipmaprange',
          type = '{number}?',
          description = 'A table of 2 mipmap levels the sampler will clamp to.'
        }
      }
    }
  },
  returns = {
    sampler = {
      type = 'Sampler',
      description = 'The new sampler.'
    }
  },
  variants = {
    {
      arguments = { 'parameters' },
      returns = { 'sampler' }
    }
  },
  related = {
    'Pass:setSampler'
  }
}

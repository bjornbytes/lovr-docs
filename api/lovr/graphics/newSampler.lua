return {
  tag = 'graphics-objects',
  summary = 'Create a new Sampler.',
  description = 'TODO',
  arguments = {
    parameters = {
      type = 'table',
      description = 'Parameters for the sampler.',
      table = {
        {
          name = 'filter',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'wrap',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'compare',
          type = 'CompareMode',
          description = 'TODO'
        },
        {
          name = 'anisotropy',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'mipmaprange',
          type = 'table',
          description = 'TODO'
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

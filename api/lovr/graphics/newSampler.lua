return {
  tag = 'graphics-objects',
  summary = 'Create a new Sampler.',
  description = 'TODO',
  arguments = {
    options = {
      type = 'table',
      description = 'TODO',
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
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'options' },
      returns = { 'sampler' }
    }
  },
  related = {
    'Pass:setSampler'
  }
}

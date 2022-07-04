return {
  summary = 'Get a new Pass.',
  description = 'TODO',
  arguments = {
    type = {
      type = 'PassType',
      description = 'TODO'
    },
    texture = {
      type = 'Texture',
      description = 'TODO'
    },
    canvas = {
      type = 'table',
      description = 'TODO',
      table = {
        {
          name = 'depth',
          type = '*',
          description = 'TODO'
        },
        {
          name = 'clear',
          type = '*',
          description = 'TODO'
        },
        {
          name = 'samples',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'mipmap',
          type = 'boolean',
          default = [['false']],
          description = 'TODO'
        }
      }
    },
    label = {
      type = 'string',
      description = 'TODO'
    }
  },
  returns = {
    model = {
      type = 'Pass',
      description = 'The new Pass.'
    }
  },
  variants = {
    {
      arguments = { 'type', 'label' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'texture', 'label' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'canvas', 'label' },
      returns = { 'pass' }
    }
  },
  related = {
    'lovr.graphics.submit'
  }
}

return {
  tag = 'graphics-objects',
  summary = 'Create a new Pass.',
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
    }
  },
  returns = {
    pass = {
      type = 'Pass',
      description = 'The new Pass.'
    }
  },
  variants = {
    {
      arguments = { 'type' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'texture' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'canvas' },
      returns = { 'pass' }
    }
  },
  related = {
    'lovr.graphics.submit',
    'lovr.graphics.getWindowPass',
    'lovr.headset.getPass',
    'Pass:reset'
  }
}

return {
  summary = 'Get the position of the Shape in the world.',
  description = 'Get the position of the Shape in the world.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x offset.'
    },
    y = {
      type = 'number',
      description = 'The y offset.'
    },
    z = {
      type = 'number',
      description = 'The z offset.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'Shape:getOrientation',
    'Shape:setOrientation',
    'Shape:getPose',
    'Shape:setPose'
  }
}

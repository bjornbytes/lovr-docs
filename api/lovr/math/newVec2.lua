return {
  tag = 'vectors',
  summary = 'Create a new Vec2.',
  description = 'Creates a new 2D vector.  This function takes the same arguments as `Vec2:set`.',
  arguments = {
    {
      type = 'number',
      default = '0',
      description = 'The x value of the vector.'
    },
    {
      type = 'number',
      default = '0',
      description = 'The y value of the vector.'
    }
  },
  returns = {
    {
      type = 'Vec2',
      description = 'The output vector.'
    }
  },
  related = {
    'lovr.math.vec2',
    'Vec2'
  }
}

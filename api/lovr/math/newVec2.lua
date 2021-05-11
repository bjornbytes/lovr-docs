return {
  tag = 'vectors',
  summary = 'Create a new Vec2.',
  description = 'Creates a new 2D vector.  This function takes the same arguments as `Vec2:set`.',
  arguments = {
    {
      name = "x",
      type = 'number',
      default = '0',
      description = 'The x value of the vector.'
    },
    {
      name = "y",
      type = 'number',
      default = '0',
      description = 'The y value of the vector.'
    }
  },
  returns = {
    {
      name = "x",
      type = 'Vec2',
      description = 'The output vector.'
    }
  },
  related = {
    'lovr.math.vec2',
    'Vec2'
  }
}

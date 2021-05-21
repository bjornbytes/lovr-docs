return {
  tag = 'vectors',
  summary = 'Create a new temporary Vec2.',
  description = 'Creates a new 2D temporary vector.  This function takes the same arguments as `Vec2:set`.',
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
      description = 'The output temporary vector.'
    }
  },
  related = {
    'lovr.math.newVec2',
    'Vec2'
  }
}

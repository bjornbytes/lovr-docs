return {
  tag = 'vectors',
  summary = 'Create a new temporary Vec2.',
  description = 'Creates a new 2D temporary vector.  This function takes the same arguments as `Vec2:set`.',
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
      description = 'The output temporary vector.'
    }
  },
  related = {
    'lovr.math.newVec2',
    'Vec2'
  }
}

return {
  tag = 'vectors',
  summary = 'Create a new temporary Vec3.',
  description = 'Creates a new 3D temporary vector.  This function takes the same arguments as `Vec3:set`.',
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
    },
    {
      name = "z",
      type = 'number',
      default = '0',
      description = 'The z value of the vector.'
    }
  },
  returns = {
    {
      name = "x",
      type = 'Vec3',
      description = 'The output temporary vector.'
    }
  },
  related = {
    'lovr.math.newVec3',
    'Vec3'
  }
}

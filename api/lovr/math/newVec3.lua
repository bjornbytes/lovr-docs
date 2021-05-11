return {
  tag = 'vectors',
  summary = 'Create a new Vec3.',
  description = 'Creates a new 3D vector.  This function takes the same arguments as `Vec3:set`.',
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
    },
    {
      type = 'number',
      default = '0',
      description = 'The z value of the vector.'
    }
  },
  returns = {
    {
      type = 'Vec3',
      description = 'The output vector.'
    }
  },
  related = {
    'lovr.math.vec3',
    'Vec3'
  }
}

return {
  tag = 'vectors',
  summary = 'Create a new Vec4.',
  description = 'Creates a new 4D vector.  This function takes the same arguments as `Vec4:set`.',
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
    },
    {
      type = 'number',
      default = '0',
      description = 'The w value of the vector.'
    }
  },
  returns = {
    {
      type = 'Vec4',
      description = 'The output vector.'
    }
  },
  related = {
    'lovr.math.vec4',
    'Vec4'
  }
}

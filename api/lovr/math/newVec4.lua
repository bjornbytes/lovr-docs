return {
  tag = 'vectors',
  summary = 'Create a new Vec4.',
  description = 'Creates a new 4D vector.  This function takes the same arguments as `Vec4:set`.',
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
    },
    {
      name = "w",
      type = 'number',
      default = '0',
      description = 'The w value of the vector.'
    }
  },
  returns = {
    {
      name = "x",
      type = 'Vec4',
      description = 'The output vector.'
    }
  },
  related = {
    'lovr.math.vec4',
    'Vec4'
  }
}

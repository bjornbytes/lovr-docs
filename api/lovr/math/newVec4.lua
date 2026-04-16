return {
  tag = 'vectors',
  deprecated = 'This function has been replaced by `vector.pack`.',
  summary = 'Create a vector.',
  description = 'Creates a vector.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the vector.'
    },
    y = {
      type = 'number',
      description = 'The y component of the vector.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z component of the vector.'
    },
    n = {
      type = 'number',
      description = 'A number to assign to the x, y, and z components of the vector.'
    }
  },
  returns = {
    v = {
      type = 'vector',
      description = 'The new vector.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'v' }
    },
    {
      arguments = { 'n' },
      returns = { 'v' }
    }
  }
}

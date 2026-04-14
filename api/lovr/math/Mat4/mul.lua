return {
  summary = 'Multiply a matrix with another matrix or a vector.',
  description = [[
    Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms
    together.  Multiplying by a vector applies the transformation from the matrix to the vector and
    returns a new transformed vector.
  ]],
  arguments = {
    n = {
      type = 'Mat4',
      description = 'The matrix.'
    },
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
      description = 'The z component of the vector.'
    },
    w = {
      type = 'number',
      default = '1',
      description = 'The w component of the vector.'
    },
    v = {
      type = 'vector',
      description = 'A vector.'
    }
  },
  returns = {
    self = {
      type = 'Mat4',
      description = 'The modified matrix.'
    },
    x = {
      type = 'number',
      description = 'The x component of the transformed vector.'
    },
    y = {
      type = 'number',
      description = 'The y component of the transformed vector.'
    },
    z = {
      type = 'number',
      description = 'The z component of the transformed vector.'
    },
    w = {
      type = 'number',
      description = 'The w component of the transformed vector.'
    },
    v = {
      type = 'vector',
      description = 'The transformed vector.'
    }
  },
  variants = {
    {
      arguments = { 'n' },
      returns = { 'self' }
    },
    {
      arguments = { 'x', 'y', 'z', 'w' },
      returns = { 'x', 'y', 'z', 'w' }
    },
    {
      arguments = { 'v' },
      returns = { 'v' }
    }
  },
  notes = [[
    When multiplying with a table, the returned table will try to match the input: it will have the
    same metatable as the input, and it will either use numeric keys for the components or x/y/z
    keys, based on the table length of the input.

    There are some differences between this function and the `*` operator.  `*` always assumes that
    the `w` component of the input vector is 1, and performs a w divide at the end.  This function
    allows specifying the `w` as the last argument, and does not perform a w divide at the end.
  ]],
  related = {
    'Mat4:translate',
    'Mat4:rotate',
    'Mat4:scale'
  }
}

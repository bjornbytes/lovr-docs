return {
  summary = 'Multiply a matrix with another matrix or a vector.',
  description = [[
    Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms
    together.  Multiplying by a vector applies the transformation from the matrix to the vector and
    returns the vector.
  ]],
  arguments = {
    n = {
      type = 'mat4',
      description = 'The matrix.'
    },
    v = {
      type = 'vec3',
      description = 'The vector.'
    }
  },
  returns = {
    m = {
      type = 'mat4',
      description = 'The original matrix, containing the result.'
    },
    v = {
      type = 'vec3',
      description = 'The transformed vector.'
    }
  },
  variants = {
    {
      arguments = { 'n' },
      returns = { 'm' }
    },
    {
      arguments = { 'v' },
      returns = { 'v' }
    }
  },
  related = {
    'mat4:__mul',
    'mat4:translate',
    'mat4:rotate',
    'mat4:scale'
  }
}

return {
  summary = 'Multiply a matrix with another matrix or a vector.',
  description = [[
    Multiplies this matrix by another value.  Multiplying by a matrix combines their two transforms
    together.  Multiplying by a vector applies the transformation from the matrix to the vector and
    returns the vector.
  ]],
  arguments = {
    m = {
      type = 'mat4',
      description = 'The matrix.'
    },
    n = {
      type = 'mat4',
      description = 'Another matrix.'
    },
    v = {
      type = 'vec3',
      description = 'The vector.'
    }
  },
  returns = {
    m = {
      type = 'mat4',
      description = 'A new matrix containing the multiplied result.'
    },
    u = {
      type = 'vec3',
      description = 'A new transformed vector.'
    }
  },
  variants = {
    {
      arguments = { 'm', 'n' },
      returns = { 'm' }
    },
    {
      arguments = { 'v' },
      returns = { 'u' }
    }
  },
  related = {
    'mat4:mul',
    'mat4:translate',
    'mat4:rotate',
    'mat4:scale'
  }
}

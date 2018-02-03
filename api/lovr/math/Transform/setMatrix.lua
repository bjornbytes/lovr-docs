return {
  summary = 'Set the Transform\'s matrix.',
  description = 'Sets the individual matrix components of a Transform, in column-major order.',
  arguments = {
    m11 = {
      type = 'number'
    },
    m21 = {
      type = 'number'
    },
    m31 = {
      type = 'number'
    },
    m41 = {
      type = 'number'
    },
    m12 = {
      type = 'number'
    },
    m22 = {
      type = 'number'
    },
    m32 = {
      type = 'number'
    },
    m42 = {
      type = 'number'
    },
    m13 = {
      type = 'number'
    },
    m23 = {
      type = 'number'
    },
    m33 = {
      type = 'number'
    },
    m43 = {
      type = 'number'
    },
    m14 = {
      type = 'number'
    },
    m24 = {
      type = 'number'
    },
    m34 = {
      type = 'number'
    },
    m44 = {
      type = 'number'
    },
    m = {
      type = 'table',
      description = 'A table containing the matrix values, as above.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = {
        'm11',
        'm21',
        'm31',
        'm41',
        'm12',
        'm22',
        'm32',
        'm42',
        'm13',
        'm23',
        'm33',
        'm43',
        'm14',
        'm24',
        'm34',
        'm44'
      },
      returns = {}
    },
    {
      arguments = { 'm' },
      returns = {}
    }
  }
}

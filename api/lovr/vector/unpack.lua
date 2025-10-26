return {
  summary = 'Get the components of a vector as numbers.',
  description = 'Returns the components of the vector as numbers.',
  arguments = {
    v = {
      type = 'vector',
      description = 'The vector to unpack.'
    }
  },
  returns = {
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
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  example = 'local x, y, z = vector(1, 2, 3):unpack()',
  related = {
    'vector.pack'
  }
}

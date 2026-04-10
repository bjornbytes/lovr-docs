return {
  summary = 'Get the dot product of two vectors.',
  description = 'Returns the dot product of two vectors.',
  arguments = {
    a = {
      type = 'vector',
      description = 'The first vector.'
    },
    b = {
      type = 'vector',
      description = 'The second vector.'
    }
  },
  returns = {
    dot = {
      type = 'number',
      description = 'The dot product of the two vectors.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b' },
      returns = { 'dot' }
    }
  },
  notes = 'This is computed as `a.x * b.x + a.y * b.y + a.z * b.z`.',
  example = 'vector.dot(vector(1, 2, 3), vector(3, 2, 1)) --> 10',
  related = {
    'vector.cross'
  }
}

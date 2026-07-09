return {
  summary = 'Get the angle between two vectors.',
  description = 'Returns the angle between two vectors.',
  arguments = {
    a = {
      type = 'vector',
      description = 'The first vector.'
    },
    b = {
      type = 'vector',
      description = 'The second vector.'
    },
    axis = {
      type = 'vector?',
      description = 'An optional axis used to determine the sign of the angle.'
    }
  },
  returns = {
    angle = {
      type = 'number',
      description = 'The angle between the two vectors.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b', 'axis' },
      returns = { 'angle' }
    }
  },
  related = {
    'vector.cross',
    'vector.distance'
  }
}

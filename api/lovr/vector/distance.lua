return {
  summary = 'Get the distance between two vectors.',
  description = 'Returns the distance between two vectors.',
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
    distance = {
      type = 'number',
      description = 'The distance between the two vectors.'
    }
  },
  variants = {
    {
      arguments = { 'a', 'b' },
      returns = { 'distance' }
    }
  },
  notes = 'This is short for `vector.length(v1 - v2)`.',
  example = [[
    vector.distance(vector(0, 0, 0), vector(10, 0, 0)) --> 10
  ]]
}

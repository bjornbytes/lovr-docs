return {
  summary = 'Get the distance between two vectors.',
  description = 'Returns the distance between two vectors.',
  arguments = {
    v1 = {
      type = 'vector',
      description = 'The first vector.'
    },
    v2 = {
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
      arguments = { 'v1', 'v2' },
      returns = { 'distance' }
    }
  },
  notes = 'This is short for `vector.length(v1 - v2)',
  example = [[
    vector.distance(vector(0, 0, 0), vector(10, 0, 0)) --> 10
  ]]
}

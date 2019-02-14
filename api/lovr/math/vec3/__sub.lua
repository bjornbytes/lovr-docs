return {
  summary = 'Subtract two vectors.',
  description = [[
    Subtracts two vectors, returning a new vector containing the difference.
  ]],
  arguments = {
    {
      name = 'v',
      type = 'vec3',
      description = 'The first vector.'
    },
    {
      name = 'u',
      type = 'vec3',
      description = 'The second vector.'
    }
  },
  returns = {
    {
      name = 'out',
      type = 'vec3',
      description = 'The result.'
    }
  },
  related = {
    'vec3:sub',
    'vec3:__add',
    'vec3:__mul',
    'vec3:__div'
  }
}

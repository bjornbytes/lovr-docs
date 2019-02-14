return {
  summary = 'Add two vectors.',
  description = 'Adds two vectors, returning a new temporary vector containing the sum.',
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
    'vec3:add',
    'vec3:__sub',
    'vec3:__mul',
    'vec3:__div'
  }
}

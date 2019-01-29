return {
  summary = 'Get the distance to another vector.',
  description = 'Returns the distance to another vector.',
  arguments = {
    {
      name = 'u',
      type = 'vec3',
      description = 'The vector to measure the distance to.'
    }
  },
  returns = {
    {
      name = 'distance',
      type = 'number',
      description = 'The distance to `u`.'
    }
  },
  related = {
    'vec3:__len',
    'vec3:length',
    'vec3:dot',
    'vec3:cross'
  }
}

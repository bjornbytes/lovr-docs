return {
  summary = 'Multiply vectors by vectors or numbers.',
  description = [[
    Multiplies a vector by another vector or a vector by a number.  Returns a new vector that
    contains the multiplied values.
  ]],
  arguments = {
    v = {
      type = 'vec3',
      description = 'The first vector.'
    },
    u = {
      type = 'vec3',
      description = 'The second vector.'
    },
    x = {
      type = 'number',
      description = 'A number to scale each value in the vector by.'
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
    'vec3:mul',
    'vec3:__add',
    'vec3:__sub',
    'vec3:__div',
    'vec3:save'
  }
}

return {
  summary = 'Divide vectors by vectors or numbers.',
  description = [[
    Divides a vector by another vector or a vector by a number.  Returns a new vector that contains
    the divided values.
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
      description = 'A number to divide each value in the vector by.'
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
    'vec3:div',
    'vec3:__add',
    'vec3:__sub',
    'vec3:__mul',
    'vec3:save'
  }
}

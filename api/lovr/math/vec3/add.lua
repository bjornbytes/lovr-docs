return {
  summary = 'Add a vector to this vector.',
  description = 'Adds a vector to this vector.',
  arguments = {
    {
      name = 'u',
      type = 'vec3',
      description = 'The other vector.'
    }
  },
  returns = {
    {
      name = 'v',
      type = 'vec3',
      description = 'The original vector.'
    }
  },
  notes = [[
    This function modifies `v` and sets the values to equal the summed values, like this:

        v.x, v.y, v.z = v.x + u.x, v.y + u.y, v.z + u.z
  ]],
  related = {
    'vec3:__add',
    'vec3:sub',
    'vec3:mul',
    'vec3:div'
  }
}

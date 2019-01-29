return {
  summary = 'Subtract a vector from this vector.',
  description = 'Subtracts a vector from this vector.',
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
    This function modifies `v` and sets the values to equal the subtracted values, like this:

        v.x, v.y, v.z = v.x - u.x, v.y - u.y, v.z - u.z
  ]],
  related = {
    'vec3:__sub',
    'vec3:add',
    'vec3:mul',
    'vec3:div'
  }
}

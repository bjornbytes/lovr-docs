return {
  summary = 'Divides the vector by a vector or a number.',
  description = 'Divides the vector by a vector or a number.',
  arguments = {
    u = {
      type = 'vec3',
      description = 'The other vector to divide the components by.'
    },
    x = {
      type = 'number',
      description = 'The number to divide each component by.'
    }
  },
  returns = {
    v = {
      type = 'vec3',
      description = 'The original vector.'
    }
  },
  variants = {
    {
      arguments = { 'u' },
      returns = { 'v' }
    },
    {
      arguments = { 'x' },
      returns = { 'v' }
    }
  },
  notes = [[
    This function modifies `v` and sets the values to equal the divided values.  When dividing by a
    vector, the division is component-wise, like this:

        v.x, v.y, v.z = v.x / u.x, v.y / u.y, v.z / u.z

    Dividing by a number divides each component of the vector by that number:

        v.x, v.y, v.z = v.x / x, v.y / x, v.z / x
  ]],
  related = {
    'vec3:__div',
    'vec3:add',
    'vec3:sub',
    'vec3:mul'
  }
}

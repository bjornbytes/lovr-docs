return {
  summary = 'Multiply the vector by a vector or a number.',
  description = 'Multiplies the vector by a vector or a number.',
  arguments = {
    u = {
      type = 'vec3',
      description = 'The other vector to multiply the components by.'
    },
    x = {
      type = 'number',
      description = 'The number to multiply each component by.'
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
    This function modifies `v` and sets the values to equal the multiplied values.  When multiplying
    by a vector, the multiplication is component-wise, like this:

        v.x, v.y, v.z = v.x * u.x, v.y * u.y, v.z * u.z

    Multiplying by a number scales each component of the vector by that number:

        v.x, v.y, v.z = v.x * x, v.y * x, v.z * x
  ]],
  related = {
    'vec3:__mul',
    'vec3:add',
    'vec3:sub',
    'vec3:div'
  }
}

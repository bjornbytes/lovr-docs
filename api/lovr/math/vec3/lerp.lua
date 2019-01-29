return {
  summary = 'Moves this vector some amount towards another one.',
  description = [[
    Sets the components of this vector to be somewhere between their current values and the values
    of the input vector, based on a parameter.  A parameter value of `0` will leave the vector
    unchanged, a parameter value of `1` will set the vector to be equal to the input vector, and a
    value of `.5` will set the components to be halfway between the two vectors.
  ]],
  arguments = {
    {
      name = 'u',
      type = 'vec3',
      description = 'The vector to lerp towards.'
    },
    {
      name = 't',
      type = 'number',
      description = 'The lerping parameter.'
    }
  },
  returns = {
    {
      name = 'v',
      type = 'vec3',
      description = 'The original vector, with lerped values.'
    }
  },
  related = {
    'quat:slerp'
  }
}

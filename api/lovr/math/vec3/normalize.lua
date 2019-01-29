return {
  summary = 'Normalize the length of the vector to 1.',
  description = [[
    Adjusts the values in the vector so that its direction stays the same but its length becomes 1.
  ]],
  arguments = {},
  returns = {
    {
      name = 'v',
      type = 'vec3',
      description = 'The original vector.'
    }
  },
  related = {
    'vec3:__len',
    'vec3:length'
  }
}

return {
  summary = 'Get the direction vector of the Source.',
  description = [[
    Returns the direction vector of the Source (the direction it's playing in).
  ]],
  arguments = {},
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x component of the direction vector.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y component of the direction vector.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z component of the direction vector.'
    }
  }
}

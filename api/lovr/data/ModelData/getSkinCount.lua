return {
  summary = 'Get the number of skins in the model.',
  description = [[
    Returns the number of skins in the model.  A skin is a collection of joints targeted by an
    animation.
  ]],
  arguments = {},
  returns = {
    {
      name = 'count',
      type = 'number',
      description = 'The number of skins in the model.'
    }
  },
  notes = 'There is currently a maximum of 256 skins.',
  related = {
    'Model:hasJoints'
  }
}

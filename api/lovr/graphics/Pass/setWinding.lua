return {
  tag = 'pipeline',
  summary = 'Set the winding direction of triangle vertices.',
  description = 'TODO',
  arguments = {
    winding = {
      type = 'Winding',
      description = 'Whether triangle vertices are ordered `clockwise` or `counterclockwise`.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'winding' },
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setCullMode'
  }
}

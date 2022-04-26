return {
  tag = 'pipeline',
  summary = 'Configure the depth offset.',
  description = 'TODO',
  arguments = {
    {
      name = 'offset',
      type = 'number',
      default = '0.0',
      description = 'The depth offset.'
    },
    {
      name = 'sloped',
      type = 'number',
      default = '0.0',
      description = 'The sloped depth offset.'
    }
  },
  returns = {},
  notes = 'TODO',
  related = {
    'lovr.graphics.setDepthTest',
    'lovr.graphics.setDepthWrite'
  }
}

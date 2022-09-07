return {
  tag = 'pipeline',
  summary = 'Configure the depth offset.',
  description = 'TODO',
  arguments = {
    offset = {
      type = 'number',
      default = '0.0',
      description = 'The depth offset.'
    },
    sloped = {
      type = 'number',
      default = '0.0',
      description = 'The sloped depth offset.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'offset', 'sloped' },
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setDepthTest',
    'lovr.graphics.setDepthWrite'
  }
}

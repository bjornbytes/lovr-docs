return {
  tag = 'pipeline',
  summary = 'Configure the depth test.',
  description = 'TODO',
  arguments = {
    test = {
      type = 'CompareMode',
      description = 'The new depth test to use.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'test' },
      returns = {}
    },
    {
      description = 'Disable the depth test.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setDepthWrite',
    'lovr.graphics.setDepthOffset',
    'lovr.graphics.setDepthClamp',
    'lovr.graphics.setStencilTest'
  }
}

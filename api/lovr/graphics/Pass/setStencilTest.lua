return {
  tag = 'pipeline',
  summary = 'Configure the stencil test.',
  description = 'TODO',
  arguments = {
    test = {
      type = 'CompareMode',
      description = 'The new stencil test to use.'
    },
    value = {
      type = 'number',
      description = 'The stencil value to compare against.'
    },
    mask = {
      type = 'number',
      default = '0xff',
      description = 'An optional mask to apply to stencil values before the comparison.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'test', 'value', 'mask' },
      returns = {}
    },
    {
      description = 'Disable the stencil test.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setStencilWrite',
    'lovr.graphics.setDepthTest'
  }
}

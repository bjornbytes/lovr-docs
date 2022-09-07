return {
  tag = 'pipeline',
  summary = 'Set whether draws write to the depth buffer.',
  description = 'TODO',
  arguments = {
    write = {
      type = 'boolean',
      description = 'The new depth write setting.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'write' },
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setDepthTest',
    'lovr.graphics.setStencilWrite',
    'lovr.graphics.setColorWrite'
  }
}

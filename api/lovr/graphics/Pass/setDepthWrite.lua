return {
  tag = 'pipeline',
  summary = 'Set whether draws write to the depth buffer.',
  description = 'TODO',
  arguments = {
    {
      name = 'write',
      type = 'boolean',
      description = 'The new depth write setting.'
    }
  },
  returns = {},
  notes = 'TODO',
  related = {
    'lovr.graphics.setDepthTest',
    'lovr.graphics.setStencilWrite',
    'lovr.graphics.setColorWrite'
  }
}

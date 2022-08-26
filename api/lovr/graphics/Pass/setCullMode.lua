return {
  tag = 'pipeline',
  summary = 'Control triangle face culling.',
  description = 'TODO',
  arguments = {
    {
      name = 'mode',
      type = 'CullMode',
      default = [['none']],
      description = 'Whether `front` faces, `back` faces, or `none` of the faces should be culled.'
    }
  },
  returns = {},
  notes = 'TODO',
  related = {
    'lovr.graphics.setWinding'
  }
}

return {
  tag = 'pipeline',
  summary = 'Control triangle face culling.',
  description = 'TODO',
  arguments = {
    mode = {
      type = 'CullMode',
      default = [['none']],
      description = 'Whether `front` faces, `back` faces, or `none` of the faces should be culled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    }
  },
  notes = 'TODO',
  related = {
    'lovr.graphics.setWinding'
  }
}

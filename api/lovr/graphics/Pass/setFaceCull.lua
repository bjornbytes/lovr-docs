return {
  tag = 'pipeline',
  summary = 'Control triangle face culling.',
  description = 'Sets whether the front or back faces of triangles are culled.',
  arguments = {
    mode = {
      type = 'CullMode',
      description = 'Whether `front` faces, `back` faces, or `none` of the faces should be culled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    },
    {
      description = 'Disable face culling.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'By default, face culling is disabled.',
  related = {
    'Pass:setViewCull',
    'Pass:setWinding'
  }
}

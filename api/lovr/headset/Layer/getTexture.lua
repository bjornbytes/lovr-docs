return {
  summary = 'Get the texture for the layer.',
  description = [[
    Returns the texture for the layer.  This is the texture that will be pasted onto the layer.
  ]],
  arguments = {},
  returns = {
    texture = {
      type = 'Texture',
      description = 'The layer\'s texture.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'texture' }
    }
  },
  notes = [[
    This function may return a different `Texture` object each frame.  The return value should not
    be cached.

    The texture will have the `rgba8` format, with `sample` and `render` usage flags.
  ]],
  related = {
    'Layer:getPass'
  }
}

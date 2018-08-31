return {
  tag = 'graphicsPrimitives',
  summary = 'Fill the screen with a texture.',
  description = 'Draws a fullscreen textured quad.',
  arguments = {
    texture = {
      type = 'Texture',
      description = 'The texture to use.'
    },
    canvas = {
      type = 'Canvas',
      description = 'The first Texture attached to this Canvas will be used.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Fills the screen with a Texture.',
      arguments = { 'texture' },
      returns = {}
    },
    {
      description = 'Fills the screen with the first Texture attached to a Canvas.',
      arguments = { 'canvas' },
      returns = {}
    },
    {
      description = 'Fills the screen with the active color.',
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    This function ignores stereo rendering, so it will stretch the input across the entire Canvas if
    it's stereo.
  ]]
}

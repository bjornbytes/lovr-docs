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
    },
    u = {
      type = 'number',
      default = '0',
      description = 'The x component of the uv offset.'
    },
    v = {
      type = 'number',
      default = '0',
      description = 'The y component of the uv offset.'
    },
    w = {
      type = 'number',
      default = '1 - u',
      description = 'The width of the Texture to render, in uv coordinates.'
    },
    h = {
      type = 'number',
      default = '1 - v',
      description = 'The height of the Texture to render, in uv coordinates.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Fills the screen with a Texture.',
      arguments = { 'texture', 'u', 'v', 'w', 'h' },
      returns = {}
    },
    {
      description = 'Fills the screen with the first Texture attached to a Canvas.',
      arguments = { 'canvas', 'u', 'v', 'w', 'h' },
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

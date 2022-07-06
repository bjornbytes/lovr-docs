return {
  tag = 'drawing',
  summary = 'Draw a skybox.',
  description = 'TODO',
  arguments = {
    skybox = {
      type = 'Texture',
      description = [[
        The skybox to render.  Its `TextureType` can be `cube` to render as a cubemap, or `2d` to
        render as an equirectangular (spherical) 2D image.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'skybox' },
      returns = {}
    },
    {
      arguments = {},
      returns = {}
    }
  },
  notes = 'TODO'
}

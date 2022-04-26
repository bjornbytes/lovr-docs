return {
  tag = 'drawing',
  summary = 'Draw a skybox.',
  description = 'TODO',
  arguments = {
    {
      name = 'texture',
      type = 'Texture',
      description = [[
        The texture to use for the skybox.  It can be a cube texture or a 2D texture.  When 2D, the
        texture should use spherical coordinates (also called equirectangular projection).
      ]]
    }
  },
  returns = {},
  notes = 'TODO'
}

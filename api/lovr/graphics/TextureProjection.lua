return {
  summary = 'Different projection types for renderable textures.',
  description = [[
    When creating Textures to be used as render targets, they can be created in either "2d" or "3d"
    mode.  2D mode is good for 2D user interfaces or postprocessing, whereas 3d is useful for
    portals, weapon scopes, mirrors, and other situations where 3D content needs to be rendered.
  ]],
  values = {
    {
      name = '2d',
      description = 'Use an orthographic projection.'
    },
    {
      name = '3d',
      description = 'Use a perspective projection.'
    }
  }
}

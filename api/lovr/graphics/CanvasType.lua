return {
  summary = 'Different projection methods for Canvases.',
  description = [[
    When creating Canvases, they can be created in either "2d" or "3d" mode.  2D mode is good for 2D
    user interfaces or postprocessing, whereas 3d is useful for portals, weapon scopes, mirrors, and
    other situations where 3D content needs to be rendered.
  ]],
  values = {
    {
      name = '2d',
      description = 'Use a 2d orthographic projection matrix.'
    },
    {
      name = '3d',
      description = 'Use a 3d perspective projection matrix.'
    }
  }
}

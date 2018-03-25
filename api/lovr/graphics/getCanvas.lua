return {
  tag = 'graphicsState',
  summary = 'Get the active Canvas.',
  description = [[
    Returns the set of active Canvas objects.  Usually when you render something it will render
    directly to the screen.  If one or more Canvas objects are active, things will be rendered to
    those Canvases instead of to the screen.
  ]],
  arguments = {},
  returns = {
    {
      name = '...',
      type = 'Canvas',
      description = 'The set of active Canvas objects, or nil if none are set.'
    }
  },
  notes = 'Up to 4 Canvases can be active at a time.',
  related = {
    'Canvas:renderTo',
    'Canvas'
  }
}

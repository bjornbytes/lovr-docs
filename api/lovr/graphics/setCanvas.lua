return {
  tag = 'graphicsState',
  summary = 'Set the active Canvas.',
  description = [[
    Sets or disables active Canvas objects.  If one or more Canvas objects are active, things will
    be rendered to those Canvases instead of to the screen.
  ]],
  arguments = {
    {
      name = '...',
      type = 'Canvas',
      description = [[
        The new set of active Canvas objects, or nil to just render to the screen/headset.
      ]]
    }
  },
  returns = {},
  notes = [[
    Up to 4 Canvases can be active at a time.  Multicanvas rendering only works with 2D Canvases.

    Rendering to multiple Canvases simultaneously requires the active Shader to specify a different
    color output for each active Canvas.  To do this, add the `#define MULTICANVAS` line to the top
    of the fragment shader and write the `void colors` function instead of the usual `vec4 color`
    function.  You can then assign different output colors to `lovrCanvas[0]`, `lovrCanvas[1]`, etc.
    instead of returning a single color.
  ]],
  related = {
    'Canvas:renderTo',
    'Canvas'
  }
}

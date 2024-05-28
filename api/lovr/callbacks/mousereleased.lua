return {
  tag = 'callbacks',
  summary = 'Called when a mouse button is released.',
  description = 'This callback is called when a mouse button is released.',
  arguments = {
    x = {
      type = 'number',
      description = 'The x position of the mouse when the button was released.'
    },
    y = {
      type = 'number',
      description = 'The y position of the mouse when the button was released.'
    },
    button = {
      type = 'number',
      description = [[
        The button that was released.  Will be 1 for the primary button, 2 for the secondary button,
        or 3 for the middle mouse button.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'button' },
      returns = {}
    }
  },
  related = {
    'lovr.mousepressed',
    'lovr.mousemoved',
    'lovr.wheelmoved',
    'lovr.system.isMouseDown'
  }
}

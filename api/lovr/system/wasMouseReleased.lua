return {
  tag = 'system-mouse',
  summary = 'Check if a mouse button was released this frame.',
  description = 'Returns whether a button on the mouse was released this frame.',
  arguments = {
    button = {
      type = 'number',
      description = [[
        The index of a button to check.  Use 1 for the primary mouse button, 2 for the secondary
        button, and 3 for the middle button.  Other indices can be used, but are hardware-specific.
      ]]
    }
  },
  returns = {
    released = {
      type = 'boolean',
      description = 'Whether the mouse button was released this frame.'
    }
  },
  variants = {
    {
      arguments = { 'button' },
      returns = { 'released' }
    }
  },
  notes = [[
    Technically this returns whether the button was released between the last 2 calls to
    `lovr.system.pollEvents`, but that function is called automatically at the beginning of each
    frame in `lovr.run`, so it all works out!
  ]],
  related = {
    'lovr.system.isMouseDown',
    'lovr.system.wasMousePressed',
    'lovr.mousepressed',
    'lovr.mousereleased'
  }
}

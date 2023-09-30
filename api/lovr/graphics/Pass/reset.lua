return {
  tag = 'pass-misc',
  summary = 'Reset the Pass.',
  description = [[
    Resets the Pass, clearing all of its draws and computes and resetting all of its state to the
    default values.

    The only thing that doesn't get reset is the Pass's canvas.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  notes = 'Changing the canvas using `Pass:setCanvas` will also reset the Pass.'
}

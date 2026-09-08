return {
  tag = 'system-mouse',
  summary = 'Set the mouse mode.',
  description = 'Sets the mouse mode.',
  arguments = {
    mode = {
      type = 'MouseMode',
      description = 'The new mouse mode.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mode' },
      returns = {}
    }
  },
  notes = [[
    By default, `lovr.simulate` uses this function to implement the mouse controls for the VR
    headset simulator.  To prevent conflicts with the simulator, you may want to disable
    `lovr.headset` in `lovr.conf` or set the `lovr.simulate` callback to `nil`.
  ]],
  related = {
    'lovr.mousemoved'
  }
}

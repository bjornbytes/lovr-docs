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
  related = {
    'lovr.mousemoved'
  }
}

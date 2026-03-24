return {
  tag = 'system-mouse',
  summary = 'Get the current mouse mode.',
  description = 'Returns the current mouse mode.',
  arguments = {},
  returns = {
    mode = {
      type = 'MouseMode',
      description = 'The current mouse mode.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mode' }
    }
  },
  related = {
    'lovr.mousemoved'
  }
}

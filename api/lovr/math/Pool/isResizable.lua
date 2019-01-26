return {
  summary = 'Check if the Pool is resizable.',
  description = [[
    Returns whether the Pool was created with the resizable flag.  Resizable Pools will
    automatically grow their memory block if they overflow, whereas normal Pools will throw an
    error.  This lets you trade off convenience for predictable performance and memory usage.
  ]],
  arguments = {},
  returns = {
    {
      name = 'resizable',
      type = 'boolean',
      description = 'Whether or not the Pool is resizable.'
    }
  },
  related = {
    'lovr.math.newPool'
  }
}

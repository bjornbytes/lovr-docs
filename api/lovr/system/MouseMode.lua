return {
  summary = 'Different mouse modes.',
  description = 'The different mouse modes that can be set with `lovr.system.setMouseMode`.',
  values = {
    {
      name = 'normal',
      description = 'Normal mouse movement.'
    },
    {
      name = 'relative',
      description = [[
        Relative mouse movement.  The mouse will be hidden and stop moving, but `lovr.mousemoved`
        will still be called to report relative motion deltas.
      ]]
    }
  },
  related = {
    'lovr.mousemoved',
    'lovr.system.getMouseMode',
    'lovr.system.setMouseMode'
  }
}

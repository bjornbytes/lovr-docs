return {
  summary = 'Create a non-temporary copy of the quaternion.',
  description = [[
    Creates and returns a permanent copy of the quaternion.  This copy exists as a normal Lua
    variable instead of belonging to a `Pool`, so it won't get destroyed when the Pool is drained
    and it will be garbage collected when it's no longer in use.
  ]],
  arguments = {},
  returns = {
    {
      name = 'q',
      type = 'quat',
      description = 'The new quaternion.'
    }
  },
  notes = [[
    This function should be used only when needed, as creating huge numbers of saved quaternions can
    begin to impact the garbage collector and decrease performance.
  ]],
  related = {
    'quat:set',
    'lovr.math.quat',
    'Pool:quat',
    'Pool:drain'
  }
}

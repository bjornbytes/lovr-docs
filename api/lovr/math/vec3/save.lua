return {
  summary = 'Create a non-temporary copy of the vector.',
  description = [[
    Creates and returns a permanent copy of the vector.  This copy exists as a normal Lua variable
    instead of belonging to a `Pool`, so it won't get destroyed when the Pool is drained and will
    be garbage collected when it's no longer in use.
  ]],
  arguments = {},
  returns = {
    {
      name = 'v',
      type = 'vec3',
      description = 'The new vector.'
    }
  },
  notes = [[
    This function should be used only when needed, as creating huge numbers of saved vectors can
    begin to impact the garbage collector and decrease performance.
  ]],
  related = {
    'vec3:set',
    'lovr.math.vec3',
    'Pool:vec3',
    'Pool:drain'
  }
}

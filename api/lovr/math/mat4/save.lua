return {
  summary = 'Create a non-temporary copy of the matrix.',
  description = [[
    Creates and returns a permanent copy of the matrix.  This copy exists as a normal Lua variable
    instead of belonging to a `Pool`, so it won't get destroyed when the Pool is drained and it will
    be garbage collected when it's no longer in use.
  ]],
  arguments = {},
  returns = {
    {
      name = 'm',
      type = 'mat4',
      description = 'The new matrix.'
    }
  },
  notes = [[
    This function should be used only when needed, as creating huge numbers of saved matrices can
    begin to impact the garbage collector and decrease performance.
  ]],
  related = {
    'mat4:set',
    'lovr.math.mat4',
    'Pool:mat4',
    'Pool:drain'
  }
}

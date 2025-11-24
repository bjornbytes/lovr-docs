return {
  summary = 'Advance the physics simulation.',
  description = [[
    Updates the World, advancing the physics simulation forward in time and moving all the
    colliders.
  ]],
  arguments = {
    dt = {
      type = 'number',
      description = 'The amount of time to advance the simulation forward.'
    },
  },
  returns = {},
  variants = {
    {
      arguments = { 'dt' },
      returns = {}
    }
  },
  notes = [[
    This function must be called from the last thread that called `World:setCallbacks`.  If no
    callbacks are set, then this can be called from any thread.
  ]],
  example = [[
    function lovr.update(dt)
      world:update(dt)
    end
  ]],
  related = {
    'lovr.physics.newWorld'
  }
}

return {
  tag = 'worldBasics',
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
    By default, the World updates at a fixed timestep.  This means that the physics simulation will
    always update with a constant rate, for example 60 "ticks" per second.  This improves stability
    of the simulation and decouples physics from rendering.  Collider poses are automatically
    interpolated between the two most recent ticks, ensuring smooth movement even if the tick rate
    is lower than the rendering rate.

    Fixed timestep can be disabled by setting the `tickRate` option to 0 in `lovr.physics.newWorld`.
    This will use a variable timestep where the `dt` value passed to this function will be applied
    directly to the physics simulation.

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

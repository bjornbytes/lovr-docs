return {
  summary = 'Set the World\'s collision callbacks.',
  description = [[
    Assigns collision callbacks to the world.  These callbacks are used to filter collisions or get
    notifications when colliders start or stop touching.  Callbacks are called during
    `World:update`.

    ### Filter

    Filters collisions.  Receives two colliders and returns a boolean indicating if they should
    collide.  Note that it is much faster to use tags and `World:enableCollisionBetween` to control
    collision.  This should only be used when the logic for filtering the collision is highly
    dynamic.

    ### Enter

    Called when two colliders begin touching.  Receives two colliders and a `Contact` object with
    more information about the collision.  The `contact` callback will also be called for this
    collision.

    ### Exit

    Called when two colliders stop touching.  Receives two colliders.

    ### Contact

    Called continuously while two colliders are touching.  Receives two colliders and a `Contact`
    object with more information about the collision.  The contact can also be disabled to disable
    the collision response, and its friction/resitution/velocity can be changed.  There can be
    multiple active contact areas (called "manifolds") between a pair of colliders; this callback
    will be called for each one.
  ]],
  arguments = {
    callbacks = {
      type = 'table',
      description = 'The World collision callbacks.',
      table = {
        {
          name = 'filter',
          type = 'function',
          description = 'The function to use to filter collisions.'
        },
        {
          name = 'enter',
          type = 'function',
          description = 'The function to call when 2 colliders start touching.'
        },
        {
          name = 'exit',
          type = 'function',
          description = 'The function to call when 2 colliders stop touching.'
        },
        {
          name = 'contact',
          type = 'function',
          description = 'The function to call every frame while 2 colliders are in contact.'
        }
      }
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'callbacks' },
      returns = {}
    }
  },
  notes = [[
    The `Thread` that last set these callbacks must also be the thread to call `World:update`.
  ]],
  example = [[
    world:setCallbacks({
      filter = function(a, b)
        return true
      end,
      enter = function(a, b, contact)
        -- play sounds, spawn particles, etc.
        -- the collision has not been resolved yet, so the velocity of a and b
        -- is the velocity before the collision, and can be used to estimate the
        -- collision force
      end,
      exit = function(a, b)
        -- a and b have stopped touching!
      end,
      contact = function(a, b, contact)
        -- a and b are touching this frame
        -- use sparingly, as this may be called many times per frame
        -- use Contact:setFriction and Contact:setResitution to update
        -- the contact behavior, or Contact:setSurfaceVelocity, for a
        -- conveyor belt effect, or Contact:setEnabled to disable the
        -- collision completely.
      end
    })
  ]],
  related = {
    'World:update',
    'Contact'
  }
}

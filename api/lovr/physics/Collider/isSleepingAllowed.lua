return {
  summary = 'Check if the Collider is allowed to sleep.',
  description = [[
    Returns whether the Collider is allowed to automatically go to sleep.

    When enabled, the Collider will go to sleep if it hasn't moved in a while.  The physics engine
    does not simulate movement for colliders that are asleep, which saves a lot of CPU for a typical
    physics world where most objects are at rest at any given time.  
  ]],
  arguments = {},
  returns = {
    sleepy = {
      type = 'boolean',
      description = 'Whether the Collider can go to sleep.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'sleepy' }
    }
  },
  notes = [[
    Sleeping is enabled by default.  Sleeping can be disabled globally using the `allowSleep` option
    in `lovr.physics.newWorld`.

    Colliders can still be put to sleep manually with `Collider:setAwake`, even if automatic
    sleeping is disabled.

    Sleeping colliders will wake up when:

    - Colliding with a moving collider
    - Awakened explicitly with `Collider:setAwake`
    - Changing position `Collider:setPosition` or `Collider:setOrientation`
    - Changing velocity (to something non-zero)
    - Applying force, torque, or an impulse
    - Enabling a joint connected to the sleeping collider

    Notably, the following will not wake up the collider:

    - Changing its kinematic state with `Collider:setKinematic`
    - Changing its shape with `Collider:addShape` or `Collider:removeShape`
    - Disabling or destroying a sleeping collider it is resting on

    Sensors will never go to sleep.
  ]],
  related = {
    'Collider:isAwake',
    'Collider:setAwake'
  }
}

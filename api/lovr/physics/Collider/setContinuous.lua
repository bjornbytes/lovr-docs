return {
  summary = 'Set whether the Collider uses continuous collision detection.',
  description = [[
    Sets whether the Collider uses continuous collision detection.

    Normally on each timestep a Collider will "teleport" to its new position based on its velocity.
    Usually this works fine, but if a Collider is going really fast relative to its size, then it
    might miss collisions with objects or pass through walls.  Enabling continuous collision
    detection means the Collider will check for obstacles along its path before moving to the new
    location.  This prevents the Collider from going through walls, but reduces performance.  It's
    usually used for projectiles, which tend to be small and really fast.
  ]],
  arguments = {
    continuous = {
      type = 'boolean',
      description = 'Whether the Collider uses continuous collision detection.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'continuous' },
      returns = {}
    }
  },
  notes = [[
    The physics engine performs an optimization where continuous collision detection is only used if
    the Collider is moving faster than 75% of its size.  So it is not necessary to enable and
    disable continuous collision detection based on how fast the Collider is moving.

    Colliders that are sensors are not able to use continuous collision detection.
  ]]
}

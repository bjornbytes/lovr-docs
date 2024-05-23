return {
  summary = 'Set whether the Collider should be a sensor.',
  description = [[
    Sets whether the Collider should be a sensor.  Sensors do not collide with other objects, but
    they can still sense collisions with the collision callbacks set by `World:setCallbacks`.  Use
    them to trigger gameplay behavior when an object is inside a region of space.
  ]],
  arguments = {
    sensor = {
      type = 'boolean',
      description = 'Whether the Collider should be a sensor.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'sensor' },
      returns = {}
    }
  },
  notes = [[
    Sensors are still reported as hits when doing raycasts and other queries.  Use tags to ignore
    sensors if needed.

    When a World is created, a set of collision tags can be marked as "static", for performance.
    Sensors do not detect collision with colliders that have a static tag.  Also, if a sensor itself
    has a static tag, it will not be able to detect collisions with sleeping colliders.  If a
    Collider enters a static sensor and goes to sleep, the `exit` callback is called and the sensor
    is no longer able to detect that collider.

    Sensors can not use continuous collision detection.

    Sensors will never go to sleep.
  ]],
  related = {
    'Collider:setKinematic',
    'Collider:setEnabled',
    'World:overlapShape',
    'World:setCallbacks'
  }
}

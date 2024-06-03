return {
  deprecated = true,
  summary = 'Set the response time of the World.',
  description = [[
    Sets the response time factor of the World.

    The response time controls how relaxed collisions and joints are in the physics simulation, and
    functions similar to inertia.  A low response time means collisions are resolved quickly, and
    higher values make objects more spongy and soft.

    The value can be any positive number.  It can be changed on a per-joint basis for
    `DistanceJoint` and `BallJoint` objects.
  ]],
  arguments = {
    responseTime = {
      type = 'number',
      description = 'The new response time setting for the World.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'responseTime' },
      returns = {}
    }
  }
}

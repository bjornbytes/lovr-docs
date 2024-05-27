return {
  summary = 'Get the axis of the cone.',
  description = [[
    Returns the axis of the ConeJoint, in world space.  The axis is relative to the first Collider
    connected to the Joint, so it will rotate as the collider does.  The relative angle between the
    axis and the second collider will be constrained based on the ConeJoint's angle limit.
  ]],
  arguments = {},
  returns = {
    ax = {
      type = 'number',
      description = 'The x component of the axis.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'ax', 'ay', 'az' }
    }
  }
}

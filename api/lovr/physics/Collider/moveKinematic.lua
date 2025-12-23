return {
  summary = 'Move the collider towards a destination.',
  description = [[
    Moves the collider towards a destination pose.  The velocity of the collider is set so that the
    collider reaches the destination in `dt` seconds.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x position of the target, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position of the target, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position of the target, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the target, in meters.'
    },
    angle = {
      type = 'number',
      description = 'The angle of the target orientation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the target axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the target axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the target axis of rotation.'
    },
    orientation = {
      type = 'Quat',
      description = 'The target orientation.'
    },
    dt = {
      type = 'number',
      description = 'How long it should take to reach the destination.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az', 'dt' },
      returns = {}
    },
    {
      arguments = { 'position', 'orientation', 'dt' },
      returns = {}
    }
  },
  notes = [[
    The collider doesn't stop when it reaches the destination, this is just a shorthand for setting
    its velocity.
  ]],
  related = {
    'Collider:setLinearVelocity',
    'Collider:setAngularVelocity',
    'Collider:applyForce',
    'Collider:applyTorque'
  }
}

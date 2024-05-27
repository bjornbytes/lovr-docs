return {
  summary = 'Get the anchor points of the Joint.',
  description = [[
    Returns the world space anchor points of the Joint.  Joints are attached to each collider at a
    single point, which is defined when the Joint is created.
  ]],
  arguments = {},
  returns = {
    x1 = {
      type = 'number',
      description = 'The x coordinate of the anchor point on the first Collider, in world space.'
    },
    y1 = {
      type = 'number',
      description = 'The y coordinate of the anchor point on the first Collider, in world space.'
    },
    z1 = {
      type = 'number',
      description = 'The z coordinate of the anchor point on the first Collider, in world space.'
    },
    x2 = {
      type = 'number',
      description = 'The x coordinate of the anchor point on the second Collider, in world space.'
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the anchor point on the second Collider, in world space.'
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the anchor point on the second Collider, in world space.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2' }
    }
  },
  related = {
    'Joint:getColliders'
  }
}

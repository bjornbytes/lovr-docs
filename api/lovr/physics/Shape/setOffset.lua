return {
  summary = 'Set the local offset of the Shape.',
  description = [[
    Sets the local offset of the Shape.  When the Shape is attached to a Collider, it will have this
    offset relative to the Collider.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The local x offset of the Shape, in meters.'
    },
    y = {
      type = 'number',
      description = 'The local y offset of the Shape, in meters.'
    },
    z = {
      type = 'number',
      description = 'The local z offset of the Shape, in meters.'
    },
    angle = {
      type = 'number',
      description = 'The number of radians the Shape is rotated around its axis of rotation.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    },
    position = {
      type = 'Vec3',
      description = 'The local offset of the Shape, in meters.'
    },
    rotation = {
      type = 'Quat',
      description = 'The local rotation of the Shape, in meters.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'position', 'rotation' },
      returns = {}
    }
  },
  related = {
    'Shape:getPosition',
    'Shape:getOrientation',
    'Shape:getPose'
  }
}

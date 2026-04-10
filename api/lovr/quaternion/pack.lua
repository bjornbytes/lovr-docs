return {
  summary = 'Pack numbers into a quaternion.',
  description = [[
    Packs numbers into a quaternion.  Note that these are raw quaternion components, not angle/axis.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x component of the quaternion.'
    },
    y = {
      type = 'number',
      description = 'The y component of the quaternion.'
    },
    z = {
      type = 'number',
      description = 'The z component of the quaternion.'
    },
    w = {
      type = 'number',
      description = 'The w component of the quaternion.'
    }
  },
  returns = {
    q = {
      type = 'quaternion',
      description = 'The new quaternion.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z', 'w' },
      returns = { 'q' }
    },
    {
      description = 'Returns the identity quaternion.',
      arguments = {},
      returns = { 'q' }
    }
  },
  related = {
    'quaternion.angleaxis',
    'quaternion.unpack',
    'vector.pack'
  }
}

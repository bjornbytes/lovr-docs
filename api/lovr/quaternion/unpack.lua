return {
  summary = 'Get the components of a quaternion as numbers.',
  description = [[
    Returns the components of the quaternion as numbers.  Note that these are the raw components,
    not angle/axis.
  ]],
  arguments = {
    q = {
      type = 'quaternion',
      description = 'The quaternion to unpack.'
    }
  },
  returns = {
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
  variants = {
    {
      arguments = { 'q' },
      returns = { 'x', 'y', 'z', 'w' }
    }
  },
  example = 'local x, y, z, w = quaternion.pack(1, 2, 3, 4):unpack()',
  related = {
    'quaternion.pack',
    'quaternion.toangleaxis',
    'quaternion.toeuler',
    'quaternion.direction',
    'vector.pack'
  }
}

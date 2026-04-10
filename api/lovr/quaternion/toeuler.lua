return {
  summary = 'Unpack a quaternion to euler angles.',
  description = 'Returns the euler angles of the quaternion, in YXZ order.',
  arguments = {
    q = {
      type = 'quaternion',
      description = 'The quaternion.'
    }
  },
  returns = {
    pitch = {
      type = 'number',
      description = 'The pitch (x axis rotation), in radians.'
    },
    yaw = {
      type = 'number',
      description = 'The yaw (y axis rotation), in radians.'
    },
    roll = {
      type = 'number',
      description = 'The roll (z axis rotation), in radians.'
    }
  },
  variants = {
    {
      arguments = { 'q' },
      returns = { 'pitch', 'yaw', 'roll' }
    }
  },
  related = {
    'quaternion.euler'
  }
}

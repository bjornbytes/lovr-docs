return {
  summary = 'Create a quaternion using euler angles.',
  description = 'Creates a quaternion from euler angles.  The rotation order is YXZ.',
  arguments = {
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
  returns = {
    q = {
      type = 'quaternion',
      description = 'The new quaternion.  It will be normalized.'
    }
  },
  variants = {
    {
      arguments = { 'pitch', 'yaw', 'roll' },
      returns = { 'q' }
    }
  },
  related = {
    'quaternion.toeuler'
  }
}

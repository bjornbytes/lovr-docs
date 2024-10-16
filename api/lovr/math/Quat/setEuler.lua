return {
  summary = 'Set the value of the quaternion using euler angles.',
  description = 'Sets the value of the quaternion using euler angles.  The rotation order is YXZ.',
  arguments = {
    pitch = {
      type = 'number',
      description = 'The pitch (x axis rotation).'
    },
    yaw = {
      type = 'number',
      description = 'The yaw (y axis rotation).'
    },
    roll = {
      type = 'number',
      description = 'The roll (z axis rotation).'
    }
  },
  returns = {
    self = {
      type = 'Quat',
      description = 'The modified quaternion.'
    }
  },
  variants = {
    {
      arguments = { 'pitch', 'yaw', 'roll' },
      returns = { 'self' }
    }
  }
}

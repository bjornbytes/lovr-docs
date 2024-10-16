return {
  summary = 'Get the euler angles of the quaternion.',
  description = 'Returns the euler angles of the quaternion, in YXZ order.',
  arguments = {},
  returns = {
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
  variants = {
    {
      arguments = {},
      returns = { 'pitch', 'yaw', 'roll' }
    }
  }
}

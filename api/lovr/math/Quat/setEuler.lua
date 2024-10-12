return {
  summary = 'Set the quaternion by euler angles.',
  description = [[
    Rotation order is YXZ
  ]],
  arguments = {
    pitch = { type = 'number', },
    yaw = { type = 'number' },
    roll = { type = 'number' }
  },
  returns = {
    self = {
      type = 'Quat',
      description = 'The modified quaternion.'
    },
  },
  variants = {
    {
      arguments = { 'pitch', 'yaw', 'roll' },
      returns = { 'self' }
    }
  },
}

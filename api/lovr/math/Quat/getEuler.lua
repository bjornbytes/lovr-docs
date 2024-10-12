return {
  summary = 'Get the euler angles of the quaternion.',
  description = [[
    Rotation order is YXZ
  ]],
  arguments = {},
  returns = {
    pitch = { type = 'number', },
    yaw = { type = 'number' },
    roll = { type = 'number' }
  },
  variants = {
    {
      arguments = {},
      returns = { 'pitch', 'yaw', 'roll' }
    }
  },
}

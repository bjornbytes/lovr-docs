return {
  tag = 'vectors',
  summary = 'Create a temporary Quat.',
  description = [[
    Creates a temporary quaternion.  This function takes the same arguments as `Quat:set`.
  ]],
  arguments = {
    {
      name = "angle",
      default = '0',
      description = 'The angle to use for the rotation, in radians.'
    },
    {
      name = "x",
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = "y",
      type = 'number',
      default = '0',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = "z",
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    {
      name = "raw",
      type = 'boolean',
      default = 'false',
      description = 'Whether the components should be interpreted as raw `(x, y, z, w)` components.'
    }
  },
  returns = {
    {
      name = "a",
      type = 'quat',
      description = 'The output quaternion.'
    }
  },
  related = {
    'lovr.math.newQuat',
    'Quat'
  }
}

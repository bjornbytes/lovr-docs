return {
  tag = 'vectors',
  summary = 'Create a new Quat.',
  description = 'Creates a new quaternion.  This function takes the same arguments as `Quat:set`.',
  arguments = {
    {
      default = '0',
      description = 'The angle to use for the rotation, in radians.'
    },
    {
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    {
      type = 'number',
      default = '0',
      description = 'The y component of the axis of rotation.'
    },
    {
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    {
      type = 'boolean',
      default = 'false',
      description = 'Whether the components should be interpreted as raw `(x, y, z, w)` components.'
    }
  },
  returns = {
    {
      type = 'quat',
      description = 'The output quaternion.'
    }
  },
  related = {
    'lovr.math.quat',
    'Quat'
  }
}

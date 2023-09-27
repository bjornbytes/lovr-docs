return {
  summary = 'Get a new quat.',
  description = 'Allocates a new `quat` from the Pool and returns it.',
  arguments = {
    angle = {
      type = 'number',
      default = '0',
      description = 'The angle to use for the rotation, in radians.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '0',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    axis = {
      type = 'vec3',
      description = 'The axis of rotation (does not need to be normalized).'
    },
    raw = {
      type = 'boolean',
      default = 'false',
      description = 'Whether the components should be interpreted as raw `(x, y, z, w)` components.'
    },
    v = {
      type = 'vec3',
      description = 'A normalized direction vector.'
    },
    u = {
      type = 'vec3',
      description = 'Another normalized direction vector.'
    },
    r = {
      type = 'quat',
      description = 'An existing quaternion to copy the values from.'
    },
    m = {
      type = 'mat4',
      description = 'A matrix to use the rotation from.'
    }
  },
  returns = {
    q = {
      type = 'quat',
      description = 'The new quaternion.'
    }
  },
  variants = {
    {
      arguments = { 'angle', 'ax', 'ay', 'az', 'raw' },
      returns = { 'q' }
    },
    {
      arguments = { 'angle', 'axis' },
      returns = { 'q' }
    },
    {
      arguments = { 'r' },
      returns = { 'q' }
    },
    {
      description = 'Creates a quaternion from a direction vector.',
      arguments = { 'v' },
      returns = { 'q' }
    },
    {
      description = 'Creates a quaternion representing the rotation between two vectors.',
      arguments = { 'v', 'u' },
      returns = { 'q' }
    },
    {
      arguments = { 'm' },
      returns = { 'q' }
    }
  },
  related = {
    'Pool:vec3',
    'Pool:mat4',
    'lovr.math.quat',
    'quat'
  }
}

return {
  summary = 'Get the rotation axis of the HingeJoint.',
  description = 'Returns the axis of the hinge, in world space.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x component of the axis.'
    },
    y = {
      type = 'number',
      description = 'The y component of the axis.'
    },
    z = {
      type = 'number',
      description = 'The z component of the axis.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  related = {
    'HingeJoint:getAngle',
    'Joint:getAnchors'
  }
}

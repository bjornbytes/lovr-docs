return {
  summary = 'Get the current angle of the HingeJoint.',
  description = 'Returns the current angle of the HingeJoint, relative to the rest position.',
  arguments = {},
  returns = {
    angle = {
      type = 'number',
      description = 'The hinge angle, in radians.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'angle' }
    }
  },
  related = {
    'HingeJoint:getAxis',
    'HingeJoint:getLimits',
    'HingeJoint:setLimits'
  }
}

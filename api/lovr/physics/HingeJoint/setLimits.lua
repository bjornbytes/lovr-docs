return {
  summary = 'Set the angle limits of the HingeJoint.',
  description = [[
    Sets the angle limits of the HingeJoint.  The "zero" angle is determined by the relative
    position of the colliders at the time the joint was created.
  ]],
  arguments = {
    min = {
      type = 'number',
      description = 'The minimum angle, in radians.  Should be between -π and 0.'
    },
    max = {
      type = 'number',
      description = 'The maximum angle, in radians.  Should be between 0 and π.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'min', 'max' },
      returns = {}
    },
    {
      description = 'Disable the limits, setting them to -π and π.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'The default limits are -π and π.',
  related = {
    'HingeJoint:getAngle'
  }
}

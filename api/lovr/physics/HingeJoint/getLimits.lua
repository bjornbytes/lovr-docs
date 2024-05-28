return {
  summary = 'Get the angle limits of the HingeJoint.',
  description = [[
    Returns the angle limits of the HingeJoint.  The "zero" angle is determined by the relative
    position of the colliders at the time the joint was created.
  ]],
  arguments = {},
  returns = {
    min = {
      type = 'number',
      description = 'The minimum angle, in radians.  Always between -π and 0.'
    },
    max = {
      type = 'number',
      description = 'The maximum angle, in radians.  Always between 0 and π.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'min', 'max' }
    }
  },
  notes = 'The default limits are -π and π.',
  related = {
    'HingeJoint:getAngle'
  }
}

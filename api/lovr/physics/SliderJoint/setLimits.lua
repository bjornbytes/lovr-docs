return {
  summary = 'Set the position limits of the SliderJoint.',
  description = [[
    Sets the position limits of the SliderJoint.  The "zero" position is determined by the relative
    position of the colliders at the time the joint was created, and positive distances are further
    apart on the slider axis.
  ]],
  arguments = {
    min = {
      type = 'number',
      description = 'The minimum position, in meters.  Must be less than or equal to zero.'
    },
    max = {
      type = 'number',
      description = 'The maximum position, in meters.  Must be greater than or equal to zero.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'min', 'max' },
      returns = {}
    },
    {
      description = 'Disable the limits, setting them to -math.huge and math.huge.',
      arguments = {},
      returns = {}
    }
  },
  notes = 'The default limits are -math.huge and math.huge.',
  related = {
    'SliderJoint:getPosition'
  }
}

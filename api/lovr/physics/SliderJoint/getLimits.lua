return {
  summary = 'Get the position limits of the SliderJoint.',
  description = [[
    Returns the position limits of the SliderJoint.  The "zero" position is determined by the
    relative position of the colliders at the time the joint was created, and positive positions are
    further apart along the slider axis.
  ]],
  arguments = {},
  returns = {
    min = {
      type = 'number',
      description = 'The minimum position, in meters.  Must be less than or equal to zero.'
    },
    max = {
      type = 'number',
      description = 'The maximum position, in meters.  Must be greater than or equal to zero.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'min', 'max' }
    }
  },
  notes = 'The default limits are -math.huge and math.huge (no limits).',
  related = {
    'SliderJoint:getPosition'
  }
}

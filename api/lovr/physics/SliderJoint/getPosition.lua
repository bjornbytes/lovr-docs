return {
  summary = 'Get how far the SliderJoint is extended.',
  description = [[
    Returns the position of the slider joint.  The "zero" position is the relative distance the
    colliders were at when the joint is created, and positive positions are further apart along the
    slider's axis.
  ]],
  arguments = {},
  returns = {
    position = {
      type = 'number',
      description = 'The position of the slider joint, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'position' }
    }
  },
  related = {
    'SliderJoint:getAxis',
    'SliderJoint:setLimits'
  }
}

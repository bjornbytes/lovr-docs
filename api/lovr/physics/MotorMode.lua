return {
  summary = 'The different states for joint motors.',
  description = 'The different ways the motor on a joint can be used.',
  values = {
    {
      name = 'position',
      description = 'The motor drives to a particular value.'
    },
    {
      name = 'velocity',
      description = 'The motor drives to a particular speed.'
    }
  },
  related = {
    'HingeJoint:setMotorMode',
    'SliderJoint:setMotorMode'
  }
}

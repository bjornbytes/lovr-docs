return {
  summary = 'Get the length of the quaternion.',
  description = 'Returns the length of the quaternion.',
  arguments = {
    {
      name = 'q',
      type = 'quat',
      description = 'The quaternion.'
    }
  },
  returns = {
    {
      name = 'length',
      type = 'number',
      description = 'The length of the quaternion.'
    }
  },
  related = {
    'quat:length',
    'quat:normalize'
  }
}

return {
  summary = 'Scale the Transform.',
  description = 'Scales the Transform.',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The scale factor for the x axis.'
    },
    {
      name = 'y',
      type = 'number',
      default = 'x',
      description = 'The scale factor for the y axis.'
    },
    {
      name = 'z',
      type = 'number',
      default = 'x',
      description = 'The scale factor for the z axis.'
    }
  },
  returns = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The original Transform.'
    }
  }
}

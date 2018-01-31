return {
  summary = 'Apply the Transform to a point.',
  description = 'Applies the Transform to a point, returning the new position.',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x coordinate of the point.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y coordinate of the point.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z coordinate of the point.'
    }
  },
  returns = {
    {
      name = 'x2',
      type = 'number',
      description = 'The x coordinate of the transformed point.'
    },
    {
      name = 'y2',
      type = 'number',
      description = 'The y coordinate of the transformed point.'
    },
    {
      name = 'z2',
      type = 'number',
      description = 'The z coordinate of the transformed point.'
    }
  },
  related = {
    'Transform:inverseTransformPoint'
  }
}

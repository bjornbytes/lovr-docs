return {
  tag = 'graphics-misc',
  summary = 'Get information about the current GPU.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'hardware',
      type = 'table',
      description = 'Information about the GPU device.',
      table = {
        {
          name = 'id',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'name',
          type = 'string',
          description = 'TODO'
        },
        {
          name = 'vendor',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'driver',
          type = 'string',
          description = 'TODO'
        },
        {
          name = 'subgroupSize',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'discrete',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'renderer',
          type = 'string',
          description = 'TODO'
        }
      }
    }
  },
  related = {
    'lovr.graphics.getFeatures',
    'lovr.graphics.getLimits',
    'lovr.graphics.getStats'
  }
}

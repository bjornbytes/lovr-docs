return {
  summary = 'Get the set of supported GPU features.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'features',
      type = 'table',
      description = 'Features supported by the GPU.',
      table = {
        {
          name = 'bptc',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'astc',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'wireframe',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'depthClamp',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'clipDistance',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'cullDistance',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'fullIndexBufferRange',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'indirectDrawFirstInstance',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'dynamicIndexing',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'float64',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'int64',
          type = 'boolean',
          description = 'TODO'
        },
        {
          name = 'int16',
          type = 'boolean',
          description = 'TODO'
        }
      }
    }
  },
  related = {
    'lovr.graphics.isFormatSupported',
    'lovr.graphics.getHardware',
    'lovr.graphics.getLimits',
    'lovr.graphics.getStats'
  }
}

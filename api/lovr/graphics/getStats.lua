return {
  tag = 'graphics-misc',
  summary = 'Get graphics-related statistics.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'stats',
      type = 'table',
      description = 'Graphics statistics.',
      table = {
        {
          name = 'memory',
          type = 'table',
          description = 'TODO',
          table = {
            {
              name = 'total',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'buffer',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'texture',
              type = 'number',
              description = 'TODO'
            }
          }
        },
        {
          name = 'objects',
          type = 'table',
          description = 'TODO',
          table = {
            {
              name = 'buffers',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'textures',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'samplers',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'shaders',
              type = 'number',
              description = 'TODO'
            }
          }
        },
        {
          name = 'frame',
          type = 'table',
          description = 'TODO',
          table = {
            {
              name = 'scratchMemory',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'renderPasses',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'computePasses',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'transferPasses',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'pipelineBinds',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'bundleBinds',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'drawCalls',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'dispatches',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'workgroups',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'copies',
              type = 'number',
              description = 'TODO'
            }
          }
        },
        {
          name = 'internal',
          type = 'table',
          description = 'TODO',
          table = {
            {
              name = 'blocks',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'canvases',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'pipelines',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'layouts',
              type = 'number',
              description = 'TODO'
            },
            {
              name = 'bunches',
              type = 'number',
              description = 'TODO'
            }
          }
        }
      }
    }
  },
  related = {
    'lovr.graphics.getDevice',
    'lovr.graphics.getFeatures',
    'lovr.graphics.getLimits'
  }
}

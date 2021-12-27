return {
  tag = 'graphics-misc',
  summary = 'Get the limits of the current GPU.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'limits',
      type = 'table',
      description = 'A table containing GPU limits.',
      table = {
        {
          name = 'textureSize2D',
          type = 'number',
          description = 'TOOD'
        },
        {
          name = 'textureSize3D',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'textureSizeCube',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'textureLayers',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'renderSize',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'uniformBufferRange',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'storageBufferRange',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'storageBufferRange',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'uniformBufferAlign',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'storageBufferAlign',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'vertexAttributes',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'vertexBufferStride',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'vertexShaderOutputs',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'computeDispatchCount',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'computeWorkgroupSize',
          type = 'table',
          description = 'TODO'
        },
        {
          name = 'computeWorkgroupVolume',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'computeSharedMemory',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'indirectDrawCount',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'instances',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'anisotropy',
          type = 'number',
          description = 'TODO'
        },
        {
          name = 'pointSize',
          type = 'number',
          description = 'TODO'
        }
      }
    }
  },
  related = {
    'lovr.graphics.isFormatSupported',
    'lovr.graphics.getHardware',
    'lovr.graphics.getFeatures',
    'lovr.graphics.getStats'
  }
}

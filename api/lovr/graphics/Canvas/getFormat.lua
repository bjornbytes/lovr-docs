return {
  summary = 'Get the format of the Canvas texture.',
  description = 'Returns the internal storage format used for the Canvas.',
  arguments = {},
  returns = {
    {
      name = 'format',
      type = 'TextureFormat',
      description = 'The texture format used by the Canvas.'
    }
  },
  related = {
    'TextureFormat',
    'lovr.graphics.newCanvas'
  }
}

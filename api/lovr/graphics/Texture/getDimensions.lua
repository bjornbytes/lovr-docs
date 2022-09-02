return {
  summary = 'Get the dimensions of the Texture.',
  description = 'Returns the width, height, and depth of the Texture.',
  arguments = {},
  returns = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the Texture.'
    },
    {
      name = 'height',
      type = 'number',
      description = 'The height of the Texture.'
    },
    {
      name = 'layers',
      type = 'number',
      description = 'The number of layers in the Texture.'
    }
  },
  related = {
    'Texture:getWidth',
    'Texture:getHeight',
    'Texture:getLayerCount'
  }
}

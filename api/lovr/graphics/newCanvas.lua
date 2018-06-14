return {
  tag = 'graphicsObjects',
  summary = 'Create a new Canvas.',
  description = 'Creates a new canvas with a given width and height.',
  arguments = {
    {
      name = 'width',
      type = 'number',
      description = 'The width of the canvas, in pixels.'
    },
    {
      name = 'height',
      type = 'number',
      description = 'The height of the canvas, in pixels.'
    },
    {
      name = 'flags',
      type = 'table',
      default = '{}',
      description = 'The height of the canvas, in pixels.',
      table = {
        {
          name = 'format',
          type = 'TextureFormat',
          default = [['rgba']],
          description = 'The internal format to use for the canvas.'
        },
        {
          name = 'msaa',
          type = 'number',
          default = '0',
          description = 'The number of MSAA samples to use for antialiasing.'
        },
        {
          name = 'depth',
          type = 'boolean',
          default = 'true',
          description = 'Whether a depth buffer should be created for the Canvas.'
        },
        {
          name = 'stencil',
          type = 'boolean',
          default = 'false',
          description = 'Whether a stencil buffer should be created.'
        },
        {
          name = 'mipmaps',
          type = 'boolean',
          default = 'true',
          description = 'Whether the Canvas will automatically generate mipmaps.'
        }
      }
    }
  },
  returns = {
    {
      name = 'canvas',
      type = 'Canvas',
      description = 'The new Canvas.'
    }
  },
  notes = [[
    You can render to the Canvas using `Canvas:renderTo`.
  ]]
}

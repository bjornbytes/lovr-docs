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
          name = 'type',
          type = 'CanvasType',
          default = [['3d']],
          description = 'Whether the Canvas uses a 3d or 2d projection.'
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
          default = 'nil',
          description = [[
            Whether a depth buffer should be created for the Canvas.  If set to nil, will be created
            only if the canvas is 3d.
          ]]
        },
        {
          name = 'stencil',
          type = 'boolean',
          default = 'false',
          description = 'Whether a stencil buffer should be created.'
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

return {
  tag = 'graphicsPrimitives',
  summary = 'Modify the stencil buffer.',
  description = 'Renders to the stencil buffer using a function.',
  arguments = {
    {
      name = 'callback',
      type = 'function',
      arguments = {},
      returns = {},
      description = 'The function that will be called to render to the stencil buffer.'
    },
    {
      name = 'action',
      type = 'StencilAction',
      default = [['replace']],
      description = 'How to modify the stencil value of pixels that are rendered to.'
    },
    {
      name = 'replaceValue',
      type = 'number',
      default = '1',
      description = 'If `action` is "replace", this is the value that pixels are replaced with.'
    },
    {
      name = 'keepValues',
      type = 'boolean',
      default = 'false',
      description = 'If false, the stencil buffer will be cleared before rendering.'
    }
  },
  returns = {},
  notes = 'Stencil values are between 0 and 255.',
  related = {
    'lovr.graphics.getStencilTest',
    'lovr.graphics.setStencilTest'
  }
}

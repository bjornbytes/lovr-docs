return {
  summary = 'Different types of depth maps used by Canvases.',
  description = [[
    When you create a Canvas, you can give it a depth buffer, which stores the 3D positions of
    pixels to ensure that the depth of objects is sorted properly.  This depth information can be
    stored in various formats that differ in size and precision.  Additionally, this depth buffer
    can also be used for stenciling information.
  ]],
  values = {
    {
      name = 'd16',
      description = 'A 16 bit depth buffer.'
    },
    {
      name = 'd32f',
      description = 'A 32 bit floating point depth buffer.'
    },
    {
      name = 'd24s8',
      description = 'A depth buffer with 24 bits for depth and 8 bits for stencil.'
    }
  },
  related = {
    'lovr.graphics.newCanvas',
    'Canvas:getDepthFormat',
    'lovr.graphics.getDepthTest',
    'lovr.graphics.setDepthTest',
    'lovr.graphics.stencil',
    'Canvas'
  }
}

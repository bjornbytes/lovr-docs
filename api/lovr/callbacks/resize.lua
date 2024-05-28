return {
  tag = 'callbacks',
  summary = 'Called when the window is resized.',
  description = 'This callback is called when the desktop window is resized.',
  arguments = {
    width = {
      type = 'number',
      description = 'The new width of the window.'
    },
    height = {
      type = 'number',
      description = 'The new height of the window.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'width', 'height' },
      returns = {}
    }
  },
  related = {
    'Pass:getDimensions',
    'Pass:getWidth',
    'Pass:getHeight',
    'lovr.headset.getDisplayDimensions',
    'lovr.conf'
  }
}

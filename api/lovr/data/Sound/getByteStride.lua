return {
  summary = 'Get the byte stride of the Sound.',
  description = [[
    Returns the byte stride of the Sound.  This is the size of each frame, in bytes.  For example, a
    stereo sound with a 32-bit floating point format would have a stride of 8 (4 bytes per sample,
    and 2 samples per frame).
  ]],
  arguments = {},
  returns = {
    stride = {
      type = 'number',
      description = 'The size of a frame, in bytes.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'stride' }
    }
  },
  related = {
    'Sound:getChannelCount',
    'Sound:getFormat'
  }
}

return {
  summary = 'Get Readback\'s data as an Image.',
  description = 'Returns the Readback\'s data as an Image.',
  arguments = {},
  returns = {
    image = {
      type = 'Image',
      description = 'The Image.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'image' }
    }
  },
  notes = 'TODO what if it\'s a buffer or tally?!',
  related = {
    'Readback:getData',
    'Readback:getBlob'
  }
}

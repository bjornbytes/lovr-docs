return {
  summary = 'Get the distance between each item in the Buffer, in bytes.',
  description = 'Returns the distance between each item in the Buffer, in bytes.',
  arguments = {},
  returns = {
    {
      name = 'stride',
      type = 'number',
      description = 'The stride of the Buffer, in bytes.'
    }
  },
  notes = [[
    // TODO zero-stride and straddled-stride
  ]],
  related = {
    'lovr.graphics.getSize',
    'lovr.graphics.getLength'
  }
}

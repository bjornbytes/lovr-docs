return {
  summary = 'Get the size of the Buffer, in bytes.',
  description = 'Returns the size of the Buffer, in bytes.  This is the same as `length * stride`.',
  arguments = {},
  returns = {
    {
      name = 'size',
      type = 'number',
      description = 'The size of the Buffer, in bytes.'
    }
  },
  related = {
    'Buffer:getLength',
    'Buffer:getStride'
  }
}

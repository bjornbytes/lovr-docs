return {
  summary = 'Get Readback\'s data as a table.',
  description = 'Returns the data from the Readback, as a table.',
  arguments = {},
  returns = {
    data = {
      type = 'table',
      description = 'A table containing the values that were read back.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'data' }
    }
  },
  notes = 'TODO what if the readback is a buffer/texture?!',
  related = {
    'Readback:getBlob',
    'Readback:getImage'
  }
}

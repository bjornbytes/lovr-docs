return {
  summary = 'Get Readback\'s data as a table.',
  description = 'Returns the data from the Readback, as a table.',
  arguments = {},
  returns = {
    data = {
      type = 'table',
      description = 'A flat table of numbers containing the values that were read back.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'data' }
    }
  },
  notes = 'This returns `nil` for readbacks of `Texture` objects.',
  related = {
    'Readback:getBlob',
    'Readback:getImage'
  }
}

return {
  summary = 'Clear the data in the Buffer.',
  description = [[
    Clears some or all of the data in the Buffer to zero.  This is supported for both temporary and
    permanent Buffers.  Permanent Buffers can also be cleared in a transfer pass using `Pass:clear`.
  ]],
  arguments = {
    {
      name = 'index',
      type = 'number',
      default = '1',
      description = 'The index of the first item to clear.'
    },
    {
      name = 'count',
      type = 'number',
      default = 'nil',
      description = 'The number of items to clear.  If `nil`, clears as many items as possible.'
    }
  },
  returns = {},
  notes = [[
    Clearing a permanent buffer requires the byte offset and byte count of the cleared range to be a
    multiple of 4.  This will usually be true for most field types.
  ]],
  related = {
    'Pass:clear'
  }
}

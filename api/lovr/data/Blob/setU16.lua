return {
  summary = 'Write 16-bit unsigned integers to the Blob.',
  description = 'Writes 16-bit unsigned integers to the Blob.',
  arguments = {
    offset = {
      type = 'number',
      description = 'A non-negative byte offset to start writing at.'
    },
    ['...'] = {
      type = 'number',
      description = [[
        Numbers to write to the blob as 16-bit unsigned integers (each taking up 2 bytes, ranging
        from 0 to 65535).
      ]]
    },
    table = {
      type = '{number}',
      description = [[
        A table of numbers to write to the blob as 16-bit unsigned integers (each taking up 2 bytes,
        ranging from 0 to 65535).
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'offset', '...' },
      returns = {}
    },
    {
      arguments = { 'offset', 'table' },
      returns = {}
    }
  },
  related = {
    'Blob:getU16',
    'Blob:setI8',
    'Blob:setU8',
    'Blob:setI16',
    'Blob:setI32',
    'Blob:setU32',
    'Blob:setF32',
    'Blob:setF64'
  }
}

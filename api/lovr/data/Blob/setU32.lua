return {
  summary = 'Write 32-bit unsigned integers to the Blob.',
  description = 'Writes 32-bit unsigned integers to the Blob.',
  arguments = {
    offset = {
      type = 'number',
      description = 'A non-negative byte offset to start writing at.'
    },
    ['...'] = {
      type = 'number',
      description = [[
        Numbers to write to the blob as 32-bit unsigned integers (each taking up 4 bytes, ranging
        from 0 to 4294967296).
      ]]
    },
    table = {
      type = '{number}',
      description = [[
        A table of numbers to write to the blob as 32-bit unsigned integers (each taking up 4 bytes,
        ranging from 0 to 4294967296).
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
    'Blob:getU32',
    'Blob:setI8',
    'Blob:setU8',
    'Blob:setI16',
    'Blob:setU16',
    'Blob:setI32',
    'Blob:setF32',
    'Blob:setF64'
  }
}

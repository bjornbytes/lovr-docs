return {
  summary = 'Write 32-bit signed integers to the Blob.',
  description = 'Writes 32-bit signed integers to the Blob.',
  arguments = {
    offset = {
      type = 'number',
      description = 'A non-negative byte offset to start writing at.'
    },
    ['...'] = {
      type = 'number',
      description = [[
        Numbers to write to the blob as 32-bit signed integers (each taking up 4 bytes, ranging from
        -2147483648 to 2147483647).
      ]]
    },
    table = {
      type = '{number}',
      description = [[
        A table of numbers to write to the blob as 32-bit signed integers (each taking up 4 bytes,
        ranging from -2147483648 to 2147483647).
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
    'Blob:getI32',
    'Blob:setI8',
    'Blob:setU8',
    'Blob:setI16',
    'Blob:setU16',
    'Blob:setU32',
    'Blob:setF32',
    'Blob:setF64'
  }
}

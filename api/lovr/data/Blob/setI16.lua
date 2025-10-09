return {
  summary = 'Write 16-bit signed integers to the Blob.',
  description = 'Writes 16-bit signed integers to the Blob.',
  arguments = {
    offset = {
      type = 'number',
      description = 'A non-negative byte offset to start writing at.'
    },
    ['...'] = {
      type = 'number',
      description = [[
        Numbers to write to the blob as 16-bit signed integers (each taking up 2 bytes, ranging from
        -32768 to 32767).
      ]]
    },
    table = {
      type = '{number}',
      description = [[
        A table of numbers to write to the blob as 16-bit signed integers (each taking up 2 bytes,
        ranging from -32768 to 32767).
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
    'Blob:getI16',
    'Blob:setI8',
    'Blob:setU8',
    'Blob:setU16',
    'Blob:setI32',
    'Blob:setU32',
    'Blob:setF32',
    'Blob:setF64'
  }
}

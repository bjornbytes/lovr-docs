return {
  summary = 'Write 8-bit signed integers to the Blob.',
  description = 'Writes 8-bit signed integers to the Blob.',
  arguments = {
    offset = {
      type = 'number',
      description = 'A non-negative byte offset to start writing at.'
    },
    ['...'] = {
      type = 'number',
      description = [[
        Numbers to write to the blob as 8-bit signed integers (each taking up 1 byte, ranging from
        -127 to 128).
      ]]
    },
    table = {
      type = '{number}',
      description = [[
        A table of numbers to write to the blob as 8-bit signed integers (each taking up 1 byte,
        ranging from -127 to 128).
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
    'Blob:getI8',
    'Blob:setU8',
    'Blob:setI16',
    'Blob:setU16',
    'Blob:setI32',
    'Blob:setU32',
    'Blob:setF32',
    'Blob:setF64'
  }
}

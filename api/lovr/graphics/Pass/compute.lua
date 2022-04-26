return {
  tag = 'compute',
  summary = 'Dispatch a compute shader.',
  description = 'TODO',
  arguments = {
     x = {
       type = 'number',
       default = '1',
       description = 'How many workgroups to dispatch in the x dimension.'
     },
     y = {
       type = 'number',
       default = '1',
       description = 'How many workgroups to dispatch in the y dimension.'
     },
     z = {
       type = 'number',
       default = '1',
       description = 'How many workgroups to dispatch in the z dimension.'
     },
     buffer = {
       type = 'Buffer',
       description = [[
         A Buffer object containing the x, y, and z workgroup counts, stored as 4 byte unsigned
         integers.
       ]]
     },
     offset = {
       type = 'number',
       default = '0',
       description = 'The byte offset to read the workgroup counts from in the Buffer.'
     }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = 'Perform an "indirect" dispatch, sourcing workgroup counts from a Buffer.',
      arguments = { 'buffer', 'offset' },
      returns = {}
    }
  },
  notes = 'TODO'
}

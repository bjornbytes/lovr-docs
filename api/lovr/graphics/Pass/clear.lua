return {
  tag = 'transfer',
  summary = 'Clear a Buffer or Texture.',
  description = 'TODO',
  arguments = {
     buffer = {
       type = 'Buffer',
       description = 'The Buffer to clear.'
     },
     offset = {
       type = 'number',
       description = 'TODO'
     },
     extent = {
       type = 'number',
       description = 'TODO'
     },
     texture = {
       type = 'Texture',
       description = 'The Texture to clear.'
     },
     color = {
       type = 'Color',
       description = 'The color to clear to.'
     },
     layer = {
       type = 'number',
       default = '1',
       description = 'The index of the first layer to clear.'
     },
     layers = {
       type = 'number',
       default = 'nil',
       description = 'The number of layers to clear.'
     },
     level = {
       type = 'number',
       default = '1',
       description = 'The index of the first mipmap level to clear.'
     },
     levelCount = {
       type = 'number',
       default = 'nil',
       description = 'The number of mipmap level to clear.'
     }
  },
  returns = {},
  variants = {
    {
      arguments = { 'buffer', 'offset', 'extent' },
      returns = {}
    },
    {
      arguments = { 'texture', 'color', 'layer', 'layers', 'level', 'levels' },
      returns = {}
    }
  },
  notes = 'TODO'
}

return {
  tag = 'transfer',
  summary = 'Copy data to or between GPU resources.',
  description = 'TODO',
  arguments = {
    table = {
      type = 'table',
      description = 'TODO'
    },
    blob = {
      type = 'Blob',
      description = 'TODO'
    },
    buffersrc = {
      type = 'Buffer',
      description = 'TODO'
    },
    image = {
      type = 'Image',
      description = 'TODO'
    },
    texturesrc = {
      type = 'Texture',
      description = 'TODO'
    },
    tally = {
      type = 'Tally',
      description = 'TODO'
    },
    bufferdst = {
      type = 'Buffer',
      description = 'TODO'
    },
    texturedst = {
      type = 'Texture',
      description = 'TODO'
    },
    srcindex = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    dstindex = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    srcoffset = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    dstoffset = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    count = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    },
    size = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    },
    srcx = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    srcy = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    dstx = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    dsty = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    width = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    },
    height = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    },
    srclayer = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    dstlayer = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    layers = {
      type = 'number',
      default = 'nil',
      description = 'TODO'
    },
    srclevel = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    dstlevel = {
      type = 'number',
      default = '1',
      description = 'TODO'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Copy table data to a Buffer.',
      arguments = { 'table', 'bufferdst', 'srcindex', 'dstindex', 'count' },
      returns = {}
    },
    {
      description = 'Copy binary data to a Buffer.',
      arguments = { 'blob', 'bufferdst', 'srcoffset', 'dstoffset', 'size' },
      returns = {}
    },
    {
      description = 'Copy data between Buffers.',
      arguments = { 'buffersrc', 'bufferdst', 'srcoffset', 'dstoffset', 'size' },
      returns = {}
    },
    {
      description = 'Copy Image data to a Texture.',
      arguments = { 'image', 'texturedst', 'srcx', 'srcy', 'dstx', 'dsty', 'width', 'height', 'srclayer', 'dstlayer', 'layers', 'srclevel', 'dstlevel' },
      returns = {}
    },
    {
      description = 'Copy data between Textures.',
      arguments = { 'texturesrc', 'texturedst', 'srcx', 'srcy', 'dstx', 'dsty', 'width', 'height', 'srclayer', 'dstlayer', 'layers', 'srclevel', 'dstlevel' },
      returns = {}
    },
    {
      description = 'Copy tally data to a Buffer.',
      arguments = { 'tally', 'srcindex', 'dstoffset', 'count' },
      returns = {}
    }
  }
}

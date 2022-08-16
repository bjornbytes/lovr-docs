return {
  tag = 'transfer',
  summary = 'Download data from a GPU resource.',
  description = 'TODO',
  arguments = {
    buffer = {
      type = 'Buffer',
      description = 'TODO'
    },
    texture = {
      type = 'Texture',
      description = 'TODO'
    },
    tally = {
      type = 'Tally',
      description = 'TODO'
    },
    index = {
      type = 'number',
      description = 'TODO'
    },
    count = {
      type = 'number',
      description = 'TODO'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    layer = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    level = {
      type = 'number',
      default = '1',
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
    readback = {
      type = 'Readback',
      description = 'TODO'
    }
  },
  variants = {
    {
      arguments = { 'buffer', 'index', 'count' },
      returns = { 'readback' }
    },
    {
      arguments = { 'texture', 'x', 'y', 'layer', 'level', 'width', 'height' },
      returns = { 'readback' }
    },
    {
      arguments = { 'tally', 'index', 'count' },
      returns = { 'readback' }
    }
  }
}

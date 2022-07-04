return {
  summary = 'Create a new Font.',
  description = 'TODO',
  arguments = {
    filename = {
      type = 'string',
      description = 'TODO'
    },
    blob = {
      type = 'Blob',
      description = 'TODO'
    },
    rasterizer = {
      type = 'Rasterizer',
      description = 'TODO'
    },
    size = {
      type = 'number',
      default = '32',
      description = 'TODO'
    },
    spread = {
      type = 'number',
      default = '4',
      description = 'TODO'
    }
  },
  returns = {
    font = {
      type = 'Font',
      description = 'The new Font.'
    }
  },
  variants = {
    {
      arguments = { 'filename', 'size', 'spread' },
      returns = { 'font' }
    },
    {
      arguments = { 'blob', 'size', 'spread' },
      returns = { 'font' }
    },
    {
      arguments = { 'size', 'spread' },
      returns = { 'font' }
    },
    {
      arguments = { 'rasterizer', 'spread' },
      returns = { 'font' }
    }
  },
  related = {
    'lovr.graphics.getDefaultFont',
    'lovr.data.newRasterizer',
    'Pass:text'
  }
}

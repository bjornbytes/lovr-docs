return {
  tag = 'drawing',
  summary = 'Use draw parameters stored in a Buffer to draw a mesh multiple times.',
  description = 'TODO',
  arguments = {
    vertices = {
      type = 'Buffer',
      description = 'TODO'
    },
    indices = {
      type = 'Buffer',
      description = 'TODO'
    },
    draws = {
      type = 'Buffer',
      description = 'TODO'
    },
    count = {
      type = 'number',
      default = '1',
      description = 'TODO'
    },
    offset = {
      type = 'number',
      default = '0',
      description = 'TODO'
    },
    stride = {
      type = 'number',
      default = '0',
      description = 'TODO'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'vertices', 'indices', 'draws', 'count', 'offset', 'stride' },
      returns = {}
    }
  },
  notes = 'TODO'
}

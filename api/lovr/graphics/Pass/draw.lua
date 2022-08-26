return {
  tag = 'drawing',
  summary = 'Draw a drawable object.',
  description = 'TODO',
  arguments = {
    transform = {
      type = 'Transform',
      description = 'The transform of the object.'
    },
    model = {
      type = 'Model',
      description = 'The model to draw.'
    },
    nodeindex = {
      type = 'number',
      description = 'TODO'
    },
    nodename = {
      type = 'string',
      description = 'TODO'
    },
    children = {
      type = 'boolean',
      description = 'TODO'
    },
    instances = {
      type = 'number',
      description = 'TODO'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'model', 'transform', 'nodeindex', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'transform', 'nodename', 'children', 'instances' },
      returns = {}
    }
  }
}

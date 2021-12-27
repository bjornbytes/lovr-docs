return {
  tag = 'drawing',
  summary = 'Draw a Model.',
  description = 'TODO',
  arguments = {
    model = {
      type = 'Model',
      description = 'The Model to draw.'
    },
    transform = {
      type = 'transform',
      description = 'The transform to apply to the model.'
    },
    node = {
      type = 'number',
      default = 'nil',
      description = 'The 1-based index of the node to render.  If `nil`, the root node is used.'
    },
    name = {
      type = 'string',
      default = 'nil',
      description = 'The name of the node to render.  If `nil`, the root node is used.'
    },
    children = {
      type = 'boolean',
      default = 'true',
      description = 'Whether the child nodes should be rendered recursively.'
    },
    instances = {
      type = 'number',
      default = '1',
      description = 'How many copies of the model to render.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'model', 'transform', 'node', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'transform', 'name', 'children', 'instances' },
      returns = {}
    }
  },
  notes = 'TODO skinning'
}

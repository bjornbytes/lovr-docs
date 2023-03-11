return {
  tag = 'drawing',
  summary = 'Draw a model.',
  description = 'Draws a model.',
  arguments = {
    model = {
      type = 'Model',
      description = 'The model to draw.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate to draw the model at.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate to draw the model at.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate to draw the model at.'
    },
    scale = {
      type = 'number',
      default = '1',
      description = 'The scale of the model.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The rotation of the model around its rotation axis, in radians.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '1',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    },
    position = {
      type = 'Vec3',
      description = 'The position to draw the model at.'
    },
    orientation = {
      type = 'Quat',
      description = 'The orientation of the model.'
    },
    transform = {
      type = 'Mat4',
      description = 'The transform of the model.'
    },
    nodeindex = {
      type = 'number',
      default = 'nil',
      description = 'The index of the node to draw.  If nil, the root node is drawn.'
    },
    nodename = {
      type = 'string',
      default = 'nil',
      description = 'The name of the node to draw.  If nil, the root node is drawn.'
    },
    children = {
      type = 'boolean',
      default = 'true',
      description = 'Whether the children of the node should be drawn.'
    },
    instances = {
      type = 'number',
      default = '1',
      description = 'The number of instances to draw.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'model', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'nodeindex', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'position', 'scale', 'orientation', 'nodeindex', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'transform', 'nodeindex', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'nodename', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'position', 'scale', 'orientation', 'nodename', 'children', 'instances' },
      returns = {}
    },
    {
      arguments = { 'model', 'transform', 'nodename', 'children', 'instances' },
      returns = {}
    }
  }
}

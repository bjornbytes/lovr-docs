return {
  summary = 'Draw multiple copies of the Mesh in an optimized way.',
  description = [[
    Draw a Mesh multiple times.  This is much faster than calling `Mesh:draw` more than once.
  ]],
  arguments = {
    instances = {
      type = 'number',
      default = '1',
      description = 'The number of copies of the mesh to draw.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate to draw the Mesh at.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate to draw the Mesh at.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate to draw the Mesh at.'
    },
    scale = {
      type = 'number',
      default = '1',
      description = 'The scale to draw the Mesh at.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The angle to rotate the Mesh around its axis of rotation.'
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
    transform = {
      type = 'Transform',
      description = 'The transform to apply before drawing.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'instances', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'instances', 'transform' },
      returns = {}
    }
  },
  notes = [[
    By default, the Meshes will all be drawn on top of each other.  To get the drawn copies to
    appear in different places, you can use the `gl_InstanceID` variable in a `Shader`.  The first
    instance will pass 0 as the instance ID, the second instance will pass 1 as the instance ID,
    etc.  You can use an array of mat4 variables and access the array using the supplied instance ID
    to specify a list of positions to draw the instances at, or use custom logic to position each
    instance.
  ]]
}

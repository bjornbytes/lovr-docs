return {
  summary = 'Move an object in the Raytracer.',
  description = [[
    Moves a `Mesh` or `Model` to the Raytracer, using an ID previously returned by `Raytracer:add`.
    This function can also change the layer mask and tag of the object.

    After adding and moving objects, call `Raytracer:build` to finalize the raytracer.
  ]],
  arguments = {
    id = {
      type = 'number',
      description = 'The ID of the object to change.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate to place the object at.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate to place the object at.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate to place the object at.'
    },
    scale = {
      type = 'number',
      default = '1',
      description = 'The scale of the object.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The rotation of the object around its rotation axis, in radians.'
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
      type = 'vector',
      description = 'The position to place the object at.'
    },
    scale3 = {
      type = 'vector',
      description = 'The scale of the object.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The orientation of the object.'
    },
    transform = {
      type = 'Mat4',
      description = 'The transform of the object.'
    },
    layers = {
      type = 'number?',
      description = 'The new layer mask for the object, or nil to leave it unchanged.'
    },
    tag = {
      type = 'number?',
      description = 'The new tag for the object, or nil to leave it unchanged.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'id', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'layers', 'tag' },
      returns = {}
    },
    {
      arguments = { 'id', 'position', 'scale3', 'orientation', 'layers', 'tag' },
      returns = {}
    },
    {
      arguments = { 'id', 'transform', 'layers', 'tag' },
      returns = {}
    }
  },
  related = {
    'Raytracer:add',
    'Raytracer:build'
  }
}

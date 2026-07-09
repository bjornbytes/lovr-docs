return {
  summary = 'Add an object to the Raytracer.',
  description = [[
    Adds a `Mesh` or `Model` to the Raytracer.

    The object has a custom transform, and exists on up to 8 layers, given as a bitmask.

    After adding all objects to the Raytracer, call `Raytracer:build` to finalize the raytracer.
  ]],
  arguments = {
    mesh = {
      type = 'Mesh',
      description = 'The Mesh to add to the Raytracer.'
    },
    model = {
      type = 'Model',
      description = 'The Model to add to the Raytracer.'
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
      default = '0xff',
      description = [[
        A binary bitmask of 8 layers to place the object on.  The object is placed on all layers by
        default.  For example, 0x1 will place the object on the first layer, 0x2 will place it on
        the second layer, 0x3 for the first two layers, etc.
      ]]
    },
    tag = {
      type = 'number?',
      description = [[
        A custom tag for the object, provided in the shader when the object is hit.  Shaders can use
        this tag for whatever they want.  If nil, the tag will be set to the same ID as the one
        returned by this function. The tag can be between 0 and 16,777,215.
      ]]
    }
  },
  returns = {
    id = {
      type = 'number',
      description = [[
        An ID for the object.  Use it to move the object layer using `Raytracer:set`.  If the
        Raytracer is full, the object is not added and this ID will be nil.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'mesh', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'layers', 'tag' },
      returns = { 'id' }
    },
    {
      arguments = { 'model', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'layers', 'tag' },
      returns = { 'id' }
    },
    {
      arguments = { 'mesh', 'position', 'scale3', 'orientation', 'layers', 'tag' },
      returns = { 'id' }
    },
    {
      arguments = { 'model', 'position', 'scale3', 'orientation', 'layers', 'tag' },
      returns = { 'id' }
    },
    {
      arguments = { 'mesh', 'transform', 'layers', 'tag' },
      returns = { 'id' }
    },
    {
      arguments = { 'model', 'transform', 'layers', 'tag' },
      returns = { 'id' }
    }
  },
  related = {
    'Raytracer:set',
    'Raytracer:build',
    'Raytracer:clear'
  }
}

return {
  tag = 'drawing',
  summary = 'Draw a part of a Model.',
  description = [[
    Draws a single mesh or part of a mesh in a Model.

    Meshes in models can be split into multiple "parts", where each part has its own draw mode and
    material.  This function can draw a single one of these parts, or all of the parts in a single
    mesh.

    Drawing individual meshes or parts is useful because it allows for materials, graphics states,
    and shader uniforms to be changed in between each draw.
  ]],
  arguments = {
    model = {
      type = 'Model',
      description = 'The Model to draw.'
    },
    mesh = {
      type = 'number',
      description = 'The index of the mesh to draw.'
    },
    part = {
      type = 'number',
      description = 'The index of one of the parts in the mesh to draw.'
    },
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate to draw at.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate to draw at.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate to draw at.'
    },
    scale = {
      type = 'number',
      default = '1',
      description = 'The scale.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'The rotation around the rotation axis, in radians.'
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
      description = 'The position to draw at.'
    },
    scale3 = {
      type = 'vector',
      description = 'The scale, as a vector.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The orientation.'
    },
    transform = {
      type = 'Mat4',
      description = 'The transform.'
    },
    instances = {
      type = 'number?',
      default = '1',
      description = 'The number of instances to draw.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Draw all of the parts of a mesh.',
      arguments = { 'model', 'mesh', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'instances' },
      returns = {}
    },
    {
      description = 'Draw all of the parts of a mesh.',
      arguments = { 'model', 'mesh', 'position', 'scale3', 'orientation', 'instances' },
      returns = {}
    },
    {
      description = 'Draw all of the parts of a mesh.',
      arguments = { 'model', 'mesh', 'transform', 'instances' },
      returns = {}
    },
    {
      description = 'Draw a single part of a mesh.',
      arguments = { 'model', 'mesh', 'part', 'x', 'y', 'z', 'scale', 'angle', 'ax', 'ay', 'az', 'instances' },
      returns = {}
    },
    {
      description = 'Draw a single part of a mesh.',
      arguments = { 'model', 'mesh', 'part', 'position', 'scale3', 'orientation', 'instances' },
      returns = {}
    },
    {
      description = 'Draw a single part of a mesh.',
      arguments = { 'model', 'mesh', 'part', 'transform', 'instances' },
      returns = {}
    }
  },
  example = [[
    function lovr.draw(pass)
      for node, mesh in model:meshes() do
        local x, y, z, scale, _, _, angle, ax, ay, az = model:getNodeTransform(node)

        for part = 1, model:getMeshPartCount(mesh) do
          pass:drawPart(model, mesh, part, x, y, z, scale, angle, ax, ay, az)
        end
      end
    end
  ]],
  related = {
    'Pass:draw',
    'Model:meshes'
  }
}

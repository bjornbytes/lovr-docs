return {
  tag = 'graphicsState',
  summary = 'Set the camera projection.',
  description = [[
    Sets the camera projection.  The projection settings define the camera frustum: How wide of a
    field of view the camera has and how far away the near and far clipping planes are.  If an
    object is outside of this field of view, closer than the near clipping plane, or further away
    than the far clipping plane, then it will not be rendered.
  ]],
  arguments = {
    {
      name = 'near',
      type = 'number',
      description = 'How far away the near clipping plane is, in meters.'
    },
    {
      name = 'far',
      type = 'number',
      description = 'How far away the far clipping plane is, in meters.'
    },
    {
      name = 'fov',
      type = 'number',
      description = 'The vertical field of view of the camera, in radians.'
    }
  },
  returns = {}
}

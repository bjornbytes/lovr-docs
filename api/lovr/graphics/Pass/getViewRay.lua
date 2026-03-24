return {
  tag = 'camera',
  summary = 'Get a world space ray for a pixel in the Pass\'s canvas.',
  description = [[
    Returns a world space ray for a pixel in the Pass's canvas.  This is useful for interacting with
    objects with the mouse.  This uses the current pose and projection of the camera, previously set
    using `Pass:setViewPose` and `Pass:setProjection`.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the pixel.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the pixel.'
    },
    view = {
      type = 'number',
      default = '1',
      description = 'The view (camera) to get the ray for.'
    }
  },
  returns = {
    x = {
      type = 'number',
      description = 'The x coordinate of the origin of the ray (on the near plane of the camera).'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the origin of the ray (on the near plane of the camera).'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the origin of the ray (on the near plane of the camera).'
    },
    dx = {
      type = 'number',
      description = 'The x component of the ray\'s direction (normalized).'
    },
    dy = {
      type = 'number',
      description = 'The y component of the ray\'s direction (normalized).'
    },
    dz = {
      type = 'number',
      description = 'The z component of the ray\'s direction (normalized).'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'view' },
      returns = { 'x', 'y', 'z', 'dx', 'dy', 'dz' },
    }
  },
  notes = 'The upper-left of the canvas is located at `(0,0)`.',
  related = {
    'Pass:setViewPose',
    'Pass:setProjection',
    'lovr.system.getMousePosition',
    'World:raycast'
  }
}

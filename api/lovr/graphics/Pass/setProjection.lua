return {
  tag = 'camera',
  summary = 'Set the field of view.',
  description = [[
    Sets the projection for a single view.  4 field of view angles can be used, similar to the field
    of view returned by `lovr.headset.getViewAngles`.  Alternatively, a projection matrix can be
    used for other types of projections like orthographic, oblique, etc.  There is also a shorthand
    string "orthographic" that can be used to configure an orthographic projection.

    Up to 6 views are supported, one for each eye.  When rendering to the headset, both projections
    are changed to match the ones used by the headset.
  ]],
  arguments = {
    view = {
      type = 'number',
      description = 'The index of the view to update.'
    },
    left = {
      type = 'number',
      description = 'The left field of view angle, in radians.'
    },
    right = {
      type = 'number',
      description = 'The right field of view angle, in radians.'
    },
    up = {
      type = 'number',
      description = 'The top field of view angle, in radians.'
    },
    down = {
      type = 'number',
      description = 'The bottom field of view angle, in radians.'
    },
    near = {
      type = 'number',
      default = '.01',
      description = 'The near clipping plane distance, in meters.'
    },
    far = {
      type = 'number',
      default = '100.0',
      description = 'The far clipping plane distance, in meters.'
    },
    matrix = {
      type = 'Mat4',
      description = 'The projection matrix for the view.'
    },
    orthographic = {
      type = 'string',
      description = 'The shortcut string \'orthographic\'.'
    },
    width = {
      type = 'number',
      description = 'The width of the orthographic projection.'
    },
    height = {
      type = 'number',
      description = 'The height of the orthographic projection.'
    },
    clipNear = {
      type = 'number',
      default = '-1.0',
      description = 'The near clipping plane.'
    },
    clipFar = {
      type = 'number',
      default = '1.0',
      description = 'The far clipping plane.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'view', 'left', 'right', 'up', 'down', 'near', 'far' },
      returns = {}
    },
    {
      arguments = { 'view', 'matrix' },
      returns = {}
    },
    {
      arguments = { 'view', 'orthographic', 'width', 'height', 'clipNear', 'clipFar' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.getViewAngles',
    'lovr.headset.getViewCount',
    'lovr.graphics.getViewPose',
    'lovr.graphics.setViewPose'
  }
}

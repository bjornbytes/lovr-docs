return {
  tag = 'camera',
  summary = 'Set the field of view.',
  description = [[
    Sets the projection for a single view.  4 field of view angles can be used, similar to the field
    of view returned by `lovr.headset.getViewAngles`.  Alternatively, a projection matrix can be
    used for other types of projections like orthographic, oblique, etc.

    Up to 6 views are supported.  The Pass returned by `lovr.headset.getPass` will have its views
    automatically configured to match the headset.
  ]],
  arguments = {
    view = {
      type = 'number',
      description = 'The index of the view to update.'
    },
    left = {
      type = 'number',
      description = [[
        The left field of view angle, in radians.  Positive values are to the left of the view
        center.
      ]]
    },
    right = {
      type = 'number',
      description = [[
        The right field of view angle, in radians.  Positive values are to the right of the view
        center.
      ]]
    },
    up = {
      type = 'number',
      description = [[
        The top field of view angle, in radians.  Positive values are above the view center.
      ]]
    },
    down = {
      type = 'number',
      description = [[
        The bottom field of view angle, in radians.  Positive values are below the view center.
      ]]
    },
    near = {
      type = 'number',
      default = '.01',
      description = 'The near clipping plane distance, in meters.'
    },
    far = {
      type = 'number',
      default = '0.0',
      description = 'The far clipping plane distance, in meters.'
    },
    matrix = {
      type = 'Mat4',
      description = 'The projection matrix for the view.'
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
    }
  },
  notes = [[
    A far clipping plane of 0.0 can be used for an infinite far plane with reversed Z range.  This
    is the default because it improves depth precision and reduces Z fighting.  Using a non-infinite
    far plane requires the depth buffer to be cleared to 1.0 instead of 0.0 and the default depth
    test to be changed to `lequal` instead of `gequal`.

    By default, the projection is set by the headset.  Each HMD has a specific field of view given
    by `lovr.headset.getViewAngles`, and the clipping planes can be customized with
    `lovr.headset.setClipDistance`.
  ]],
  example = [[
    function lovr.draw(pass)
      -- Perspective
      local fov = math.rad(60)
      local aspect = pass:getWidth() / pass:getHeight()
      local near, far = .1, 0
      pass:setProjection(1, mat4():perspective(fov, aspect, near, far))

      -- Asymmetric
      local fov = math.rad(60) / 2
      local near, far = .1, 0
      pass:setProjection(1, fov, fov, fov, fov, near, far)

      -- Orthographic/2D
      pass:setProjection(1, mat4():orthographic(pass:getDimensions()))
    end
  ]],
  related = {
    'lovr.headset.getViewAngles',
    'lovr.headset.getViewCount',
    'Pass:getViewPose',
    'Pass:setViewPose'
  }
}

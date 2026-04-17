return {
  tag = 'camera',
  summary = 'Set the camera projection.',
  description = [[
    Sets the camera projection.  This can set the projection for a single view by giving its index,
    otherwise the projection will be set for all views.  The number of views is determined by the
    number of array layers in the canvas textures.

    The Pass returned by `lovr.headset.getPass` will have its views automatically configured to
    match the headset.
  ]],
  arguments = {
    view = {
      type = 'number',
      description = 'The index of the view to update.'
    },
    matrix = {
      type = 'Mat4',
      description = 'The projection matrix.'
    },
    type = {
      type = 'ProjectionType',
      description = 'The type of projection to set.'
    },
    ['...'] = {
      type = 'number',
      description = 'Parameters for the projection.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'type', '...' },
      returns = {}
    },
    {
      arguments = { 'matrix' },
      returns = {}
    },
    {
      arguments = { 'view', 'type', '...' },
      returns = {}
    },
    {
      arguments = { 'view', 'matrix' },
      returns = {}
    }
  },
  notes = [[
    By default, the projection is set by the headset.  Each HMD has a specific field of view given
    by `lovr.headset.getViewAngles`, and the clipping planes can be customized with
    `lovr.headset.setClipDistance`.
  ]],
  example = [[
    function lovr.draw(pass)
      -- Orthographic/2D
      pass:setProjection('orthographic')

      -- 90 degree perspective projection
      pass:setProjection('perspective', math.rad(90))

      -- Asymmetric, for 1 view
      local fov = math.rad(60) / 2
      pass:setProjection(1, fov, fov, fov, fov, .1, 0)

      -- Copying from headset
      for i = 1, lovr.headset.getViewCount() do
        local left, right, up, down = lovr.headset.getViewAngles(i)
        local near, far = lovr.headset.getClipDistance()
        pass:setProjection(i, left, right, up, down, near, far)
      end
    end
  ]],
  related = {
    'lovr.headset.getViewAngles',
    'lovr.headset.getViewCount',
    'Pass:getViewPose',
    'Pass:setViewPose'
  }
}

return {
  summary = 'Returns the view count of a render pass.',
  description = [[
    Returns the view count of a render pass.  This is the layer count of the textures it is
    rendering to.
  ]],
  arguments = {},
  returns = {
    {
      name = 'views',
      type = 'number',
      description = 'The view count.'
    }
  },
  notes = [[
    A render pass has one "camera" for each view.  Whenever something is drawn, it is broadcast to
    each view (layer) of each texture, using the corresponding camera.
  ]],
  related = {
    'Pass:getViewPose',
    'Pass:setViewPose',
    'Pass:getProjection',
    'Pass:setProjection',
    'lovr.headset.getViewCount'
  }
}

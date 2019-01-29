return {
  tag = 'callbacks',
  summary = 'Called to render content to the desktop window.',
  description = [[
    This callback is called every frame after rendering to the headset and is usually used to render
    a mirror of the headset display onto the desktop window.  It can be overridden for custom
    mirroring behavior.  For example, you could render a single eye instead of a stereo view, apply
    postprocessing effects, add 2D UI, or render the scene from an entirely different viewpoint for
    a third person camera.
  ]],
  arguments = {},
  returns = {},
  notes = [[
    When this callback is called, the camera is located at `(0, 0, 0)` and is looking down the
    negative-z axis.
  ]],
  example = {
    description = [[
      The default `lovr.mirror` implementation draws the headset mirror texture to the window if
      the headset is active, or just calls `lovr.draw` if there isn't a headset.
    ]],
    code = [[
      function lovr.mirror()
        if lovr.headset then
          local texture = lovr.headset.getMirrorTexture()
          if texture then
            lovr.graphics.fill(texture)
          end
        else
          lovr.graphics.clear()
          lovr.draw()
        end
      end
    ]]
  },
  related = {
    'lovr.headset.renderTo',
    'lovr.headset.getMirrorTexture',
    'lovr.graphics.createWindow',
    'lovr.graphics.setProjection',
    'lovr.draw'
  }
}

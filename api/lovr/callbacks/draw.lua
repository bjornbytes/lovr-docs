return {
  tag = 'callbacks',
  summary = 'Called continuously to render frames to the display.',
  description = [[
    This callback is called every frame.  Use it to render the scene.  If a VR headset is connected,
    anything rendered by this function will appear in the headset display.  The display is cleared
    to the background color before this function is called.
  ]],
  arguments = {
    {
      name = 'pass',
      type = 'Pass',
      description = 'A render pass targeting the main display (headset or window).'
    }
  },
  returns = {
    {
      name = 'skip',
      type = 'boolean',
      description = 'Whether the input Pass should be submitted to the GPU.'
    }
  },
  related = {
    'lovr.mirror',
    'lovr.headset.getPass',
    'lovr.graphics.setBackgroundColor'
  }
}

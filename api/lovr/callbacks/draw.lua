return {
  tag = 'callbacks',
  summary = 'Called continuously to render frames to the display.',
  description = [[
    This callback is called every frame.  Use it to render the scene.  If a VR headset is connected,
    this function will be called twice per frame (once for each eye) and the function will instead
    draw to the headset's display.
  ]],
  arguments = {},
  returns = {},
  related = {
    'lovr.headset.renderTo'
  }
}

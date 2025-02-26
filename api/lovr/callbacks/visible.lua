return {
  tag = 'callbacks',
  summary = 'Called when the application gains or loses visibility.',
  description = [[
    The `lovr.visible` callback is called whenever the application becomes visible or invisible.
    `lovr.draw` may still be called even while invisible to give the VR runtime timing info.  If the
    VR runtime decides the application doesn't need to render anymore, LÖVR will detect this and
    stop calling `lovr.draw`.

    This event is also fired when the desktop window is minimized or restored.  It's possible to
    distinguish between the headset and window using the `display` parameter.
  ]],
  arguments = {
    visible = {
      type = 'boolean',
      description = 'Whether the application is visible.'
    },
    display = {
      type = 'DisplayType',
      description = 'Whether the headset or desktop window changed visibility.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'visible', 'display' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.isVisible',
    'lovr.focus'
  }
}

return {
  summary = 'Get the Device the layer is attached to.',
  description = [[
    Returns the Device the layer is attached to.

    Normally, layer poses are in "world space", relative to the default coordinate space origin.
    When a layer is attached to a device, its pose is relative to the device instead.  This is
    useful for creating layers that are attached to a controller, or HUD elements that track the
    head, without having to reposition them every frame.
  ]],
  arguments = {},
  returns = {
    device = {
      type = 'Device',
      description = [[
        The device the layer is attached to, or `nil` if it isn't attached to a device.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'device' }
    }
  },
  notes = [[
    Since layers are rendered by the system instead of by LÖVR, using a device for the layer will
    ensure it tracks the device smoothly even if LÖVR is rendering at a low frame rate, or if LÖVR
    pauses rendering temporarily.  Head-locked layers can be useful for displaying a loading icon
    early, while other assets are loading.
  ]],
  related = {
    'Layer:getPosition',
    'Layer:setPosition',
    'Layer:getOrientation',
    'Layer:setOrientation',
    'Layer:getPose',
    'Layer:setPose'
  }
}

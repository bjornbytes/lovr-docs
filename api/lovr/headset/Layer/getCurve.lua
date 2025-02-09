return {
  summary = 'Get the curve of the layer.',
  description = [[
    Returns the curve of the layer.  Curving a layer renders it on a piece of a cylinder instead of
    a plane. The radius of the cylinder is `1 / curve` meters, so increasing the curve decreases the
    radius of the cylinder.
  ]],
  arguments = {},
  returns = {
    curve = {
      type = 'number',
      description = 'The curve of the layer.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'curve' }
    }
  },
  notes = [[
    When a layer is created, its curve is zero.

    Not every headset system supports curved layers.  See the `layerCurve` property of
    `lovr.headset.getFeatures` to check for support.

    No matter what the curve is, the center of the layer texture will always get rendered at the
    layer's pose.

    The largest possible curve is `2 * math.pi / width`, where `width` is the width of the layer in
    meters.  This would cause the cylinder to fully wrap around.
  ]]
}

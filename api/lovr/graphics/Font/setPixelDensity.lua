return {
  summary = 'Set the pixel density of the Font.',
  description = [[
    Sets the pixel density for the Font.  Normally, this is in pixels per meter.  When rendering to
    a 2D texture, the units are pixels.
  ]],
  arguments = {
    {
      name = 'pixelDensity',
      type = 'number',
      description = 'The new pixel density.'
    }
  },
  returns = {}
}

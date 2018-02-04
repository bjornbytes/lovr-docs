return {
  summary = 'Different internal storage formats for Canvas objects.',
  description = [[
    Canvas objects can use different internal storage formats. These formats differ in how much
    space each pixel takes up and the precision of each color channel. In general, formats that take
    up more space support better precision and can be used for HDR rendering, but can reduce
    performance.
  ]],
  values = {
    {
      name = 'rgb',
      description = 'Each pixel is 24 bits, or 8 bits for each channel.'
    },
    {
      name = 'rgba',
      description = 'Each pixel is 32 bits, or 8 bits for each channel (including alpha).'
    },
    {
      name = 'rgba16f',
      description = 'Each pixel is 64 bits. Each channel is a 16 bit floating point number.'
    },
    {
      name = 'rgba32f',
      description = 'Each pixel is 128 bits. Each channel is a 32 bit floating point number.'
    },
    {
      name = 'rg11b10f',
      description = 'Each pixel is 32 bits, and packs three color channels into 10 or 11 bits each.'
    }
  }
}

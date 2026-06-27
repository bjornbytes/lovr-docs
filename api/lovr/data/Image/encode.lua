return {
  summary = 'Encode the Image as png.',
  description = [[
    Encodes the Image to an **uncompressed** png.  This intended to be used mainly for debugging or
    tooling.
  ]],
  arguments = {},
  returns = {
    blob = {
      type = 'Blob',
      description = 'A new Blob containing the PNG image data.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'blob' }
    }
  },
  notes = [[
    The following texture formats are supported:

    - `r8`
    - `rg8`
    - `rgba8`
    - `bgra8`
    - `r16`
    - `rg16`
    - `rgba16`
    - `rgb565`
    - `rgb5a1`
    - `rgb10a2`

    The PNG will be 16-bit for `r16`, `rg16`, `rgba16`, and `rgb10a2`, otherwise it will be 8-bit.

    The PNG will always have 4 channels (RGBA).
  ]],
  related = {
    'lovr.filesystem.write'
  }
}

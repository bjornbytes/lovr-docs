return {
  summary = 'Get the number of MSAA samples in the Texture.',
  description = [[
    Returns the number of multisample antialiasing (MSAA) samples in the Texture.  Multisampling is
    used for antialiasing when rendering to the Texture.  Using more samples will cause the Texture
    to use additional memory but reduce aliasing artifacts.
  ]],
  arguments = {},
  returns = {
    {
      name = 'samples',
      type = 'number',
      description = 'The number of samples in the Texture.'
    }
  },
  notes = 'Currently, the sample count must be either 1 or 4.',
  related = {
    'lovr.graphics.newTexture'
  }
}

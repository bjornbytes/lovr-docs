return {
  summary = 'An object that stores pixel data for Textures.',
  description = [[
    A TextureData stores raw pixel info for `Texture`s.  It has a width and a height.  Currently,
    all TextureData is in the RGBA format.

    Usually you can just use Textures, but TextureData can be useful if you want to manipulate
    individual pixels or load Textures in a background thread.
  ]],
  constructors = {
    'lovr.data.newTextureData',
    'Canvas:newTextureData'
  }
}

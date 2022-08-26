return {
  summary = 'Get the layer count of the Texture.',
  description = [[
    Returns the layer count of the Texture.  2D textures always have 1 layer and cubemaps always
    have 6 layers.  For 3D and array textures, this is the number of images stored in the texture.
    3D textures represent a spatial 3D volume, whereas array textures are multiple layers of
    distinct 2D images.
  ]],
  arguments = {},
  returns = {
    {
      name = 'layers',
      type = 'number',
      description = 'The layer count of the Texture.'
    }
  },
  related = {
    'Texture:getWidth',
    'Texture:getHeight',
    'Texture:getDimensions'
  }
}

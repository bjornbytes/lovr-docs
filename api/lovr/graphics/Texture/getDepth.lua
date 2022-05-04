return {
  summary = 'Get the depth of the Texture.',
  description = [[
    Returns the depth of the Texture.  2D textures always have a depth of 1 and cubemap textures
    always have a depth of 6.  For 3D and array textures, this is the number of images stored in the
    texture.  3D textures represent a spatial 3D volume, whereas array textures are multiple layers
    of distinct 2D images.
  ]],
  arguments = {},
  returns = {
    {
      name = 'depth',
      type = 'number',
      description = 'The depth of the Texture.'
    }
  },
  related = {
    'Texture:getWidth',
    'Texture:getHeight',
    'Texture:getDimensions'
  }
}

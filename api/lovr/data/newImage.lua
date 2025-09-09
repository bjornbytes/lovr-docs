return {
  summary = 'Create a new Image.',
  description = [[
    Creates a new Image.  Image data can be loaded and decoded from an image file.  Alternatively, a
    blank image can be created with a given width, height, and format.
  ]],
  arguments = {
    width = {
      type = 'number',
      description = 'The width of the texture.'
    },
    height = {
      type = 'number',
      description = 'The height of the texture.'
    },
    format = {
      type = 'TextureFormat',
      default = 'rgba8',
      description = 'The format of the texture\'s pixels.'
    },
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing an image file to load.'
    },
    data = {
      type = 'Blob',
      default = 'nil',
      description = 'Raw pixel values to use as the contents.  If `nil`, the data will all be zero.'
    },
    source = {
      type = 'Image',
      description = 'The Image to clone.'
    }
  },
  returns = {
    image = {
      type = 'Image',
      description = 'The new Image.'
    }
  },
  variants = {
    {
      description = 'Load image data from a file.',
      arguments = { 'file' },
      returns = { 'image' }
    },
    {
      description = 'Create an Image with a given size and pixel format.',
      arguments = { 'width', 'height', 'format', 'data' },
      returns = { 'image' }
    },
    {
      description = 'Clone an existing Image.',
      arguments = { 'source' },
      returns = { 'image' }
    }
  },
  notes = [[
    The supported image file formats are png, jpg, hdr, dds, ktx1, ktx2, and astc.

    DDS and KTX files can contain cubemaps and array textures, in any of the texture formats LÖVR
    supports.
  ]]
}

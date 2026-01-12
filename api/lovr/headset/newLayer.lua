return {
  tag = 'layers',
  summary = 'Create a new Layer.',
  description = 'Creates a new `Layer`.',
  arguments = {
    width = {
      type = 'number',
      description = 'The width of the Layer texture, in pixels.'
    },
    height = {
      type = 'number',
      description = 'The height of the Layer texture, in pixels.'
    },
    texture = {
      type = 'Texture',
      description = 'A Texture to copy to the Layer.'
    },
    image = {
      type = 'Image',
      description = 'An Image to upload to the Layer.'
    },
    images = {
      type = 'table',
      description = 'A table of Images to upload to the Layer.'
    },
    options = {
      type = 'table',
      default = 'nil',
      description = 'Optional options for the Layer.',
      table = {
        {
          name = 'stereo',
          type = 'boolean',
          default = 'nil',
          description = [[
            Whether the Layer should be stereo.  Stereo Layers use an array texture with 2 layers
            instead of a regular 2D texture, with the first array layer shown in the left eye and
            the second array layer shown in the right eye.  The default is false, unless 2 images or
            an array texture are used to create the layer; then the default will be true.
          ]]
        },
        {
          name = 'static',
          type = 'boolean',
          default = 'nil',
          description = [[
            Whether the Layer is static.  Static layers use less memory, but their contents can only
            be changed on the frame when they're created.  On subsequent frames, calling
            `Layer:getTexture` will throw an error.  The default is false, unless images/textures
            are used to create the layer; then the default will be true.  This should be used for
            layers that only need to display a static image.
          ]]
        },
        {
          name = 'transparent',
          type = 'boolean',
          default = 'false',
          description = [[
            Whether the Layer is transparent.  Transparent Layers will use their alpha channel to
            blend properly with other content behind them, at a minor performance cost.
          ]]
        },
        {
          name = 'filter',
          type = 'boolean',
          default = 'true',
          description = [[
            Whether the VR runtime is allowed to apply filtering effects to the Layer, such as
            sharpening and supersampling.  This can improve text legibility and reduces "shimmering"
            artifacts, but may reduce performance.  Currently only Quest will apply this automatic
            filtering.
          ]]
        }
      }
    }
  },
  returns = {
    layer = {
      type = 'Layer',
      description = 'The new Layer.'
    },
  },
  variants = {
    {
      arguments = { 'width', 'height', 'options' },
      returns = { 'layer' }
    },
    {
      arguments = { 'texture', 'options' },
      returns = { 'layer' }
    },
    {
      arguments = { 'image', 'options' },
      returns = { 'layer' }
    },
    {
      arguments = { 'images', 'options' },
      returns = { 'layer' }
    }
  },
  notes = [[
    Currently, images and textures used to create Layers must have the `rgba8` format.

    Layer textures are `rgba8` and are sRGB.
  ]],
  related = {
    'lovr.headset.getLayers',
    'lovr.headset.setLayers'
  }
}

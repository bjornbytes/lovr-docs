return {
  tag = 'layers',
  summary = 'Set the background layer.',
  description = [[
    Sets a background layer.  This will render behind any transparent pixels in the main 3D content.
    It works similarly to other `Layer` objects, but using a cubemap or equirectangular texture.

    The background texture is sent to the VR runtime once, and the runtime is responsible for
    compositing it behind the rest of the scene.  This can improve performance greatly, since the
    background doesn't need to be re-rendered every frame.  It also ensures the background remains
    tracked smoothly even if LÖVR is struggling to render at a high frame rate.
  ]],
  arguments = {
    texture = {
      type = 'Texture',
      description = [[
        The Texture to use for the background.  It can be a `cube` texture which will be rendered as
        a cubemap, or a `2d` texture interpreted as equirectangular (sometimes called panoramic or
        spherical) coordinates.

        The texture can have any color format, but it will be converted to `rgba8` before getting
        copied to the VR runtime.
      ]]
    },
    image = {
      type = 'Image',
      description = [[
        The Image to use for the background.  It can have 1 layer for an equirectangular background,
        or 6 layers for a cubemap.  Currently, it must have a format of `rgba8`.
      ]]
    },
    images = {
      type = 'table',
      description = [[
        A table of 1 or 6 images to use for the background.  They must be the same size and they
        currently must use the `rgba8` format.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture' },
      returns = {}
    },
    {
      arguments = { 'image' },
      returns = {}
    },
    {
      arguments = { 'images' },
      returns = {}
    },
    {
      description = 'Disables any previously set background.',
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    There is no `lovr.headset.getBackground` because LÖVR does not store the Image or Texture after
    setting it as a background, to save memory.
  ]],
  related = {
    'Layer',
    'Pass:skybox'
  }
}

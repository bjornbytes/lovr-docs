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
    background = {
      type = 'Image | {Image} | Texture',
      description = [[
        The image(s) or texture to use for the background.  Backgrounds can either be cubemaps (6
        images) or equirectangular (a single panoramic 2D image).

        Textures can have any color format, but it will be converted to `rgba8` before getting
        copied to the VR runtime.  Images currently have to be `rgba8`.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'background' },
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

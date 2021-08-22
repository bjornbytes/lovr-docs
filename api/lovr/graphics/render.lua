return {
  summary = 'Render to a set of textures.',
  description = [[
    Renders to a set of textures.  Up to 4 color textures may be provided, as well as an optional
    depth buffer.

    The content to render can be provided by a callback function or a set of prerecorded `Batch`
    objects.  When using a callback, its first argument will be a temporary Batch to fill out, which
    will get immediately rendered.
  ]],
  arguments = {
    texture = {
      type = 'Texture',
      description = 'A texture to render to.'
    },
    canvas = {
      type = 'table',
      description = 'A set of textures and other rendering settings.',
      table = {}
    },
    ['...batches'] = {
      type = 'Batch',
      description = 'One or more batches to render.'
    },
    callback = {
      type = 'function',
      description = [[
        A callback function used to record rendering work.  It will be passed a temporary Batch as
        its single argument.  The Batch becomes invalid at the end of the callback.
      ]]
    },
    order = {
      type = 'number',
      default = '50',
      description = [[
        A number from 1 to 100 used to sequence this rendering work with other work in the frame.
        Smaller order values will run before larger values, and any render/compute work with the
        same value will run in the order it was submitted.  This is intended to be used to order
        work across multiple threads.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture', 'callback', 'order' },
      returns = {}
    },
    {
      arguments = { 'canvas', 'callback', 'order' },
      returns = {}
    },
    {
      arguments = { 'texture', '...batches', 'order' },
      returns = {}
    },
    {
      arguments = { 'canvas', '...batches', 'order' },
      returns = {}
    }
  },
  notes = [[
    This function must be called between `lovr.graphics.begin` and `lovr.graphics.submit`.

    The special value `'window'` can be used instead of a Texture to render to the window.

    The default clear for color textures will be the background color, which can be set using
    `lovr.graphics.setBackgroundColor`.

    Setting clear to `true` for either color or depth textures will leave garbage data in the
    textures, which is the fastest way to initialize them.  Setting clear to `false` will load the
    old data from the texture, which is very slow on mobile GPUs.

    The stencil buffer is currently always cleared to zero.

    A depth format can be provided instead of a Texture.  In this case, an internal temporary depth
    buffer will be used.

    It's valid to have zero color textures, but in that case a depth texture must be provided.

    All textures must be created with the 'render' usage flag.  The textures must have the same
    dimensions and sample counts, and array textures must have the same number of layers.  Textures
    can have any renderable format and any number of mipmap levels.  It is valid to render to a view
    of a texture.

    If the textures have a single sample and the `samples` option is set to a number bigger than 1,
    internal multisampled buffers will be used and the antialiased result will be copied to the
    color textures once rendering is complete.

    The topmost mipmap level of each texture will be rendered to.  If the `mipmaps` flag is `true`,
    mipmaps will be regenerated for each texture once rendering is complete.

    If the textures are array textures with multiple layers, draws get broadcasted to every layer.
    Each layer can use its own camera.  The first layer uses the first camera view of the Batch, the
    second layer uses the second view, and so on.  The maximum number of views is given by the
    `renderViews` limit, and is currently always 6.
  ]],
  related = {
    'lovr.graphics.compute'
  }
}

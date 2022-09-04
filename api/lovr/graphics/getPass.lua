return {
  tag = 'graphics-objects',
  summary = 'Get a temporary Pass.',
  description = [[
    Creates and returns a Pass object, which is used to record commands for the GPU.  Commands can
    be recorded by calling functions on the Pass.  After recording a set of passes, they can be
    submitted for the GPU to process using `lovr.graphics.submit`.

    Pass objects are **temporary** and only exist for a single frame.  Once `lovr.graphics.submit`
    is called, any passes that were created during that frame become **invalid**.  Each frame, a new
    set of passes must be created and recorded. LÖVR tries to detect if you use a pass after it's
    invalid, but this error checking is not 100% accurate at the moment.

    There are 3 types of passes.  Each type can record a specific type of command:

    - `render` passes render graphics to textures.  The `lovr.draw` callback receives a render pass
      as an argument.
    - `compute` passes run compute shaders.
    - `transfer` passes can transfer data to/from GPU objects, like `Buffer` and `Texture`.
  ]],
  arguments = {
    type = {
      type = 'PassType',
      description = 'The type of pass to create.'
    },
    texture = {
      type = 'Texture',
      description = 'The texture the render pass will render to.  Ignored for non-render passes.'
    },
    canvas = {
      type = 'table',
      description = [[
        Render pass configuration.  Up to 4 textures can be provided in table keys 1 through 4.
        Ignored for non-render passes.
      ]],
      table = {
        {
          name = 'depth',
          type = 'table',
          description = [[
            Depth/stencil buffer configuration.  In addition to a table, it can be a `Texture`, a
            `TextureFormat`, or `false` to disable the depth buffer.
          ]],
          table = {
            {
              name = 'format',
              type = 'TextureFormat',
              default = [['d32f']],
              description = [[
                The format of the depth buffer texture, which must be a depth format (the ones that
                start with `d`).  LÖVR will create or reuse an internal depth buffer with this
                format.
              ]]
            },
            {
              name = 'texture',
              type = 'Texture',
              description = 'A Texture to use as the depth buffer.  Takes precedence over `format`.'
            },
            {
              name = 'clear',
              type = 'number',
              default = '0',
              description = [[
                How to clear the depth buffer at the beginning of the pass.  Can be a floating point
                number to clear each pixel to, `true` to do a "fast clear" that clears to random
                data, or `false` to not clear at all and instead load the depth texture's pixels.
              ]]
            }
          }
        },
        {
          name = 'clear',
          type = '*',
          description = 'How to clear the color textures at the beginning of the pass.'
        },
        {
          name = 'samples',
          type = 'number',
          default = '4',
          description = [[
            The number of multisamples to use.  Can be 4 for antialiasing, or 1 to disable
            antialiasing.
          ]]
        },
        {
          name = 'mipmap',
          type = 'boolean',
          default = [[false]],
          description = [[
            Whether mipmaps for the color and depth textures should be regenerated after the pass is
            finished.
          ]]
        }
      }
    }
  },
  returns = {
    pass = {
      type = 'Pass',
      description = 'The new Pass.'
    }
  },
  variants = {
    {
      arguments = { 'type' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'texture' },
      returns = { 'pass' }
    },
    {
      arguments = { 'type', 'canvas' },
      returns = { 'pass' }
    }
  },
  notes = [[
    Fun facts about render passes:

    - Textures must have the same dimensions, layer counts, and sample counts.
    - Textures must have been created with the `render` `TextureUsage`.
    - If `mipmap` is true, then any textures with mipmaps must have the `transfer` `TextureUsage`.
    - It's okay to have zero color textures, but in this case there must be a depth texture.
    - Setting `clear` to `false` for textures is usually very slow on mobile GPUs.

    For `compute` and `transfer` passes, all of the commands in the pass act as though they run in
    parallel.  This means that writing to the same element of a buffer twice, or writing to it and
    reading from it again is not guaranteed to work properly on all GPUs.  LÖVR is not currently
    able to check for this.  If compute or transfers need to be sequenced, multiple passes should be
    used.  It is, however, completely fine to read and write to non-overlapping regions of the same
    buffer or texture.
  ]],
  related = {
    'lovr.graphics.submit',
    'lovr.graphics.getWindowPass',
    'lovr.headset.getPass'
  }
}

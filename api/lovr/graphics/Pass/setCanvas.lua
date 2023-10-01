return {
  tag = 'canvas',
  summary = 'Set the Pass\'s canvas.',
  description = [[
    Sets the Pass's canvas.  The canvas is a set of textures that the Pass will draw to when it's
    submitted, along with configuration for the depth buffer and antialiasing.
  ]],
  arguments = {
    canvas = {
      type = 'table',
      description = [[
        The canvas.  Numeric keys will contain the color Textures, along with the following keys:
      ]],
      table = {
        {
          name = 'depth',
          type = '*',
          description = 'A `Texture` or `TextureFormat` with the depth buffer.'
        },
        {
          name = 'samples',
          type = 'number',
          description = 'The number of multisamples used for antialiasing (either 1 or 4).'
        }
      }
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'canvas' },
      returns = {}
    },
    {
      description = [[
        Disable the canvas.  Any draws in the Pass will be skipped when it is submitted (compute
        shaders will still run though).
      ]],
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    Changing the canvas will reset the pass, as though `Pass:reset` was called.

    All textures must have the same dimensions, layer counts, and multisample counts.  They also
    must have been created with the `render` usage flag.

    The number of layers in the textures determines how many views (cameras) the pass has.  Each
    draw will be rendered to all texture layers, as seen from the corresponding camera.  For
    example, VR rendering will use a canvas texture with 2 layers, one for each eye.

    To render to a specific mipmap level or layer of a texture, use texture views
    (`Texture:newView`).

    Mipmaps will be regenerated for all of canvas textures at the end of a render pass.

    If the Pass has multiple color textures, a fragment shader should be used to write a different
    color to each texture.  Here's an example that writes red to the first texture and blue to the
    second texture:

        // Declare an output variable for the second texture
        layout(location = 1) out vec4 secondColor;

        vec4 lovrmain() {
          secondColor = vec4(0, 0, 1, 1);
          return vec4(1, 0, 0, 1);
        }
  ]],
  related = {
    'Pass:getClear',
    'Pass:setClear',
    'Pass:getWidth',
    'Pass:getHeight',
    'Pass:getDimensions'
  }
}

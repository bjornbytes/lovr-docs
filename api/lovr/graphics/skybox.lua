return {
  tag = 'graphicsPrimitives',
  summary = 'Render a skybox.',
  description = [[
    Render a skybox from a texture.  Two common kinds of skybox textures are supported: A rectangular
    texture with an equirectangular projection can be used, or a "cubemap" texture created from 6
    images.
  ]],
  arguments = {
    texture = {
      type = 'Texture',
      description = 'The texture to use.'
    },
    canvas = {
      type = 'Canvas',
      description = 'The canvas to use.'
    },
    angle = {
      type = 'number',
      default = '0',
      description = 'How much to rotate the skybox around its axis of rotation.'
    },
    ax = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the axis of rotation.'
    },
    ay = {
      type = 'number',
      default = '1',
      description = 'The y coordinate of the axis of rotation.'
    },
    az = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the axis of rotation.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'texture', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      arguments = { 'canvas', 'angle', 'ax', 'ay', 'az' },
      returns = {}
    }
  },
  example = [[
    function lovr.load()
      skybox = lovr.graphics.newTexture({
        'right.png',
        'left.png',
        'up.png',
        'down.png',
        'back.png',
        'front.png'
      }, { type = 'cube' })

      -- or skybox = lovr.graphics.newTexture('equirectangular.png')
    end

    function lovr.draw()
      local angle, ax, ay, az = lovr.headset.getOrientation()
      lovr.graphics.skybox(skybox, -angle, ax, ay, az)
    end
  ]]
}

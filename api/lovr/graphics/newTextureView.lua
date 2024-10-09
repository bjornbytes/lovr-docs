return {
  deprecated = true,
  tag = 'texture-view',
  summary = 'Create a texture view referencing a parent Texture.',
  description = [[
    Creates a new Texture view.  A texture view does not store any pixels on its own, but instead
    uses the pixel data of a "parent" Texture object.  The width, height, format, sample count, and
    usage flags all match the parent.  The view may have a different `TextureType`, and it may
    reference a subset of the parent texture's layers and mipmap levels.

    Texture views are used for:

    - Reinterpretation of texture contents.  For example, a cubemap can be treated as an array
      texture.
    - Rendering to a particular array layer or mipmap level of a texture.
    - Binding a particular range of layers or mipmap levels to a shader.
  ]],
  arguments = {
    parent = {
      type = 'Texture',
      description = 'The parent Texture to create a view of.'
    },
    options = {
      type = 'table',
      description = 'Options for the texture view.',
      table = {
        type = {
          type = 'TextureType',
          description = 'The texture type of the view.  Defaults to the type of the parent.'
        },
        layer = {
          type = 'number',
          default = '1',
          description = 'The index of the first layer referenced by the view.'
        },
        layercount = {
          type = 'number',
          default = 'nil',
          description = [[
            The number of layers in the view.  Defaults to 1 if a layer index is provided, otherwise
            the view will reference all layers.
          ]]
        },
        mipmap = {
          type = 'number',
          default = '1',
          description = 'The index of the first mipmap referenced by the view.'
        },
        mipmapcount = {
          type = 'number',
          default = 'nil',
          description = [[
            The number of mipmap levels in the view.  Defaults to 1 if a mipmap index is provided,
            otherwise the view will reference all mipmaps.
          ]]
        },
        label = {
          type = 'string',
          description = 'An optional label for the view that will show up in debugging tools.'
        }
      }
    }
  },
  returns = {
    view = {
      type = 'Texture',
      description = 'The new texture view.'
    }
  },
  variants = {
    {
      arguments = { 'parent', 'options' },
      returns = { 'view' }
    }
  },
  related = {
    'lovr.graphics.newTexture'
  }
}

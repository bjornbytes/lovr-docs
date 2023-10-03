return {
  summary = 'A multidimensional block of memory on the GPU.',
  description = [[
    Textures are multidimensional blocks of memory on the GPU, contrasted with `Buffer` objects
    which are one-dimensional.  Textures are used as the destination for rendering operations, and
    textures loaded from images provide surface data to `Material` objects.
  ]],
  constructors = {
    'lovr.graphics.newTexture',
    'Texture:newView'
  },
  sections = {
    {
      name = 'Metadata',
      tag = 'texture-metadata'
    },
    {
      name = 'Transfers',
      tag = 'texture-transfer'
    },
    {
      name = 'Texture Views',
      tag = 'texture-view',
      description = [[
        Textures can be created as "views" of another parent texture.  Views don't store any pixels
        themselves, but instead refer to a subset of the parent's layers or mipmap levels.  They can
        also use a different texture type from the parent.
      ]]
    }
  }
}

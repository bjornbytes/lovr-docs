return {
  summary = 'An image that can be applied to Meshes and Models.',
  description = [[
    A Texture is an image that can be applied to `Model`s and `Mesh`s.  Supported file formats
    include `.png`, `.jpg`, `.tga`, and `.bmp`.  Additionally, three compressed formats are
    supported: DXT1, DXT3, and DXT5 (all have the `.dds` extension).  Compressed textures are
    generally recommended as they use less video memory and usually improve performance.
  ]],
  constructor = 'lovr.graphics.newTexture'
}

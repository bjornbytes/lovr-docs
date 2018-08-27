return {
  summary = 'An image that can be applied to Materials.',
  description = [[
    A Texture is an image that can be applied to `Material`s.  The supported file formats are
    `.png`, `.jpg`, and `.hdr`.  Additionally, three compressed formats are supported: DXT1, DXT3,
    and DXT5 (all have the `.dds` extension).  Compressed textures are generally recommended as they
    use less video memory and usually improve performance.
  ]],
  constructor = 'lovr.graphics.newTexture'
}

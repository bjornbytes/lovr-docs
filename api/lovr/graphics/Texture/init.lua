return {
  summary = 'A multidimensional block of memory on the GPU.',
  description = [[
    Textures are multidimensional blocks of memory on the GPU, contrasted with `Buffer`s which are
    similar but one-dimensional.  Textures can be used to provide material data to Shaders, and they
    are also used as the destination for rendering operations.

    Textures can be created from image filenames, `Image` objects, or they can be left blank and
    created with a width, height, and depth.

    Each Texture has a type (`TextureType`).  2D Textures are the most common and are often used to
    store color image data, but there are also cubemaps for skyboxes, 3D textures for volumetric
    info, and array textures which store a sequence of 2D images.

    The format of a Texture (`TextureFormat`) defines the size and number of channels of each pixel.

    Textures can have mipmaps, which are a precomputed set of progressively smaller versions of the
    Texture.  Mipmaps help make the Texture look smoother at smaller sizes, and also improve the
    performance of reading data from the Texture in a Shader.

    When used as a render target, the Texture can store multiple different color samples for each
    pixel, which can be averaged together after rendering to do antialiasing (this is called
    multisample antialiasing, or MSAA).

    It is possible to create multiple views of a single Texture.  A texture view references a subset
    of the array layers and mipmap levels of its parent texture, and can be bound to a Shader or
    used as a render target just like a normal texture.
  ]],
  constructors = {
    'lovr.graphics.newTexture',
    'Texture:newView'
  }
}

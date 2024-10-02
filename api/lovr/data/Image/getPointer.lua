return {
  summary = 'Get a raw pointer to the Image pixel data.',
  description = [[
    Returns a raw pointer to the Image's pixel data.  This can be used to interface with other C
    libraries or the LuaJIT FFI.
  ]],
  arguments = {
    level = {
      type = 'number',
      default = '1',
      description = 'The mipmap level to get the pointer of (for DDS and KTX images).'
    },
    layer = {
      type = 'number',
      default = '1',
      description = 'The array layer to get the pointer of (for DDS and KTX images).'
    }
  },
  returns = {
    pointer = {
      type = 'userdata',
      description = 'A pointer to the raw pixel data.'
    }
  },
  variants = {
    {
      arguments = { 'level', 'layer' },
      returns = { 'pointer' }
    }
  },
  example = {
    description = 'Simple example of writing to Image pixels with LuaJIT\'s FFI module.', 
    code = [=[
      local ffi = require 'ffi'

      function lovr.load()
        image = lovr.data.newImage(2, 2)

        ffi.cdef [[
          typedef struct { uint8_t r, g, b, a; } Pixel;
        ]]

        pointer = image:getPointer()
        pixels = ffi.cast('Pixel*', pointer)
        pixels[0] = { 255, 0, 0, 255 }
        pixels[1] = { 0, 255, 0, 255 }
        pixels[2] = { 0, 0, 255, 255 }
        pixels[3] = { 255, 255, 255, 255 }

        texture = lovr.graphics.newTexture(image)
      end

      function lovr.draw(pass)
        pass:setSampler('nearest')
        pass:fill(texture)
      end
    ]=]
  }
}

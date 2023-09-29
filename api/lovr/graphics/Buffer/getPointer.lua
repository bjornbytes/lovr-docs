return {
  summary = 'Get a raw pointer to the Buffer memory.',
  description = [[
    Returns a raw pointer to the Buffer's memory as a lightuserdata, intended for use with the
    LuaJIT FFI or for passing to C libraries.

  ]],
  arguments = {},
  returns = {
    pointer = {
      type = 'lightuserdata',
      description = 'A pointer to the Buffer\'s memory.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'pointer' }
    }
  },
  notes = [[
    The pointer remains valid until the next call to `lovr.graphics.submit`, during which the data
    in the pointer will be uploaded to the buffer.

    The initial contents of the pointer are undefined.

    Currently the pointer addresses a range equal to the size of the Buffer, and so this overwrites
    the entire contents of the Buffer.

    Special care should be taken when writing data:

    - Reading data from the pointer will be very slow on some systems, and should be avoided.
    - It is better to write data to the pointer sequentially.  Random access may be slower.
  ]],
  related = {
    'Blob:getPointer'
  }
}

return {
  summary = 'Pack numbers into a vector.',
  description = [[
    Packs numbers into a vector.
  ]],
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x component of the vector.'
    },
    y = {
      type = 'number',
      default = 'x',
      description = 'The y component of the vector.'
    },
    z = {
      type = 'number',
      default = 'x',
      description = 'The z component of the vector.'
    }
  },
  returns = {
    v = {
      type = 'vector',
      description = 'The new vector.'
    }
  },
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = { 'v' }
    }
  },
  notes = [[
    As a shortcut, the `vector` library can be called like a function, which calls this function:

        vector(x, y, z) -- same as vector.pack(x, y, z)
  ]],
  example = [[
    local a = vector.pack(1, 2, 3)
    local b = vector.pack(5)
    print(a + b) --> 6, 7, 8

    -- put the 3 numbers from lovr.headset.getPosition into a vector!
    local position = vector(lovr.headset.getPosition())
  ]]
}

return {
  tag = 'vector-lib',
  external = true,
  summary = 'What is your vector victor.',
  description = [[
    The vector module implements a 3D vector type.  Vectors are useful for holding multiple numbers
    using just a single value, and for doing 3D math.

    This module does not need to be required, it is in the global scope as `vector`.
  ]],
  notes = [[
    ### Methods

    Vector objects have `vector` as their metatable, so methods can be called with dots or colons:

        vector.distance(a, b) == a:distance(b)

    Custom methods can be added to the `vector` table, if desired.

    ### Metamethods

    Vectors have metamethods for math operators, like `+`, `-`, `*`, and `/`:

        print(vector(1, 2, 3) * .5 + vector(10, 20, 30))

    ### Components

    Use x, y, and z keys to access the components of the vector:

        print(vector(1, 2, 3).z) --> 3

    Vectors are considered immutable, so the individual components can't be changed.  To change a
    single component of a vector, create a new vector with the changes:

        local a = vector(1)
        local b = vector(a.x, 2, a.z) --> (1, 2, 1)

    ### Constants

    The following vector constants are available:

        vector.zero = vector(0, 0, 0)
        vector.one = vector(1, 1, 1)
        vector.left = vector(-1, 0, 0)
        vector.right = vector(1, 0, 0)
        vector.up = vector(0, 1, 0)
        vector.down = vector(0, -1, 0)
        vector.forward = vector(0, 0, -1)
        vector.backward = vector(0, 0, 1)
        vector.back = vector(0, 0, 1)

    ### Lua vs. Luau

    When using Luau, LÖVR uses Luau's builtin `vector` datatype.  This is a compact, garbage-free
    type that Luau is able to optimize well.

    On LuaJIT, `vector` is implemented using regular tables with `x`, `y`, and `z` keys.

    ### Passing Vectors to Functions

    Most LÖVR functions that take positions, velocities, sizes, etc. accept both vectors and
    numbers:

        function lovr.draw(pass)
          pass:box(x, y, z, width, height, depth)

          -- or, with vectors:
          local position = vector(x, y, z)
          local size = vector(width, height, depth)
          pass:box(position, size)
        end

    Since vectors are just tables (on Lua and LuaJIT), tables can be used for vector arguments as
    well, as long as they have x/y/z or 1/2/3 keys.  The following are all equivalent:

        pass:sphere(1, 2, 3)
        pass:sphere(vector(1, 2, 3))
        pass:sphere({ 1, 2, 3 })
        pass:sphere({ x = 1, y = 2, z = 3 })

    This means LÖVR vectors can be swapped out for any table-based vector library.
  ]],
  related = {
    'quaternion',
    'Mat4'
  }
}

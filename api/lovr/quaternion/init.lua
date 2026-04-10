return {
  tag = 'vector-lib',
  external = true,
  summary = 'Quaternions, how do they work.',
  description = [[
    The quaternion module contains...quaternions, which are a useful way of storing 3D rotations.

    This module does not need to be required, it is in the global scope as `quaternion`.
  ]],
  notes = [[
    ### Methods

    Quaternion objects have `quaternion` as their metatable, so methods can be called with dots or
    colons:

        quaternion.direction(q) == q:direction()

    Custom methods can be added to the `quaternion` table, if desired.

    ### Metamethods

    Quaternions support the following metamethod operators:

        q = quaternion * quaternion --> composes two quaternions together, returns quaternion
        v = quaternion * vector --> rotates the vector by the quaternion, returning new vector

    ### Components

    Use x, y, z, and w keys to access the components of the quaternion:

        print(quaternion.pack(1, 2, 3, 4).w) --> 4

    Quaternions are considered immutable, so the individual components can't be changed.  Instead,
    create a new quaternion with the changes.

    ### Constants

    The `quaternion.identity` constant is an alias for `quaternion.pack(0, 0, 0, 1)`.

    ### Lua vs. Luau

    When using Luau, LÖVR has extended the language with a builtin `quaternion` datatype, similar to
    the builtin `vector` type.  This is a compact, garbage-free type that Luau is able to optimize
    well.

    :::note
    Currently, the Luau `quaternion` type stores components with 16-bit precision.
    :::

    On LuaJIT, `quaternion` is implemented using regular tables with `x`, `y`, `z`, and `w` keys.

    ### Passing Quaternions to Functions

    Most LÖVR functions that take rotations accept both angle/axis numbers and quaternions:

        pass:rotate(angle, ax, ay, az)
        -- same as:
        pass:rotate(quaternion(angle, ax, ay, az))

    Since quaternions are just tables (on Lua and LuaJIT), tables can be used for quaternion
    arguments as well, as long as they have x/y/z/w or 1/2/3/4 keys.  The following are all
    equivalent:

        pass:sphere(quaternion.pack(x, y, z, w))
        pass:sphere({ x, y, z, w })
        pass:sphere({ x = x, y = y, z = z, w = w })

    This means LÖVR quaternions can be swapped out for any table-based quaternion library.
  ]],
  related = {
    'vector',
    'Mat4'
  }
}

return {
  summary = 'A 3D vector.',
  description = [[
    A `vec3` is a math type that holds three numbers.  It's very helpful for representing and
    manipulating 3D positions and directions.  LÖVR functions that accept 3D positions, directions,
    or velocities generally also accept `vec3`s.

    `vec3`s are created by allocating them from Pools, by either using `lovr.math.vec3` to allocate
    from the default pool or creating a new `Pool` and calling `Pool:vec3` on it.  *Note* that
    vectors created with `lovr.math.vec3` are *temporary*, and will be cleared at the end of a
    frame!  You can use `vec3:save` to save a permanent copy of the vector that is managed by the
    Lua garbage collector.

    `vec3`s have metamethods, allowing you to add, subtract, multiply, and divide them using the
    usual binary operators that you would use on numbers.  Note that these create new *temporary*
    vectors to store their results in.  If you want to modify a vector instead of creating new ones,
    you can use the named operator functions like `vec3:add`.

    Note that accessing properties directly (like `v.x`) is not an officially supported feature
    right now (for performance reasons), though it does happen to work by accident in LuaJIT.  This
    limitation may be improved in the future.  For now, it is recommended to use `vec3:unpack` and
    `vec3:set` if you need to work with individual components of a vector.
  ]],
  constructors = {
    'lovr.math.vec3',
    'Pool:vec3'
  },
  related = {
    'quat',
    'mat4'
  }
}

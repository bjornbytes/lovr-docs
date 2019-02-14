return {
  summary = 'A 3D vector.',
  description = [[
    A `vec3` is a math type that holds three numbers.  It's very helpful for representing and
    manipulating 3D positions and directions.  LÖVR functions that accept 3D positions, directions,
    or velocities generally also accept `vec3`s.  `vec3`s are created using `lovr.math.vec3` or from
    a `Pool`.

    `vec3`s have metamethods, allowing you to add, subtract, multiply, and divide them using the
    usual binary operators that you would use on numbers.  Note that these create new vectors to
    store their results in.  If you want to modify a vector instead of creating new ones, you can
    use the named operator functions like `vec3:add`.

    Creating huge numbers of vectors every frame can lead to performance problems due to the sheer
    amount of memory allocation and garbage collection overhead.  If you need lots of vector objects
    you can use `Pool`s to make things much more efficient.

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

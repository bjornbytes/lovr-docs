return {
  summary = 'A quaternion.',
  description = [[
    A `quat` is a math type that represents a 3D rotation, stored as four numbers.  LÖVR functions
    that take rotations also accept quaternions.

    `quat`s are created by allocating them from Pools, by either using `lovr.math.quat` to allocate
    from the default pool or creating a new `Pool` and calling `Pool:quat` on it.  *Note* that
    quaternions created with `lovr.math.quat` are *temporary*, and will be cleared at the end of a
    frame!  You can use `quat:save` to save a permanent copy of the quaternion that is managed by
    the Lua garbage collector.

    The four numbers stored in a `quat`, normally called `x, y, z, w`, are not very intuitive to
    work with.  Instead, rotations in most LÖVR APIs use the angle/axis representation, which is
    defined by a rotation angle in radians and an axis to rotate around.  Accordingly, the quat
    functions for getting and setting elements, `quat:unpack` and `quat:set`, don't take the normal
    `x, y, z, w` elements but instead take four angle/axis values.  If you need to access the raw
    components, you can pass in `true` as the last argument to signify that you want to work with
    raw components.

    Two quaternions can be multiplied together to combine their rotations into a single new
    quaternion.  The `quat:mul` function can be used to multiply two quaternions "in place",
    modifying the first quaternion.  Alternatively, the `*` operator can be used to multiply them,
    which will create a new *temporary* quaternion to store the result in.

    A quaternion can also be multiplied by a vector.  This rotates the vector.  Both `quat:mul` and
    the `*` operator can be used for this.

    A common source of bugs is to forget to normalize a quaternion.  If you run into weird bugs with
    rotations, calling `quat:normalize` on your rotations may fix the issue!
  ]],
  constructors = {
    'lovr.math.quat',
    'Pool:quat'
  },
  related = {
    'vec3',
    'mat4'
  }
}

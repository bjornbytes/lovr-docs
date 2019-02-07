return {
  summary = 'A 4x4 matrix.',
  description = [[
    A `mat4` is a math type that holds 16 values in a 4x4 grid.  They are very useful for
    representing and manipulating transforms in 3D space.  LÖVR functions that accept 3D transforms
    can take a single `mat4` instead of 10 numbers or an assortment of `vec3`s and `quat`s, which
    is more concise and improves performance slightly.

    `mat4`s are created by allocating them from Pools, by either using `lovr.math.mat4` to allocate
    from the default pool or creating a new `Pool` and calling `Pool:mat4` on it.  **Note** that
    matrices created with `lovr.math.mat4` are **temporary**, and will be cleared at the end of a
    frame!  You can use `mat4:save` to save a permanent copy of the matrix that is managed by the
    Lua garbage collector.

    Explaining the math behind `mat4`s and transforms is outside the scope of these docs, but there
    are some fairly straightforward functions that can be used to move, rotate, and scale the
    transform represented by the matrix:

    - `mat4:translate`
    - `mat4:rotate`
    - `mat4:scale`

    The "default" matrix is called the identity matrix and `mat4:identity` can be used to reset any
    matrix to the default state.

    Matrices can be multiplied together using the normal `*` operator, which combines both of their
    transformations into a single matrix.  This is really useful for condensing a set of simple
    transforms into a more complex one, or creating parent-child relationships between objects.
    Note that the multiplication returns a new temporary matrix that will be cleared at the end of
    the frame, so be sure to use `mat4:save` if you need to hold onto it.
  ]],
  constructors = {
    'lovr.math.mat4',
    'Pool:mat4'
  },
  related = {
    'vec3',
    'quat'
  }
}

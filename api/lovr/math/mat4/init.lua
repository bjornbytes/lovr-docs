return {
  summary = 'A 4x4 matrix.',
  description = [[
    A `mat4` is a math type that holds 16 values in a 4x4 grid.  They are very useful for
    representing and manipulating transforms in 3D space.  LÖVR functions that accept 3D transforms
    can take a single `mat4` instead of 10 numbers or an assortment of `vec3`s and `quat`s, which
    is more concise and improves performance slightly.  `mat4`s are created using `lovr.math.mat4`
    or by using a `Pool`.

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

    Creating huge numbers of matrices every frame can lead to performance problems due to the sheer
    amount of memory allocation and garbage collection overhead.  If you need lots of matrix objects
    you can use `Pool`s to make things much more efficient.
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

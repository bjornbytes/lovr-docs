return {
  summary = 'A Pool of vector objects.',
  description = [[
    A Pool is an object that is used to allocate vectors, matrices, and quaternions.  Pools exist
    mainly for efficiency -- allocating tiny bits of memory for every single vector can lead to
    performance problems related to the Lua garbage collector and other memory managers on the
    system.  By using a Pool, a single block of memory is used and the Pool keeps track of all of
    the vectors in the block.

    A Pool can be allocated with a fixed size or it can be resizable.  If a fixed size Pool runs out
    of space, it will overflow and cause an error.  Resizable Pools, on the other hand, will grow
    as needed.  This can be more convenient to work with but might end up using more memory than
    expected or lead to delays while the memory is being resized.  It's recommended to use fixed
    size Pools when you know how many vector objects you'll need.

    Pools can be drained using `Pool:drain`.  Draining the Pool resets its usage to zero, and clears
    all vectors allocated from the Pool.  This is helpful for keeping memory usage low when using a
    lot of temporary vectors, which is common, but can cause unexpected surprises if you have saved
    a vector into a variable.  If you need a vector to persist across drains, you can call
    `vec3:save` on it, which creates a copy of the vector that exists outside of any Pool and is
    instead managed by Lua's garbage collector.

    *Important note:* `lovr.math` has its own internal Pool that it uses whenever you call functions
    like `lovr.math.vec3` or `lovr.math.mat4`.  These vectors are temporary vectors that will be
    drained at the end of the frame!  The default Pool is resizable.
  ]],
  constructor = 'lovr.math.newPool'
}

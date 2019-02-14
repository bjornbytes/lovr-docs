return {
  summary = 'A Pool of vector objects.',
  description = [[
    A Pool is an object that is used to allocate vectors, matrices, and quaternions.  Pools exist
    mainly for efficiency -- allocating tiny bits of memory for every single vector can lead to
    performance problems related to the Lua garbage collector and other memory managers on the
    system.  By using a Pool, a single block of memory is used and the Pool keeps track of all of
    the vectors in the block.

    A Pool is allocated with a fixed amount of memory, so there is a limit on the number of objects
    it can create.  If the Pool runs out of space, it will overflow and cause an error.

    Pools can be drained using `Pool:drain`.  Draining the Pool resets its usage to zero, and clears
    all vectors allocated from the Pool.  This is helpful for keeping memory usage low when using a
    lot of temporary vectors, which is common, but can cause unexpected surprises if you have saved
    a vector into a variable!
  ]],
  constructor = 'lovr.math.newPool'
}

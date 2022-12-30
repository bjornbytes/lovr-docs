return {
  tag = 'compute',
  summary = 'Run a compute shader.',
  description = [[
    Runs a compute shader.  Before calling this, a compute shader needs to be active, using
    `Pass:setShader`.  This can only be called on a Pass with the `compute` type, which can be
    created using `lovr.graphics.getPass`.
  ]],
  arguments = {
     x = {
       type = 'number',
       default = '1',
       description = 'The number of workgroups to dispatch in the x dimension.'
     },
     y = {
       type = 'number',
       default = '1',
       description = 'The number of workgroups to dispatch in the y dimension.'
     },
     z = {
       type = 'number',
       default = '1',
       description = 'The number of workgroups to dispatch in the z dimension.'
     },
     buffer = {
       type = 'Buffer',
       description = [[
         A Buffer object containing the x, y, and z workgroup counts, stored as 4 byte unsigned
         integers.
       ]]
     },
     offset = {
       type = 'number',
       default = '0',
       description = 'The byte offset to read the workgroup counts from in the Buffer.'
     }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = [[
        Perform an "indirect" dispatch.  Instead of passing in the workgroup counts directly from
        Lua, the workgroup counts are read from a `Buffer` object at a particular byte offset.
        Each count should be a 4-byte integer, so in total 12 bytes will be read from the buffer.
      ]],
      arguments = { 'buffer', 'offset' },
      returns = {}
    }
  },
  notes = [[
    Usually compute shaders are run many times in parallel: once for each pixel in an image, once
    per particle, once per object, etc.  The 3 arguments represent how many times to run, or
    "dispatch", the compute shader, in up to 3 dimensions.  Each element of this grid is called a
    **workgroup**.

    To make things even more complicated, each workgroup itself is made up of a set of "mini GPU
    threads", which are called **local workgroups**.  Like workgroups, the local workgroup size can
    also be 3D.  It's declared in the shader code, like this:

        layout(local_size_x = w, local_size_y = h, local_size_z = d) in;

    All these 3D grids can get confusing, but the basic idea is to make the local workgroup size a
    small block of e.g. 32 particles or 8x8 pixels or 4x4x4 voxels, and then dispatch however many
    workgroups are needed to cover a list of particles, image, voxel field, etc.

    The reason to do it this way is that the GPU runs its threads in little fixed-size bundles
    called subgroups.  Subgroups are usually 32 or 64 threads (the exact size is given by the
    `subgroupSize` property of `lovr.graphics.getDevice`) and all run together.  If the local
    workgroup size was `1x1x1`, then the GPU would only run 1 thread per subgroup and waste the
    other 31 or 63.  So for the best performance, be sure to set a local workgroup size bigger than
    1!

    Inside the compute shader, a few builtin variables can be used to figure out which workgroup is
    running:

    - `uint WorkgroupCount` is the total number of workgroups (the product of all the sizes).
    - `uvec3 WorkgroupSize` is the number of workgroups in each axis (the `Pass:compute` arguments).
    - `uvec3 WorkgroupID` is the index current workgroup.
    - `uvec3 LocalThreadID` is the index of the local workgroup inside its workgroup.
    - `uvec3 GlobalThreadID` is the unique identifier for the thread within all local workgroups.
      It's equivalent to `WorkgroupID * LocalWorkgroupSize + LocalThreadID` (usually what you want!)

    Indirect compute dispatches are useful to "chain" compute shaders together, while keeping all of
    the data on the GPU.  The first dispatch can do some computation and write some results to
    buffers, then the second indirect dispatch can use the data in those buffers to know how many
    times it should run.  An example would be a compute shader that does some sort of object
    culling, writing the number of visible objects to a buffer along with the IDs of each one.
    Subsequent compute shaders can be indirectly dispatched to perform extra processing on the
    visible objects.  Finally, an indirect draw can be used to render them.
  ]],
  related = {
    'Pass:setShader',
    'Pass:send',
    'lovr.graphics.newShader',
    'lovr.graphics.getPass'
  }
}

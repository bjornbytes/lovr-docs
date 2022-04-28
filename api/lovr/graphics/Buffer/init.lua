return {
  summary = 'A block of memory on the GPU.',
  description = [[
    A Buffer is a block of GPU memory.  Buffers are similar to Lua tables or arrays: they have a
    length and store a list of values.  The length of a Buffer and its format (the types of values
    it stores) are declared upfront and can't be changed.  The data for a Buffer is stored in VRAM,
    allowing Shaders running on the GPU to access the Buffer data.

    Buffers are commonly used for:

    - Mesh data: Buffers hold the data that define the vertices in a mesh, like positions, normals,
      and UV coordinates.  Buffers also store the vertex indices of a mesh, which define how the
      vertices are connected together into triangles.  These are respectively called vertex and
      index buffers.
    - Shader data: Buffers can be bound to a Shader, letting the Shader read arbitrary data. For
      example, Lua code could create a Buffer with the positions and colors of all the lights in a
      scene, which a Shader can use to do lighting calculations.
    - Compute: Compute shaders can write data to Buffers.  This GPU-generated data can be used in
      later rendering work or sent back to Lua.
    - Indirect: Indirect rendering is an advanced technique where instructions for rendering work
      are recorded to a Buffer (potentially by a compute shader) and later drawn.

    There are two types of Buffers:

    - **Temporary** buffers are very inexpensive to create, and writing to them from Lua is fast.
      However, they become invalid at the end of `lovr.draw` (i.e. when `lovr.graphics.submit` is
      called).  The GPU is slightly slower at accessing data from temporary buffers, and compute
      shaders can not write to them.  They are designed for storing data that changes every frame.
    - **Permanent** buffers are more expensive to create, and updating their contents requires a
      transfer from CPU memory to VRAM.  They act like normal LÖVR objects and don't need to be
      recreated every frame.  They often have faster performance when used by the GPU, and compute
      shaders can write to them.  They are great for large pieces of data that are initialized once
      at load time, or data that is updated infrequently.

    Choose wisely!
  ]],
  constructors = {
    'lovr.graphics.buffer',
    'lovr.graphics.newBuffer'
  }
}

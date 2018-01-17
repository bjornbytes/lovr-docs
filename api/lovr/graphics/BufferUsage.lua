return {
  summary = 'How a Buffer is going to be updated.',
  description = [[
    Buffers can have a usage hint, describing how they are planning on being updated.  Setting the
    usage hint allows the graphics driver optimize how it handles the data in the Buffer.
  ]],
  values = {
    {
      name = 'static',
      description = 'The buffer contents will rarely change.'
    },
    {
      name = 'dynamic',
      description = 'The buffer contents will change often.'
    },
    {
      name = 'stream',
      description = [[
        The buffer contents will change constantly, potentially multiple times each frame.
      ]]
    }
  }
}

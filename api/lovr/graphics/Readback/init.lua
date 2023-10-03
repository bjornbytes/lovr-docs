return {
  summary = 'An asynchronous read of a GPU resource.',
  description = [[
    Readbacks track the progress of an asynchronous read of a `Buffer` or `Texture`.  Once a
    Readback is created in a transfer pass, and the transfer pass is submitted, the Readback can be
    polled for completion or the CPU can wait for it to finish using `Readback:wait`.
  ]],
  constructors = {
    'Buffer:newReadback',
    'Texture:newReadback'
  }
}

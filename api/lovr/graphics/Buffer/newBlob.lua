return {
  tag = 'buffer-transfer',
  async = true,
  summary = 'Create a new Blob containing the data in the Buffer.',
  description = [[
    Downloads the Buffer's data from VRAM and returns it as a `Blob`.  This is similar to
    `Buffer:getData`, but returns a `Blob` instead of a table.
  ]],
  arguments = {
    offset = {
      type = 'number?',
      default = '0',
      description = 'An offset in the Buffer to read from, in bytes.'
    },
    extent = {
      type = 'number?',
      description = 'The number of bytes to read.  If nil, reads the remainder of the buffer.'
    }
  },
  returns = {
    blob = {
      type = 'Blob',
      description = 'A new Blob with the Buffer\'s data.'
    }
  },
  variants = {
    {
      arguments = { 'offset', 'extent' },
      returns = { 'blob' }
    }
  },
  notes = [[
    This function is very slow, because it stalls the CPU until the data has finished downloading
    from the GPU.  The stall can be avoided be calling this function in a task, which will put the
    task to sleep until the data is ready.  See `lovr.task` for more details.
  ]],
  related = {
    'Buffer:getData',
    'Texture:getPixels'
  }
}

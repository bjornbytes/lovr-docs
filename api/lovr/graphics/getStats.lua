return {
  summary = 'Get graphics metrics and statistics.',
  description = 'Returns various statistics about GPU usage.',
  arguments = {},
  returns = {
    stats = {
      type = 'table',
      description = 'A table with statistics.',
      table = {
        {
          name = 'bufferMemory',
          type = 'number',
          description = 'The amount of VRAM used by `Buffer`, `Mesh`, `Model`, etc. in bytes.'
        },
        {
          name = 'textureMemory',
          type = 'number',
          description = 'The amount of VRAM used by `Texture` objects, in bytes.'
        },
        {
          name = 'memoryBudget',
          type = 'number',
          description = [[
            An estimate of the total amount of VRAM available for use by LÖVR, in bytes.  This takes
            into account VRAM being used by other programs.  Can be `nil` if the current GPU does
            not support querying this statistic.
          ]]
        },
        {
          name = 'memoryUsage',
          type = 'number',
          description = [[
            An estimate of the total amount of VRAM currently being used by LÖVR, in bytes.  This
            will often be larger than `bufferMemory + textureMemory`, since it includes other
            internal memory allocations made by LÖVR or the GPU driver (example: reserved memory,
            memory for shader variables, internal canvas textures).  If this value approaches
            `memoryBudget`, the GPU driver may start paging allocations out to CPU RAM, or
            allocating more VRAM may start to fail.  Can be `nil` if the current GPU does not
            support querying this statistic.
          ]]
        }
      }
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'stats' }
    }
  },
  related = {
    'Pass:getStats'
  }
}

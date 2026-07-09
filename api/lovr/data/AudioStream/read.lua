return {
  summary = 'Read data from the AudioStream.',
  description = 'Reads data from the AudioStream.',
  arguments = {
    count = {
      type = 'number?',
      description = 'The number of frames to read.  Defaults to all of the data in the stream.'
    },
    sound = {
      type = 'Sound',
      description = 'A Sound to write the audio to.'
    },
    blob = {
      type = 'Blob',
      description = 'A Blob to write the audio to.'
    },
    offset = {
      type = 'number?',
      default = '0',
      description = [[
        An offset to start writing into the destination (frames for Sounds, bytes for Blobs).
      ]]
    }
  },
  returns = {
    n = {
      type = 'number',
      description = 'The number of audio frames that were actually read.'
    },
    table = {
      type = '{number}',
      description = 'A table of audio samples.'
    }
  },
  variants = {
    {
      arguments = { 'count' },
      returns = { 'table' }
    },
    {
      arguments = { 'count', 'sound', 'offset' },
      returns = { 'n' }
    },
    {
      arguments = { 'count', 'blob', 'offset' },
      returns = { 'n' }
    }
  },
  notes = [[
    When writing to a Blob or Sound, `count` is clamped, using the size of the destination and the
    `offset` parameter.

    Only one thread can read from the stream at a time.
  ]],
  related = {
    'AudioStream:write',
    'AudioStream:getReadCapacity'
  }
}

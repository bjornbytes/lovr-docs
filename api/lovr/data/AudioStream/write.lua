return {
  summary = 'Write data to the AudioStream.',
  description = 'Writes data to the AudioStream.',
  arguments = {
    table = {
      type = '{number}',
      description = 'A table containing audio samples to write to the stream.'
    },
    sound = {
      type = 'Sound',
      description = 'A Sound to write to the stream.'
    },
    blob = {
      type = 'Blob',
      description = 'A Blob to write to the stream.'
    }
  },
  returns = {
    n = {
      type = 'number',
      description = 'The number of audio frames that were actually written to the stream.'
    }
  },
  variants = {
    {
      arguments = { 'table' },
      returns = { 'n' }
    },
    {
      arguments = { 'sound' },
      returns = { 'n' }
    },
    {
      arguments = { 'blob' },
      returns = { 'n' }
    }
  },
  notes = 'Only one thread can write to the stream at a time.',
  related = {
    'AudioStream:read',
    'AudioStream:getWriteCapacity'
  }
}

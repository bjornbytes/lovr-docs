return {
  summary = 'Seek the stream to a new position.',
  description = [[
    Seeks the AudioStream to the specified position.  This will cause any Sources created from the
    stream to also seek their playback position.
  ]],
  arguments = {
    {
      name = 'time',
      type = 'number',
      description = 'The time to seek to, in seconds.'
    }
  },
  returns = {}
}

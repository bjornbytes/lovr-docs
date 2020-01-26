return {
  summary = 'Set the playback position of the Source.',
  description = 'Seeks the Source to the specified position. Note that you may not `seek()` a `Source` backed by a raw `AudioStream`.',
  arguments = {
    {
      name = 'position',
      type = 'number',
      description = 'The position to seek to.'
    },
    {
      name = 'unit',
      type = 'TimeUnit',
      default = [['seconds']],
      description = 'The units for the seek position.'
    }
  },
  returns = {}
}

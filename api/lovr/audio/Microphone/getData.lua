return {
  summary = 'Get a new SoundData with recorded audio.',
  description = [[
    Returns a new SoundData with all of the buffered audio samples that the Microphone has recorded.
  ]],
  arguments = {},
  returns = {
    {
      name = 'channels',
      type = 'number',
      description = 'The number of channels recorded.'
    }
  },
  notes = [[
    There's a limit on the number of samples the Microphone is able to hold, which can be set at
    creation time in `lovr.audio.newMicrophone`.  While the Microphone is recording, be sure to call
    this function periodically to get a new chunk of audio in order to make room for more.

    You can use `Microphone:getSampleCount` to figure out how many samples the Microphone is
    currently holding.
  ]],
  related = {
    'Microphone:getSampleCount',
    'Microphone:startRecording',
    'Microphone:stopRecording',
    'Microphone:isRecording',
    'SoundData'
  }
}

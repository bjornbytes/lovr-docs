return {
  summary = 'Create a new AudioStream.',
  description = 'Creates a new AudioStream.',
  arguments = {
    capacity = {
      type = 'number',
      description = 'The capacity of the audio stream, in frames.'
    },
    format = {
      type = 'SampleFormat?',
      default = [['f32']],
      description = 'The format of the audio stream.'
    },
    channels = {
      type = 'number',
      description = 'The number of channels in the audio stream.'
    },
    rate = {
      type = 'number?',
      default = '48000',
      description = 'The sample rate of the audio stream, in Hz.'
    }
  },
  returns = {
    stream = {
      type = 'AudioStream',
      description = 'The new AudioStream.'
    }
  },
  variants = {
    {
      arguments = { 'capacity', 'format', 'channels', 'rate' },
      returns = { 'stream' }
    }
  },
  related = {
    'lovr.data.newSound',
    'lovr.audio.getStream'
  }
}

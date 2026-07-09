return {
  tag = 'devices',
  summary = 'Get an audio stream for an audio device.',
  description = [[
    Returns an audio stream for an audio device.  The stream needs to be set up when configuring the
    device using `lovr.audio.setDevice`.

    For playback devices, the stream will contain all audio sent to the speakers by LÖVR.  For
    capture devices, the stream will contain audio captured by the microphone.
  ]],
  arguments = {},
  returns = {
    stream = {
      type = 'AudioStream?',
      description = 'The audio stream containing audio played/captured by the device.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'stream' }
    }
  },
  example = [[
    function lovr.load()
      -- activate default microphone
      lovr.audio.setDevice('capture', nil)
      lovr.audio.start('capture')

      stream = lovr.audio.getStream('capture')
    end

    function lovr.update(dt)
      print('There are ' .. stream:getReadCapacity() .. ' microphone samples available')

      local samples = stream:read()

      -- do something with samples
    end
  ]]
}

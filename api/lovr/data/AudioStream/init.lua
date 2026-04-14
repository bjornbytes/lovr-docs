return {
  summary = 'An object that holds raw audio samples.',
  description = [[
    An AudioStream is similar to a `Sound`, but stores a continuous stream of audio.  `Source`
    objects can be created from AudioStreams.

    Audio streams are used for microphone input, by capturing samples from an audio device.  See
    `lovr.audio.setDevice` and `lovr.audio.getStream` for more details.  They are also useful for
    generating audio dynamically and playing it with a `Source`.

    Streams store audio data in a fixed-size ring buffer.  Data is always written to the end of the
    stream, and reading data will read from the beginning.  Once data is read, it is "consumed",
    making more space available for writing.  Only one thread is allowed to write to the stream at a
    time, and only one thread is allowed to read.
  ]],
  extends = 'Object',
  constructor = 'lovr.data.newAudioStream'
}

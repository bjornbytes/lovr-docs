return {
  tag = 'devices',
  summary = 'Switch audio devices.',
  description = [[
    Switches either the playback or capture device to a new one.

    If a device for the given type is already active, it will be stopped and destroyed.  The new
    device will not be started automatically, use `lovr.audio.start` to start it.

    The device ID can be one of the IDs retrieved using `lovr.audio.getDevices`, or `nil` to use the
    default audio device.

    A stream can also be provided when changing the device.  This is an `AudioStream` object that
    will receive all audio played or captured from the device.  It can also be `true` to create a
    default stream, which can be accessed using `lovr.audio.getStream`. Data from the device will
    automatically be converted to the format of the stream.  Be sure to periodically read data from
    the stream using `AudioStream:read`, otherwise its buffer could overflow and start to drop data.

    Audio devices can be started in `shared` or `exclusive` mode.  Exclusive devices may have lower
    latency than shared devices, but there's a higher chance that requesting exclusive access to an
    audio device will fail (either because it isn't supported or allowed).  One strategy is to first
    try the device in exclusive mode, switching to shared if it doesn't work.
  ]],
  arguments = {
    type = {
      type = 'AudioType?',
      default = [['playback']],
      description = 'The device to switch.'
    },
    id = {
      type = 'userdata?',
      default = 'nil',
      description = 'The id of the device to use, or `nil` to use the default device.'
    },
    stream = {
      type = 'AudioStream? | boolean?',
      default = 'nil',
      description = [[
        An optional audio stream to use as a "sink" for the device.  For playback devices, any audio
        sent to the speakers is also copied to the sink.  For capture devices, audio captured by the
        device is copied to the sink.  Can be a specific AudioStream, or `true` to create a default
        audio stream matching the native format of the device.  If nil, this will be `true` for
        capture devices and `false` for playback devices.  Use `lovr.audio.getStream` to get the
        stream after the device is created.
      ]]
    },
    mode = {
      type = 'AudioShareMode?',
      default = 'shared',
      description = 'The sharing mode for the device.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = 'Whether creating the audio device succeeded.'
    }
  },
  variants = {
    {
      arguments = { 'type', 'id', 'stream', 'mode' },
      returns = { 'success' }
    }
  },
  related = {
    'lovr.audio.getDevice',
    'lovr.audio.getDevices',
    'lovr.audio.getStream',
    'lovr.audio.start',
    'lovr.audio.stop'
  }
}

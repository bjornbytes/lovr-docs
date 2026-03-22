return {
  summary = 'An object that holds raw audio samples.',
  description = [[
    A Sound stores the data for a sound.  The supported sound formats are OGG, WAV, and MP3.  Sounds
    cannot be played directly.  Instead, there are `Source` objects in `lovr.audio` that are used
    for audio playback.  All Source objects are backed by one of these Sounds, and multiple Sources
    can share a single Sound to reduce memory usage.

    Metadata
    ---

    Sounds hold a fixed number of frames.  Each frame contains one audio sample for each channel.
    The `SampleFormat` of the Sound is the data type used for each sample (floating point, integer,
    etc.).  The Sound has a `ChannelLayout`, representing the number of audio channels and how they
    map to speakers (mono, stereo, etc.).  The sample rate of the Sound indicates how many frames
    should be played per second.  The duration of the sound (in seconds) is the number of frames
    divided by the sample rate.

    Compression
    ---

    Sounds can be compressed.  Compressed sounds are stored compressed in memory and are decoded as
    they are played.  This uses a lot less memory but increases CPU usage during playback.  OGG and
    MP3 are compressed audio formats.  When creating a sound from a compressed format, there is an
    option to immediately decode it, storing it uncompressed in memory.  It can be a good idea to
    decode short sound effects, since they won't use very much memory even when uncompressed and it
    will improve CPU usage.  Compressed sounds can not be written to using `Sound:setFrames`.

    Streams
    ---

    Sounds can be created as a stream by passing `'stream'` as their contents when creating them.
    Audio frames can be written to the end of the stream, and read from the beginning.  This works
    well for situations where data is being generated in real time or streamed in from some other
    data source.

    Sources can be backed by a stream and they'll just play whatever audio is pushed to the stream.
    The audio module also lets you use a stream as a "sink" for an audio device.  For playback
    devices, this works like loopback, so the mixed audio from all playing Sources will get written
    to the stream.  For capture devices, all the microphone input will get written to the stream.
    Conversion between sample formats, channel layouts, and sample rates will happen automatically.

    Keep in mind that streams can still only hold a fixed number of frames.  If too much data is
    written before it is read, older frames will start to get overwritten.  Similary, it's possible
    to read too much data without writing fast enough.

    Ambisonics
    ---

    Ambisonic sounds represent a sphere of sound coming from all directions.  Ambisonics can be
    imported from WAV files with 4, 9, or 16 channels.  LÖVR stores ambisonic sounds in the AmbiX
    format (ACN channel ordering and SN3D channel normalization), automatically converting 4-channel
    AMB sounds to AmbiX.  Ambisonic sounds can be played using a `Source`, just like other sounds.
  ]],
  extends = 'Object',
  constructor = 'lovr.data.newSound'
}

return {
  tag = 'sources',
  summary = 'Create a new Source.',
  description = [[
    Creates a new Source from an ogg, wav, or mp3 file, a `Sound`, or an `AudioStream`.
  ]],
  arguments = {
    file = {
      type = 'string | Blob',
      description = 'A filename or Blob containing audio data to load.'
    },
    sound = {
      type = 'Sound',
      description = 'The Sound containing audio to play.'
    },
    stream = {
      type = 'Sound',
      description = 'The AudioStream containing audio to play.'
    },
    options = {
      type = 'table?',
      default = 'nil',
      description = 'Optional options.',
      table = {
        {
          name = 'decode',
          type = 'boolean?',
          default = 'false',
          description = [[
            Whether to immediately decode compressed sounds, instead of progressively decoding as
            the Source plays.  Enabling this will use more memory but reduce CPU overhead during
            playback.  Recommended for short sound effects.
          ]]
        },
        {
          name = 'spatial',
          type = 'boolean?',
          default = 'false',
          description = [[
            Whether the Source should use spatial effects.  Non-spatial sources will get routed
            directly to the speakers without further processing.
          ]]
        },
        {
          name = 'pitchable',
          type = 'boolean?',
          default = 'true',
          description = [[
            Whether the pitch of the Source can be changed with `Source:setPitch`.  Setting this to
            false will improve performance slightly.
          ]]
        }
      }
    }
  },
  returns = {
    source = {
      type = 'Source',
      description = 'The new Source.'
    }
  },
  variants = {
    {
      arguments = { 'file', 'options' },
      returns = { 'source' }
    },
    {
      arguments = { 'sound', 'options' },
      returns = { 'source' }
    },
    {
      arguments = { 'stream', 'options' },
      returns = { 'source' }
    }
  },
  example = [[
    function lovr.load()
      sandstorm = lovr.audio.newSource('darude.ogg', { decode = false })
      sandstorm:play()
    end
  ]],
  related = {
    'Source:clone'
  }
}

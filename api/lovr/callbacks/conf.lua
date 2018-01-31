return {
  tag = 'callbacks',
  summary = 'Called to read configuration settings at startup.',
  description = [[
    The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right
    before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special
    file that's loaded before the rest of the framework initializes.
  ]],
  arguments = {
    {
      name = 't',
      type = 'table',
      description = 'The table to edit the configuration settings on.',
      table = {
        {
          name = 'identity',
          type = 'string',
          description = 'A unique label for this project.'
        },
        {
          name = 'modules',
          type = 'table',
          description = 'The set of enabled modules to use.',
          table = {
            {
              name = 'audio',
              type = 'boolean',
              description = 'Whether the audio module should be enabled.'
            },
            {
              name = 'event',
              type = 'boolean',
              description = 'Whether the event module should be enabled.'
            },
            {
              name = 'filesystem',
              type = 'boolean',
              description = 'Whether the filesystem module should be enabled.'
            },
            {
              name = 'graphics',
              type = 'boolean',
              description = 'Whether the graphics module should be enabled.'
            },
            {
              name = 'headset',
              type = 'boolean',
              description = 'Whether the headset module should be enabled.'
            },
            {
              name = 'math',
              type = 'boolean',
              description = 'Whether the math module should be enabled.'
            },
            {
              name = 'timer',
              type = 'boolean',
              description = 'Whether the timer module should be enabled.'
            }
          }
        }
      }
    }
  },
  returns = {},
  notes = [[
    Disabling the `headset` module can improve startup time a lot if you aren't intending to use
    `lovr.headset`.
  ]],
  example = {
    description = 'A noop conf.lua that sets all configuration settings to their defaults:',
    code = [[
        function lovr.conf(t)
          -- Set the project identity
          t.identity = 'default'

          -- Enable or disable different modules
          t.modules.audio = true
          t.modules.event = true
          t.modules.graphics = true
          t.modules.headset = true
          t.modules.math = true
          t.modules.timer = true
        end
    ]]
  },
  related = {
    'lovr.load'
  }
}

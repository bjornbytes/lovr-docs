return {
  tag = 'window',
  summary = 'Creates the window.',
  description = 'Create the desktop window, usually used to mirror the headset display.',
  arguments = {
    {
      name = 'width',
      type = 'number',
      default = '800',
      description = 'The width of the window.'
    },
    {
      name = 'height',
      type = 'number',
      default = '600',
      description = 'The height of the window.'
    },
    {
      name = 'fullscreen',
      type = 'boolean',
      default = 'false',
      description = 'Whether the window should be fullscreen.'
    },
    {
      name = 'msaa',
      type = 'number',
      default = '0',
      description = 'The number of samples to use for multisample antialiasing.'
    },
    {
      name = 'title',
      type = 'string',
      default = 'nil',
      description = 'The window title.'
    },
    {
      name = 'icon',
      type = 'string',
      default = 'nil',
      description = 'A path to an image to use for the window icon.'
    }
  },
  returns = {},
  notes = [[
    This function can only be called once. It is normally called internally, but you can override
    this by setting window to `nil` in conf.lua.  See `lovr.conf` for more information.
  ]]
}

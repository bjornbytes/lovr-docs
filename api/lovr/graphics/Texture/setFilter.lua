return {
  summary = 'Set the FilterMode for the Texture.',
  description = [[
    Sets the `FilterMode` used by the texture when upsampling or downsampling.  The default mode is
    `linear`.
  ]],
  arguments = {
    {
      name = 'min',
      type = 'FilterMode',
      description = 'The filter mode used for minification.'
    },
    {
      name = 'mag',
      default = 'min',
      type = 'FilterMode',
      description = 'The filter mode used for magnification.'
    }
  },
  returns = {}
}

return {
  summary = 'Get the window pass.',
  description = [[
    Returns the window pass.  This is a builtin render `Pass` object that renders to the desktop
    window texture.  If the desktop window was not open when the graphics module was initialized,
    this function will return `nil`.
  ]],
  arguments = {},
  returns = {
    {
      name = 'pass',
      type = 'Pass',
      description = 'The window pass, or `nil` if there is no window.'
    }
  },
  notes = [[
    - TODO is the same pass always returned
    - TODO does the texture change
    - TODO what settings does the Pass use (incl conf.lua)
    - TODO is it reset
  ]]
}

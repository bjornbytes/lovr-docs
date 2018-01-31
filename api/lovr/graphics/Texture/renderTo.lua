return {
  summary = 'Render to a Texture.',
  description = [[
    Renders to a Texture using a function.  The Texture must be created as a framebuffer by passing
    a width and height to `lovr.graphics.newTexture` instead of a filename.
  ]],
  arguments = {
    {
      name = 'callback',
      type = 'function',
      description = 'A function that calls drawing commands to render to the Texture.'
    }
  },
  returns = {},
  notes = [[
    Make sure you clear the contents of the Texture before rendering to it to clear any previous
    contents.
  ]]
}

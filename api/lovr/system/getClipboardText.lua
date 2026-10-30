return {
  tag = 'system-clipboard',
  summary = 'Get the clipboard text.',
  description = 'Returns the clipboard text.',
  arguments = {},
  returns = {
    text = {
      type = 'string?',
      description = 'The clipboard text.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'text' }
    }
  }
}

return {
  tag = 'input',
  summary = 'Get the state of a key.',
  description = 'Returns whether a key on the keyboard is pressed.',
  arguments = {
    {
      name = 'key',
      type = 'KeyCode',
      description = 'The key.'
    }
  },
  returns = {
    {
      name = 'down',
      type = 'boolean',
      description = 'Whether the key is currently pressed.'
    }
  }
}

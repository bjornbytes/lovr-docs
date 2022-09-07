return {
  tag = 'pipeline',
  summary = 'Enable or disable alpha to coverage.',
  description = 'TODO',
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether alpha to coverage should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enable' },
      returns = {}
    }
  }
}

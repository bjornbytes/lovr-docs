return {
  tag = 'pipeline',
  summary = 'Enable or disable depth clamp.',
  description = 'TODO',
  arguments = {
    font = {
      type = 'Font',
      description = 'The Font to use when rendering text.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'font' },
      returns = {}
    }
  },
  related = {
    'Pass:text'
  }
}

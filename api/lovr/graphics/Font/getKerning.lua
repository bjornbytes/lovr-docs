return {
  summary = 'Get the kerning of the Font.',
  description = 'TODO',
  arguments = {
    {
      name = 'first',
      type = 'Codepoint',
      description = 'TODO'
    },
    {
      name = 'second',
      type = 'Codepoint',
      description = 'TODO'
    }
  },
  returns = {
    {
      name = 'kerning',
      type = 'number',
      description = 'TODO'
    }
  },
  related = {
    'Font:getAscent',
    'Font:getDescent',
    'Font:getHeight',
    'Font:getWidth'
  }
}

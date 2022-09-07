return {
  summary = 'Clone a Shader.',
  description = 'TODO',
  arguments = {
    source = {
      type = 'Shader',
      description = 'The Shader to clone.'
    },
    flags = {
      type = 'table',
      description = 'TODO'
    }
  },
  returns = {
    shader = {
      type = 'Shader',
      description = 'The new Shader.'
    }
  },
  variants = {
    {
      arguments = { 'source', 'flags' },
      returns = { 'shader' }
    }
  }
}

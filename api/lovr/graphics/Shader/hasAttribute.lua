return {
  summary = 'Check if the Shader has a given vertex attribute.',
  description = 'TODO',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of an attribute.'
    },
    location = {
      type = 'number',
      description = 'The location of an attribute.'
    }
  },
  returns = {
    exists = {
      type = 'boolean',
      description = 'Whether the Shader has the attribute.'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'exists' }
    },
    {
      arguments = { 'location' },
      returns = { 'exists' }
    }
  }
}

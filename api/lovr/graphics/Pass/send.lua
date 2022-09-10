return {
  tag = 'shader-inputs',
  summary = 'Set the value of a shader variable.',
  description = 'TODO',
  arguments = {
    name = {
      type = 'string',
      description = 'The name of the Shader variable.'
    },
    binding = {
      type = 'number',
      description = 'The binding number of the Shader variable.'
    },
    buffer = {
      type = 'Buffer',
      description = 'The Buffer to assign.'
    },
    texture = {
      type = 'Texture',
      description = 'The Texture to assign.'
    },
    sampler = {
      type = 'Sampler',
      description = 'The Sampler to assign.'
    },
    constant = {
      type = '*',
      description = 'Numbers or vectors to assign to the push constant.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'name', 'buffer' },
      returns = {}
    },
    {
      arguments = { 'name', 'texture' },
      returns = {}
    },
    {
      arguments = { 'name', 'sampler' },
      returns = {}
    },
    {
      arguments = { 'name', 'constant' },
      returns = {}
    },
    {
      arguments = { 'binding', 'buffer' },
      returns = {}
    },
    {
      arguments = { 'binding', 'texture' },
      returns = {}
    },
    {
      arguments = { 'binding', 'sampler' },
      returns = {}
    }
  },
  notes = 'TODO'
}

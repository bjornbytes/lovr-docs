return {
  summary = 'Update a variable in the ShaderBlock.',
  description = 'Updates a variable in the ShaderBlock.',
  arguments = {
    variable = {
      type = 'string',
      description = 'The name of the variable to update.'
    },
    value = {
      type = '*',
      description = 'The new value of the uniform.'
    },
    blob = {
      type = 'Blob',
      description = 'A Blob to replace the entire block with.'
    }
  },
  returns = {
    bytes = {
      type = 'number',
      description = 'How many bytes were copied to the block.'
    }
  },
  variants = {
    {
      arguments = { 'string', '*' },
      returns = {}
    },
    {
      arguments = { 'blob' },
      returns = { 'bytes' }
    }
  },
  notes = [[
    For scalar or vector types, use tables of numbers for each vector.

    For matrix types, use tables of numbers or `Transform` objects.

    `Blob`s can also be used to pass arbitrary binary data to individual variables.
  ]],
  related = {
    'Shader:send',
    'Shader:sendBlock',
    'ShaderBlock:getShaderCode',
    'ShaderBlock:getOffset',
    'ShaderBlock:getSize'
  }
}

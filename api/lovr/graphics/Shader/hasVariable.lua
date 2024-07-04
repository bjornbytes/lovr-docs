return {
  summary = 'Check if the Shader has a variable.',
  description = 'Returns whether the Shader has a variable.',
  arguments = {
    name = {
      type = 'string',
    }
  },
  returns = {
    exists = {
      type = 'boolean',
      description = 'Whether the Shader has the variable.'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'exists' }
    }
  },
  notes = [[
    This will return true if the variable is a buffer, texture, sampler, or other uniform variable
    (anything that can be sent with `Pass:send`).
  ]],
  example = [[
    for key, texture in pairs(textures) do
      if shader:hasVariable(key) then
        pass:send(key, texture)
      end
    end
  ]],
  related = {
    'Pass:send'
  }
}

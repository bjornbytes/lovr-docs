return {
  summary = 'Clone a Shader.',
  description = [[
    Clones a shader.  This creates an inexpensive copy of it with different flags.  It can be used
    to create several variants of a shader with different behavior.
  ]],
  arguments = {
    flags = {
      type = 'table',
      description = [[
        A table of shader flags.  The keys of the table should be flag names or flag ID numbers. The
        values can be numbers or booleans, depending on the type of the flag as declared in the
        shader.  The clones set here will override any set in the parent shader.  See `ShaderFlag`
        for the set of builtin shader flags.
      ]]
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
      arguments = { 'flags' },
      returns = { 'shader' }
    }
  }
}

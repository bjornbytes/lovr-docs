return {
  summary = 'Get the format table of the VertexData.',
  description = [[
    Returns the format of the VertexData.  The format table specifies the data held in each vertex.
    Each entry in the table indicates the name of the attribute, the data type, and the number of
    components in the attribute.
  ]],
  arguments = {},
  returns = {
    {
      name = 'format',
      type = 'table',
      description = 'The format table.'
    }
  }
}

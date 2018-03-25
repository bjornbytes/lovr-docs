return {
  summary = 'Create a new VertexData.',
  description = 'Creates a new VertexData with a given capacity and format.',
  arguments = {
    {
      name = 'count',
      type = 'number',
      description = 'The maximum number of vertices the VertexData can hold.'
    },
    {
      name = 'format',
      type = 'table',
      default = 'nil',
      description = 'The format table containing the vertex layout for the VertexData.'
    }
  },
  returns = {
    {
      name = 'vertexData',
      type = 'VertexData',
      description = 'The new VertexData.'
    }
  },
  notes = [[
    The format table specifies the data held in each vertex.  Each entry in the table indicates the
    name of the attribute, the data type, and the number of components in the attribute.  The default
    format table contains attributes for vertex positions, normals and texture coordinates:

       {
         { 'lovrPosition', 'float', 3 },
         { 'lovrNormal', 'float', 3 },
         { 'lovrTexCoord', 'float', 2 }
       }
  ]]
}

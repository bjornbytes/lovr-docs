return {
  summary = 'Iterate over the nodes with meshes in the Model.',
  description = [[
    Returns an iterator that iterates over the nodes with meshes in the Model.

    This is convenient when drawing individual meshes in the Model using `Pass:drawPart`.
  ]],
  arguments = {},
  returns = {
    iterator = {
      type = 'function',
      description = [[
        The iterator function.  The iterator function returns the index of the next node, and the
        index of its mesh.
      ]]
    },
    state = {
      type = 'Model',
      description = 'The Model.'
    },
    initial = {
      type = 'nil',
      description = 'The initial value.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'iterator', 'state', 'initial' }
    }
  },
  example = [[
    function lovr.draw(pass)
      for node, mesh in model:meshes() do
        pass:push()
        pass:transform(model:getNodeTransform(node))
        -- Instead of drawing the whole mesh like this,
        -- you could also draw individual parts of the mesh
        pass:drawPart(model, mesh)
        pass:pop()
      end
    end
  ]],
  related = {
    'Model:getNodeMesh',
    'Pass:drawPart'
  }
}

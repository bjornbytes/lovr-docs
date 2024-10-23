return {
  summary = 'Get the scale the MeshShape was created with.',
  description = 'Returns the scale the MeshShape was created with.',
  arguments = {},
  returns = {
    scale = {
      type = 'number',
      description = 'The scale.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'scale' }
    }
  },
  related = {
    'lovr.physics.newMeshShape',
    'World:newMeshCollider'
  }
}

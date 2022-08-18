return {
  summary = 'Get the bounding box of the Model.',
  description = 'Returns the 6 values of the Model\'s axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'minx',
      type = 'number',
      description = 'The minimum x coordinate of the vertices in the Model.'
    },
    {
      name = 'maxx',
      type = 'number',
      description = 'The maximum x coordinate of the vertices in the Model.'
    },
    {
      name = 'miny',
      type = 'number',
      description = 'The minimum y coordinate of the vertices in the Model.'
    },
    {
      name = 'maxy',
      type = 'number',
      description = 'The maximum y coordinate of the vertices in the Model.'
    },
    {
      name = 'minz',
      type = 'number',
      description = 'The minimum z coordinate of the vertices in the Model.'
    },
    {
      name = 'maxz',
      type = 'number',
      description = 'The maximum z coordinate of the vertices in the Model.'
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDepth',
    'Model:getDimensions',
    'Model:getCenter',
    'Model:getBoundingSphere',
    'ModelData:getBoundingBox',
    'Collider:getAABB'
  }
}

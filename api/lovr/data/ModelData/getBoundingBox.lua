return {
  summary = 'Get the bounding box of the model.',
  description = 'Returns the 6 values of the model\'s axis-aligned bounding box.',
  arguments = {},
  returns = {
    {
      name = 'minx',
      type = 'number',
      description = 'The minimum x coordinate of the vertices in the model.'
    },
    {
      name = 'maxx',
      type = 'number',
      description = 'The maximum x coordinate of the vertices in the model.'
    },
    {
      name = 'miny',
      type = 'number',
      description = 'The minimum y coordinate of the vertices in the model.'
    },
    {
      name = 'maxy',
      type = 'number',
      description = 'The maximum y coordinate of the vertices in the model.'
    },
    {
      name = 'minz',
      type = 'number',
      description = 'The minimum z coordinate of the vertices in the model.'
    },
    {
      name = 'maxz',
      type = 'number',
      description = 'The maximum z coordinate of the vertices in the model.'
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDepth',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'ModelData:getBoundingSphere',
    'Model:getBoundingBox'
  }
}

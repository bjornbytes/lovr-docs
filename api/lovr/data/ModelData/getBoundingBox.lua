return {
  summary = 'Get the bounding box of the model.',
  description = 'Returns the 6 values of the model\'s axis-aligned bounding box.',
  arguments = {
    mesh = {
      type = 'number',
      description = 'The mesh to get the bounding box of.'
    },
    part = {
      type = 'number',
      description = 'The part to get the bounding box of.'
    }
  },
  returns = {
    minx = {
      type = 'number',
      description = 'The minimum x coordinate of the bounding box.'
    },
    maxx = {
      type = 'number',
      description = 'The maximum x coordinate of the bounding box.'
    },
    miny = {
      type = 'number',
      description = 'The minimum y coordinate of the bounding box.'
    },
    maxy = {
      type = 'number',
      description = 'The maximum y coordinate of the bounding box.'
    },
    minz = {
      type = 'number',
      description = 'The minimum z coordinate of the bounding box.'
    },
    maxz = {
      type = 'number',
      description = 'The maximum z coordinate of the bounding box.'
    }
  },
  variants = {
    {
      description = 'Get the bounding box of the whole model.',
      arguments = {},
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    },
    {
      description = 'Get the bounding box of a single mesh in the model.',
      arguments = { 'mesh' },
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    },
    {
      description = 'Get the bounding box of a single part of a mesh in the model.',
      arguments = { 'mesh', 'part' },
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    }
  },
  related = {
    'ModelData:getWidth',
    'ModelData:getHeight',
    'ModelData:getDepth',
    'ModelData:getDimensions',
    'ModelData:getCenter',
    'Model:getBoundingBox'
  }
}

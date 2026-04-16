return {
  summary = 'Get the bounding box of the Model.',
  description = 'Returns the 6 values of the Model\'s axis-aligned bounding box.',
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
      description = 'The minimum x coordinate of the vertices in the Model.'
    },
    maxx = {
      type = 'number',
      description = 'The maximum x coordinate of the vertices in the Model.'
    },
    miny = {
      type = 'number',
      description = 'The minimum y coordinate of the vertices in the Model.'
    },
    maxy = {
      type = 'number',
      description = 'The maximum y coordinate of the vertices in the Model.'
    },
    minz = {
      type = 'number',
      description = 'The minimum z coordinate of the vertices in the Model.'
    },
    maxz = {
      type = 'number',
      description = 'The maximum z coordinate of the vertices in the Model.'
    }
  },
  variants = {
    {
      description = 'Get the bounding box of the whole Model.',
      arguments = {},
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    },
    {
      description = 'Get the bounding box of a single mesh in the Model.',
      arguments = { 'mesh' },
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    },
    {
      description = 'Get the bounding box of a single part of a mesh in the Model.',
      arguments = { 'mesh', 'part' },
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    }
  },
  related = {
    'Model:getWidth',
    'Model:getHeight',
    'Model:getDepth',
    'Model:getDimensions',
    'Model:getCenter',
    'ModelData:getBoundingBox',
    'Mesh:getBoundingBox',
    'Collider:getAABB'
  }
}

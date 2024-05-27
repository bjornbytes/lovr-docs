return {
  summary = 'Get the Shape\'s axis aligned bounding box.',
  description = 'Returns the axis aligned bounding box of the Shape.',
  arguments = {},
  returns = {
    minx = {
      type = 'number',
      description = 'The minimum x coordinate of the box.'
    },
    maxx = {
      type = 'number',
      description = 'The maximum x coordinate of the box.'
    },
    miny = {
      type = 'number',
      description = 'The minimum y coordinate of the box.'
    },
    maxy = {
      type = 'number',
      description = 'The maximum y coordinate of the box.'
    },
    minz = {
      type = 'number',
      description = 'The minimum z coordinate of the box.'
    },
    maxz = {
      type = 'number',
      description = 'The maximum z coordinate of the box.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'minx', 'maxx', 'miny', 'maxy', 'minz', 'maxz' }
    }
  },
  related = {
    'Collider:getAABB'
  }
}

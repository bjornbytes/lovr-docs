return {
  summary = 'Get the axis aligned bounding box of the Model.',
  description = 'TODO',
  arguments = {},
  returns = {
    {
      name = 'minx',
      type = 'number',
      description = 'The minimum x coordinate of the box.'
    },
    {
      name = 'maxx',
      type = 'number',
      description = 'The maximum x coordinate of the box.'
    },
    {
      name = 'miny',
      type = 'number',
      description = 'The minimum y coordinate of the box.'
    },
    {
      name = 'maxy',
      type = 'number',
      description = 'The maximum y coordinate of the box.'
    },
    {
      name = 'minz',
      type = 'number',
      description = 'The minimum z coordinate of the box.'
    },
    {
      name = 'maxz',
      type = 'number',
      description = 'The maximum z coordinate of the box.'
    }
  },
  related = {
    'Collider:getAABB'
  }
}

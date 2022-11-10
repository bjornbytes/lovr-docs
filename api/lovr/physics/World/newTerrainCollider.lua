return {
  tag = 'colliders',
  summary = 'Add a Collider with a TerrainShape to the World.',
  description = 'Adds a new Collider to the World with a TerrainShape already attached.',
  arguments = {
    scale = {
      type = 'number',
      description = 'Horizontal dimension of the terrain square'
    },
    heightmap = {
      type = 'Image',
      description = [[
        An heightmap image describing the terrain elevation at different points.
        Red channel brightness of each pixel determines the elevation at corresponding coordinates.
      ]]
    },
    stretch = {
      type = 'number',
      description = [[
        A vertical multiplier for heightmap values to obtain terrain height.
        Used for heightmap image formats that have pixel values only in range from 0 to 1.
      ]]
    },
    callback = {
      type = 'function',
      arguments = {
        {
          name = 'x',
          type = 'number'
        },
        {
          name = 'z',
          type = 'number'
        }
      },
      returns = {
        name = 'height',
        type = 'number'
      },
      description = [[
        A function that computes terrain height for set of coordinates. Range of x and z coordinates
        is from `-scale / 2` to `scale / 2`.'
      ]]
    },
    samples = {
      type = 'number',
      description = [[
        Number of samples taken per x and z dimensions. More samples result in higher terrain
        fidelity using more CPU and memory resources.'
      ]],
      default = '100'
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'The new Collider.'
    }
  },
  variants = {
    {
      description = 'Create a flat floor collider',
      arguments = { 'scale' },
      returns = { 'collider' }
    },
    {
      description = 'Create terrain from heightmap image',
      arguments = { 'scale', 'heightmap', 'stretch' },
      returns = { 'collider' }
    },
    {
      description = 'Create terrain defined with a callback function',
      arguments = { 'scale', 'callback', 'samples' },
      returns = { 'collider' }
    }
  },
  related = {
    'Collider',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newSphereCollider',
    'World:newMeshCollider',
    'lovr.data.newImage'
  }
}

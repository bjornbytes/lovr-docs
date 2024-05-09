return {
  tag = 'colliders',
  summary = 'Add a Collider with a TerrainShape to the World.',
  description = [[
    Adds a Collider to the world and attaches a `TerrainShape`.

    Colliders with terrain shapes are immobile and can only be used for static environment objects.
    The collider will be kinematic and forces/velocities will not move it.  Also, these colliders
    will not detect collisions with other kinematic objects.

    TerrainShapes are not treated as solid objects, but instead a collection of triangles.  They do
    not have mass or volume, and there is no concept of being "inside" the terrain.
  ]],
  arguments = {
    scale = {
      type = 'number',
      description = 'The width and depth of the terrain, in meters.'
    },
    heightmap = {
      type = 'Image',
      description = [[
        A heightmap image describing the terrain elevation at different points.  The red channel
        brightness of each pixel determines the elevation at corresponding coordinates.  The image
        must be square and must have one of the formats supported by `Image:getPixel`.
      ]]
    },
    stretch = {
      type = 'number',
      default = '1.0',
      description = [[
        A vertical multiplier for height values to obtain terrain height.  When the image format has
        pixel values only in the 0 to 1 range, this can be used to scale the height to meters.
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
        A function that returns terrain height from x and z coordinates.  The x and z inputs will
        range from `-scale / 2` to `scale / 2`.
      ]]
    },
    samples = {
      type = 'number',
      default = '100',
      description = [[
        The number of samples taken across the x and z dimensions.  More samples will result in
        higher terrain fidelity, but use more CPU and memory.
      ]]
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
      description = 'Create a flat floor collider.',
      arguments = { 'scale' },
      returns = { 'collider' }
    },
    {
      description = 'Create terrain from a heightmap image.',
      arguments = { 'scale', 'heightmap', 'stretch' },
      returns = { 'collider' }
    },
    {
      description = 'Create terrain defined with a callback function.',
      arguments = { 'scale', 'callback', 'samples' },
      returns = { 'collider' }
    }
  },
  related = {
    'Collider',
    'TerrainShape',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newSphereCollider',
    'World:newMeshCollider',
    'lovr.data.newImage'
  }
}

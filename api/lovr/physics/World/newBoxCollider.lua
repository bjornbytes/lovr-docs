return {
  summary = 'Add a Collider with a BoxShape to the World.',
  description = 'Adds a Collider to the world and attaches a `BoxShape`.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the box, in meters.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the box, in meters.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the box, in meters.'
    },
    width = {
      type = 'number',
      default = '1',
      description = 'The width of the box, in meters.'
    },
    height = {
      type = 'number',
      default = 'width',
      description = 'The height of the box, in meters.'
    },
    depth = {
      type = 'number',
      default = 'width',
      description = 'The depth of the box, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the box, in meters.'
    },
    size = {
      type = 'Vec3',
      description = 'The size of the box, in meters.'
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
      arguments = { 'x', 'y', 'z', 'width', 'height', 'depth' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'size' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.
  ]],
  related = {
    'BoxShape',
    'Collider',
    'World:newCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  }
}

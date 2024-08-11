return {
  summary = 'Add a Collider with a SphereShape to the World.',
  description = 'Adds a Collider to the world and attaches a `SphereShape`.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the sphere, in meters.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the sphere, in meters.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the sphere, in meters.'
    },
    radius = {
      type = 'number',
      default = '1',
      description = 'The radius of the sphere, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the sphere, in meters.'
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
      arguments = { 'x', 'y', 'z', 'radius' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'radius' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.
  ]],
  related = {
    'SphereShape',
    'Collider',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  }
}

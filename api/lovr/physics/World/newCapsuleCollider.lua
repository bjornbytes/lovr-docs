return {
  tag = 'colliders',
  summary = 'Add a Collider with a CapsuleShape to the World.',
  description = 'Adds a Collider to the world and attaches a `CapsuleShape`.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the capsule, in meters.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the capsule, in meters.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the capsule, in meters.'
    },
    radius = {
      type = 'number',
      default = '1',
      description = 'The radius of the capsule, in meters.'
    },
    length = {
      type = 'number',
      default = '1',
      description = 'The length of the capsule, not including the caps, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the capsule, in meters.'
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
      arguments = { 'x', 'y', 'z', 'radius', 'length' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position', 'radius', 'length' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.

    The length of the capsule goes along its local Z axis.
  ]],
  related = {
    'CapsuleShape',
    'Collider',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  }
}

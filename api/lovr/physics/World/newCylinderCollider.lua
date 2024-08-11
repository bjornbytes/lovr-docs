return {
  summary = 'Add a Collider with a CylinderShape to the World.',
  description = 'Adds a Collider to the world and attaches a `CylinderShape`.',
  arguments = {
    x = {
      type = 'number',
      default = '0',
      description = 'The x coordinate of the center of the cylinder, in meters.'
    },
    y = {
      type = 'number',
      default = '0',
      description = 'The y coordinate of the center of the cylinder, in meters.'
    },
    z = {
      type = 'number',
      default = '0',
      description = 'The z coordinate of the center of the cylinder, in meters.'
    },
    radius = {
      type = 'number',
      default = '1',
      description = 'The radius of the cylinder, in meters.'
    },
    length = {
      type = 'number',
      default = '1',
      description = 'The length of the cylinder, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the center of the cylinder, in meters.'
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

    The length of the cylinder goes along its local Z axis.
  ]],
  related = {
    'CylinderShape',
    'Collider',
    'World:newCollider',
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  }
}

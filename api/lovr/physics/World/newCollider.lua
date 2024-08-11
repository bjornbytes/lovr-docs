return {
  summary = 'Add a Collider to the World.',
  description = [[
    Adds a new Collider to the World, without attaching any Shapes to it.  Use `Collider:addShape`
    to add shapes.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x position of the Collider.'
    },
    y = {
      type = 'number',
      description = 'The y position of the Collider.'
    },
    z = {
      type = 'number',
      description = 'The z position of the Collider.'
    },
    position = {
      type = 'Vec3',
      description = 'The position of the Collider.'
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
      arguments = { 'x', 'y', 'z' },
      returns = { 'collider' }
    },
    {
      arguments = { 'position' },
      returns = { 'collider' }
    }
  },
  notes = [[
    This will throw an error if there are too many colliders in the world.  The limit defaults to
    16384 and can be changed in `lovr.physics.newWorld`.
  ]],
  example = [[
    function lovr.load()
      world = lovr.physics.newWorld()
      collider = world:newCollider(0, 0, 0)
      shape = lovr.physics.newSphereShape(.5)
      collider:addShape(shape)
    end
  ]],
  related = {
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider',
    'Collider:addShape',
    'Collider',
    'Shape'
  }
}

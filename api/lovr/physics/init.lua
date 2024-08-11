return {
  tag = 'modules',
  summary = 'Simulates 3D physics.',
  description = 'The `lovr.physics` module simulates 3D rigid body physics.',
  sections = {
    {
      name = 'World',
      description = [[
        A World holds all of the objects in a physics simulation.  Use methods like
        `World:newBoxCollider` to add objects to the world.  Call `World:update` each frame to
        advance the physics simulation and calculate new positions for all the colliders.
      ]],
      links = {
        'lovr.physics.newWorld'
      }
    },
    {
      name = 'Colliders',
      description = [[
        A Collider is a single "object" in the physics world.  A Collider has zero or more `Shape`
        objects attached to it, which determine its collision shape.  Colliders can be connected
        together with `Joint` objects.
      ]],
      links = {
        'World:newCollider',
        'World:newBoxCollider',
        'World:newSphereCollider',
        'World:newCapsuleCollider',
        'World:newCylinderCollider',
        'World:newConvexCollider',
        'World:newMeshCollider',
        'World:newTerrainCollider'
      }
    },
    {
      name = 'Shapes',
      description = [[
        Shapes define the collision shape of a collider.  Normally it isn't necessary to create
        shapes manually, instead convenience methods like `World:newSphereCollider` will create a
        collider with a shape attached.
      ]],
      links = {
        'lovr.physics.newBoxShape',
        'lovr.physics.newSphereShape',
        'lovr.physics.newCapsuleShape',
        'lovr.physics.newCylinderShape',
        'lovr.physics.newConvexShape',
        'lovr.physics.newMeshShape',
        'lovr.physics.newTerrainShape'
      }
    },
    {
      name = 'Joints',
      description = [[
        Joints connect colliders together and constrain their movement in various ways.
      ]],
      links = {
        'lovr.physics.newWeldJoint',
        'lovr.physics.newBallJoint',
        'lovr.physics.newConeJoint',
        'lovr.physics.newDistanceJoint',
        'lovr.physics.newHingeJoint',
        'lovr.physics.newSliderJoint'
      }
    }
  }
}

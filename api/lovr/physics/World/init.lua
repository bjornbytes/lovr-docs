return {
  summary = 'An object holding all the colliders and joints in a physics simulation.',
  description = [[
    A World is an object that holds all of the colliders and joints in a physics simulation.

    Be sure to call `World:update` on the World every frame to advance the simulation.
  ]],
  constructor = 'lovr.physics.newWorld',
  sections = {
    {
      name = 'Basics',
      links = {
        'World:update',
        'World:interpolate',
        'World:getGravity',
        'World:setGravity',
        'World:getCallbacks',
        'World:setCallbacks',
        'World:destroy',
        'World:isDestroyed'
      }
    },
    {
      name = 'Queries',
      description = [[
        Queries answer some question about the World, like "do any colliders intersect this line?"
        or "are there any colliders inside this sphere?".  There are 3 types of queries:

        - "cast" tests sweep a shape along a line and figure out which colliders are in its path.
        - "overlap" tests place a shape at a position and figure out which colliders it touches.
        - "query" tests are similar to overlap tests, but they are fast and inexact.  They only
          check the bounding box of a collider, and only support testing against simple shapes.
      ]],
      links = {
        'World:raycast',
        'World:shapecast',
        'World:overlapShape',
        'World:queryBox',
        'World:querySphere'
      }
    },
    {
      name = 'Collision Tags',
      description = [[
        Collision tags are used to ignore collision between certain pairs of colliders.  The list of
        available tags is defined when creating the world, and colliders can be given a tag using
        `Collider:setTag`.
      ]],
      links = {
        'World:getTags',
        'World:disableCollisionBetween',
        'World:enableCollisionBetween',
        'World:isCollisionEnabledBetween'
      }
    },
    {
      name = 'Colliders',
      links = {
        'World:newCollider',
        'World:newBoxCollider',
        'World:newSphereCollider',
        'World:newCapsuleCollider',
        'World:newCylinderCollider',
        'World:newConvexCollider',
        'World:newMeshCollider',
        'World:newTerrainCollider',
        'World:getColliderCount',
        'World:getColliders'
      }
    },
    {
      name = 'Joints',
      links = {
        'World:getJointCount',
        'World:getJoints'
      }
    }
  }
}

return {
  summary = 'Defines the shape of Colliders.',
  description = [[
    A Shape is a physics object that can be attached to colliders to define their shape.
  ]],
  constructors = {
    'lovr.physics.newBoxShape',
    'lovr.physics.newSphereShape',
    'lovr.physics.newCapsuleShape',
    'lovr.physics.newCylinderShape',
    'lovr.physics.newConvexShape',
    'lovr.physics.newMeshShape',
    'lovr.physics.newTerrainShape',
    'World:newBoxCollider',
    'World:newSphereCollider',
    'World:newCapsuleCollider',
    'World:newCylinderCollider',
    'World:newConvexCollider',
    'World:newMeshCollider',
    'World:newTerrainCollider'
  },
  sections = {
    {
      name = 'Basics',
      links = {
        'Shape:getType',
        'Shape:destroy',
        'Shape:isDestroyed',
        'Shape:getCollider',
        'Shape:getUserData',
        'Shape:setUserData'
      }
    },
    {
      name = 'Position',
      links = {
        'Shape:getOffset',
        'Shape:setOffset',
        'Shape:getPosition',
        'Shape:getOrientation',
        'Shape:getPose',
        'Shape:getAABB'
      }
    },
    {
      name = 'Mass',
      links = {
        'Shape:getVolume',
        'Shape:getDensity',
        'Shape:setDensity',
        'Shape:getMass',
        'Shape:getInertia',
        'Shape:getCenterOfMass'
      }
    },
    {
      name = 'Queries',
      links = {
        'Shape:containsPoint',
        'Shape:raycast'
      }
    }
  }
}

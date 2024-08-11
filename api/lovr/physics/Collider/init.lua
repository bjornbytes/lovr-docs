return {
  summary = 'A single object in a physics simulation.',
  description = 'Colliders represent a single rigid body in the physics simulation.',
  constructors = {
    'World:newCollider',
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
      name = 'Motion',
      links = {
        'Collider:getPosition',
        'Collider:setPosition',
        'Collider:getOrientation',
        'Collider:setOrientation',
        'Collider:getPose',
        'Collider:setPose',
        'Collider:getRawPosition',
        'Collider:getRawOrientation',
        'Collider:getRawPose',
        'Collider:getLocalPoint',
        'Collider:getWorldPoint',
        'Collider:getAABB',
        'Collider:getLinearVelocity',
        'Collider:setLinearVelocity',
        'Collider:getAngularVelocity',
        'Collider:setAngularVelocity',
        'Collider:getLinearVelocityFromLocalPoint',
        'Collider:getLinearVelocityFromWorldPoint',
        'Collider:moveKinematic',
        'Collider:applyForce',
        'Collider:applyTorque',
        'Collider:applyLinearImpulse',
        'Collider:applyAngularImpulse',
        'Collider:getLinearDamping',
        'Collider:setLinearDamping',
        'Collider:getAngularDamping',
        'Collider:setAngularDamping',
        'Collider:isKinematic',
        'Collider:setKinematic',
        'Collider:isContinuous',
        'Collider:setContinuous',
        'Collider:getDegreesOfFreedom',
        'Collider:setDegreesOfFreedom',
        'Collider:getGravityScale',
        'Collider:setGravityScale',
        'Collider:isSleepingAllowed',
        'Collider:setSleepingAllowed',
        'Collider:isAwake',
        'Collider:setAwake'
      }
    },
    {
      name = 'Collision',
      links = {
        'Collider:getTag',
        'Collider:setTag',
        'Collider:getShape',
        'Collider:getShapes',
        'Collider:addShape',
        'Collider:removeShape',
        'Collider:isSensor',
        'Collider:setSensor',
        'Collider:getFriction',
        'Collider:setFriction',
        'Collider:getRestitution',
        'Collider:setRestitution'
      }
    },
    {
      name = 'Mass',
      links = {
        'Collider:getMass',
        'Collider:setMass',
        'Collider:getInertia',
        'Collider:setInertia',
        'Collider:getCenterOfMass',
        'Collider:setCenterOfMass',
        'Collider:getAutomaticMass',
        'Collider:setAutomaticMass',
        'Collider:resetMassData'
      }
    },
    {
      name = 'Miscellaneous',
      links = {
        'Collider:getUserData',
        'Collider:setUserData',
        'Collider:isEnabled',
        'Collider:setEnabled',
        'Collider:getWorld',
        'Collider:getJoints',
        'Collider:destroy',
        'Collider:isDestroyed'
      }
    }
  }
}

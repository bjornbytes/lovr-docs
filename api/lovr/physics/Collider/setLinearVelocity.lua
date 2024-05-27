return {
  summary = 'Set the linear velocity of the Collider.',
  description = 'Sets the world-space linear velocity of the center of mass of the Collider.',
  arguments = {
    vx = {
      type = 'number',
      description = 'The x component of the new velocity, in meters per second.'
    },
    vy = {
      type = 'number',
      description = 'The y component of the new velocity, in meters per second.'
    },
    vz = {
      type = 'number',
      description = 'The z component of the new velocity, in meters per second.'
    },
    velocity = {
      type = 'Vec3',
      description = 'The new velocity, in meters per second.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the linear velocity of the collider using numbers.',
      arguments = { 'vx', 'vy', 'vz' },
      returns = {}
    },
    {
      description = 'Set the linear velocity of the collider using a vector.',
      arguments = { 'velocity' },
      returns = {}
    }
  },
  notes = [[
    Although setting the velocity directly is useful sometimes, it can cause problems:

    - Velocity ignores mass, so it can lead to unnaturally sharp changes in motion.
    - If the velocity of a Collider is changed multiple times during a frame, only the last one is
      going to have an effect, nullifying the other velocities that were set.
    - Setting the velocity of a Collider every frame can mess up collisions, since the forces used
      to resolve a collision will get ignored by changing the velocity.

    Using forces and impulses to move Colliders will avoid all of these issues.

    If the Collider is asleep, setting the velocity to a non-zero value will wake it up.

    If the Collider has a tag that was marked as static when the World was created, then the
    Collider can not move and this function will do nothing.

    Currently, velocity is clamped to 500 meters per second to improve stability of the simulation.
  ]],
  related = {
    'Collider:applyForce',
    'Collider:applyLinearImpulse',
    'Collider:getLinearVelocityFromLocalPoint',
    'Collider:getLinearVelocityFromWorldPoint',
    'Collider:getAngularVelocity',
    'Collider:setAngularVelocity',
    'Collider:getPosition',
    'Collider:setPosition'
  }
}

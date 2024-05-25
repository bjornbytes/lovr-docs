return {
  summary = 'Set the angular velocity of the Collider.',
  description = 'Sets the angular velocity of the Collider.',
  arguments = {
    vx = {
      type = 'number',
      description = 'The x component of the angular velocity.'
    },
    vy = {
      type = 'number',
      description = 'The y component of the angular velocity.'
    },
    vz = {
      type = 'number',
      description = 'The z component of the angular velocity.'
    },
    velocity = {
      type = 'Vec3',
      description = 'The angular velocity of the Collider.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Sets the angular velocity of the Collider using numbers.',
      arguments = { 'vx', 'vy', 'vz' },
      returns = {}
    },
    {
      description = 'Sets the angular velocity of the Collider using a vector.',
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

    If the Collider is asleep, setting the angular velocity to a non-zero value will wake it up.

    If the Collider has a tag that was marked as static when the World was created, then the
    Collider can not move and this function will do nothing.
  ]],
  related = {
    'Collider:applyTorque',
    'Collider:applyAngularImpulse',
    'Collider:getLinearVelocity',
    'Collider:setLinearVelocity',
    'Collider:getOrientation',
    'Collider:setOrientation'
  }
}

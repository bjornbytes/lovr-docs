return {
  tag = 'modules',
  summary = 'Simulates 3D physics.',
  description = 'The `lovr.physics` module simulates 3D rigid body physics.',
  sections = {
    {
      name = 'World',
      tag = 'world',
      description = [[
        - Object containing all of the physics objects
        - Usually you just have 1, but sometimes it's useful to have independent universes
        - Once a World is created, you can add colliders to the world and connect em with joints
        - Call World:update each frame to move all the colliders
        - You can issue queries against the world, like raycasts
      ]]
    },
    {
      name = 'Colliders',
      tag = 'colliders',
      description = [[
        - A Collider is a single "object" in the physics simulation
        - A Collider has a "Shape" which determines its collision shape and its mass
        - Colliders collide with other colliders
        - Colliders be moved by applying forces to them
      ]]
    },
    {
      name = 'Shapes',
      tag = 'shapes',
      description = [[
        - Shapes define the collision shape of a collider
        - Normally you don't need to create shapes manually, you can use convenience constructors
        - Use Collider:setShape to change the shape of a collider
        - Multiple Colliders can share a shape
      ]]
    },
    {
      name = 'Joints',
      tag = 'joints',
      description = [[
        - Joints attach colliders together and constrain their movement in various ways.
        - Joints usually have anchor points which is the attachment point on each collider.
        - Joint:getForce/Joint:getTorque is cool
      ]]
    }
  }
}

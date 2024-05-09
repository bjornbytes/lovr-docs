return {
  summary = 'An object holding all the colliders and joints in a physics simulation.',
  description = [[
    - World holds all the physics objects
    - After creating the world, add colliders to it
    - Be sure to update the world with world:update
    - World has lots of settings that can be tweaked when creating the world
  ]],
  constructor = 'lovr.physics.newWorld',
  sections = {
    -- Colliders
    -- Object Lists
    -- Update (:update, :callbacks, :gravity)
    -- Collision Tags
    -- Queries
  }
}

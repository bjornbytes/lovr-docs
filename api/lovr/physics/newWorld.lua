return {
  tag = 'world',
  summary = 'Create a new World.',
  description = [[
    - Creates a new physics world
    - After creating the world, add colliders to it
    - Call :update each frame
  ]],
  arguments = {
    settings = {
      type = 'table',
      description = 'An optional table with settings for the physics simulation.',
      table = {
        {
          name = 'tags',
          type = 'table',
          default = '{}',
          description = [[
            - A list of collision tags (array).
            - Up to 31.
            - Each collider can be given a collision tag.
            - You can ignore collision between certain tags.
          ]]
        },
        {
          name = 'staticTags',
          type = 'table',
          default = '{}',
          description = [[
            - An optional list of collision tags that should be considered 'static'.
            - Any colliders with a static tag will be set to kinematic.
            - Static colliders will also never move.
            - Static tags are managed in a separate broad phase layer, which is good for perf.
          ]]
        },
        {
          name = 'tickRate',
          type = 'number',
          default = '60',
          description = [[
            - How often to update the simulation, in Hz.
            - Higher values increase accuracy but use more CPU.
            - 0 disables fixed timestep
          ]]
        },
        {
          name = 'tickLimit',
          type = 'number',
          default = '0',
          description = [[
            - A limit on the number of physics updates per call to World:update.
            - Can be used to prevent "spiral of death".
            - 0 means no limit
          ]]
        },
        {
          name = 'maxColliders',
          type = 'number',
          default = '16384',
          description = [[
            - Max number of colliders
            - Creating more than this will error
            - Reducing this will use less memory
            - Max max is 2^23 (around 8 million)
          ]]
        },
        {
          name = 'deterministic',
          type = 'boolean',
          default = 'true',
          description = [[
            - Whether the simulation should be deterministic.
            - What deterministic means.
            - Maybe mention that this sorts everything.
            - Disabling will improve performance slightly.
          ]]
        },
        {
          name = 'threadSafe',
          type = 'boolean',
          default = 'true',
          description = [[
            - Whether this World and its Colliders can be used from multiple threads simultaneously.
            - This is achieved by locking the objects whenever reading or writing stuff.
            - Disabling may result in a slight performance gain if you aren't using threads.
          ]]
        },
        {
          name = 'allowSleep',
          type = 'boolean',
          default = 'true',
          description = [[
            - Whether colliders should be allowed to go to sleep when they come to rest.
            - Sleeping colliders aren't processed until something hits them or a force is applied.
            - Sleeping improves performance a lot, recommended to leave it enabled.
          ]]
        },
        {
          name = 'stabilization',
          type = 'number',
          default = '0.2',
          description = [[
            - The amount of stabilization force to apply, 0-1.
            - If the value is too high, physics will behave erratically.
            - If it's too low, objects will be kinda spongy.
            - .2 - .8 is recommended.
          ]]
        },
        {
          name = 'maxPenetration',
          type = 'number',
          default = '.01',
          description = 'The max amount that colliders are allowed to overlap.'
        },
        {
          name = 'minBounceVelocity',
          type = 'number',
          default = '1.0',
          description = [[
            - The minimum velocity, in meters per second, required for collider resitution
            (bounciness) to have an effect.
            - Make it smaller if you want slow-moving colliders to still bounce.
            - But keep in mind that you don't want it too low, otherwise colliders will not come to
              rest as easily.
          ]]
        },
        {
          name = 'velocitySteps',
          type = 'number',
          default = '10',
          description = [[
            - The number of solver velocity iterations to run per tick.
            - Should be at least 2.
            - Bigger values improve accuracy but require more CPU.
          ]]
        },
        {
          name = 'positionSteps',
          type = 'number',
          default = '2',
          description = [[
            - The number of solver position iterations to run per tick.
            - Bigger values improve accuracy but require more CPU.
          ]]
        }
      }
    }
  },
  returns = {
    world = {
      type = 'World',
      description = 'A whole new World.'
    }
  },
  variants = {
    {
      arguments = { 'settings' },
      returns = { 'world' }
    }
  },
  example = {
    -- show creating the world with default settings, so you can copy-paste
    -- maybe another one with a bouncing sphere
  }
}

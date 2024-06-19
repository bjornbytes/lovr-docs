return {
  tag = 'world',
  summary = 'Create a new World.',
  description = 'Creates a new physics World.',
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
            The list of collision tags (strings).  Colliders can be assigned a tag, and collision
            can be enabled and disabled between different tags.  There is a maximum of 31 tags.
          ]]
        },
        {
          name = 'staticTags',
          type = 'table',
          default = '{}',
          description = [[
            An optional list of collision tags that are "static".  Colliders with a static tag will
            not move, and the physics engine uses this for optimization.
          ]]
        },
        {
          name = 'timestep',
          type = 'number',
          default = '1 / 60',
          description = [[
            The physics timestep, or zero to disable fixed timestep.  When fixed timestep is active,
            any time passed to `World:update` will be accumulated, and the physics simulation will
            run only when there's as much time as the fixed timestep.  This decouples the physics
            update rate from the rendering rate, which improves stability. Collider poses will be
            interpolated between the two most recent ticks.  Lower values result in more accurate
            simulation, at the cost of CPU usage.  Use zero to disable fixed timestep and directly
            update the physics simulation when `World:update` is called.
          ]]
        },
        {
          name = 'maxSteps',
          type = 'number',
          default = '0',
          description = [[
            The maximum number of physics steps to run during any given call to `World:update`. This
            can be used to avoid a "spiral of death" where the physics engine can't keep up when a
            large `dt` value is given.  Zero means no limit.
          ]]
        },
        {
          name = 'maxColliders',
          type = 'number',
          default = '16384',
          description = [[
            The maximum number of Colliders in the World.  Increasing this will use more memory.
            This can't be bigger than 2^23 (around 8 million).
          ]]
        },
        {
          name = 'threadSafe',
          type = 'boolean',
          default = 'true',
          description = [[
            Whether the World and the objects it contains can be used from multiple threads.  This
            will use a set of locks to ensure only one thread can access a Collider at a given time.
            Disable this to potentially get a small performance boost when only using the World from
            a single Thread.
          ]]
        },
        {
          name = 'allowSleep',
          type = 'boolean',
          default = 'true',
          description = [[
            Whether colliders should be allowed to go to sleep when they come to rest.  Sleeping
            colliders don't need to simulate movement until something hits them.  This improves
            performance a lot for a typical physics scene where many objects are at rest.
          ]]
        },
        {
          name = 'stabilization',
          type = 'number',
          default = '0.2',
          description = [[
            How quickly the physics engine corrects position error from collisions and joints, from
            0 to 1.  If the value is too low, objects will be spongy, but if it's too high then
            physics will explode.  Values between .2 and .8 are recommended.
          ]]
        },
        {
          name = 'maxPenetration',
          type = 'number',
          default = '.01',
          description = 'The maximum amount that colliders are allowed to overlap, in meters.'
        },
        {
          name = 'restitutionThreshold',
          type = 'number',
          default = '1.0',
          description = [[
            A velocity below which restitution (bounciness) will not be applied, in meters per
            second.  If this is too low then objects may have trouble coming to rest.
          ]]
        },
        {
          name = 'velocitySteps',
          type = 'number',
          default = '10',
          description = [[
            The number of solver velocity iterations to run per tick.  This must be at least 2.
            Larger values will increase accuracy but use more CPU.
          ]]
        },
        {
          name = 'positionSteps',
          type = 'number',
          default = '2',
          description = [[
            The number of solver position iterations to run per tick.  Larger values will increase
            accuracy but use more CPU.
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
  related = {
    'World:update'
  }
}

return {
  summary = 'Interpolate collider poses.',
  description = [[
    Interpolates collider poses between their previous pose and their current pose.  Methods like
    `Collider:getPosition` and `Collider:getOrientation` will return the smoothed values.

    After `World:update` is called, any interpolation is reset and `World:interpolate` will need to
    be called again to recompute the interpolated poses.

    This can be used to decouple the physics tick rate from the rendering rate.  For example, the
    physics simulation can be run at a fixed rate of 30Hz, and collider poses can be interpolated
    before rendering.  This leads to a more stable simulation, and allows the physics rate to be
    increased or decreased as desired, independent of the current display refresh rate.
  ]],
  arguments = {
    alpha = {
      type = 'number',
      description = [[
        The interpolation parameter.  An alpha of zero will use the previous collider pose, an alpha
        of 1.0 will use the latest collider pose, etc.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'alpha' },
      returns = {}
    }
  },
  example = {
    description = 'An example of a fixed timestep physics update.',
    code = [[
      function lovr.load()
        world = lovr.physics.newWorld()
        time = 0
        timestep = 1 / 30 -- 30Hz
      end

      function lovr.update(dt)
        time = time + dt

        -- Update as many times as needed, if any
        while time >= timestep do
          world:update(timestep)
          time = time - timestep

          -- Potentially do per-tick gameplay logic here
          -- like check for collisions or apply impulses
        end

        -- Interpolate the colliders
        local alpha = time / timestep
        world:interpolate(alpha)
      end

      function lovr.draw(pass)
        -- Draw colliders as usual, using `Collider:getPose` etc.
      end
    ]]
  }
}

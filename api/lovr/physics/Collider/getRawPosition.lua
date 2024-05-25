return {
  summary = 'Get the raw position of the Collider, without any interpolation.',
  description = 'Returns the raw position of the Collider, without any interpolation applied.',
  arguments = {},
  returns = {
    x = {
      type = 'number',
      description = 'The x position of the Collider, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position of the Collider, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position of the Collider, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'x', 'y', 'z' }
    }
  },
  notes = [[
    To disable all interpolation, disable fixed timestep by setting the `tickRate` to 0 when
    creating the world.
  ]],
  related = {
    'Collider:getPosition',
    'Collider:setPosition',
    'Collider:getRawOrientation',
    'Collider:getOrientation'
  }
}

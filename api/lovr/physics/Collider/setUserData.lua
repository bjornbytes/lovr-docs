return {
  summary = 'Associate a Lua value with the Collider.',
  description = 'Associates a Lua value with the Collider.',
  arguments = {
    data = {
      type = '*',
      description = 'The custom value to associate with the Collider.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'data' },
      returns = {}
    }
  },
  notes = [[
    Set the user data to `nil` to clear any existing reference.

    The userdata is useful for linking a Collider with custom data:

        local collider = world:raycast(origin, direction, 'enemy')

        if collider then
          -- Get the enemy object from its Collider
          local enemy = collider:getUserData()
          enemy.health = 0
        end

    The user data is not shared between threads.  Each thread has its own user data for the
    Collider.
  ]],
  related = {
    'Shape:getUserData',
    'Shape:setUserData',
    'Joint:getUserData',
    'Joint:setUserData'
  }
}

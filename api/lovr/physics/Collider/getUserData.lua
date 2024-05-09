return {
  summary = 'Return the Lua value associated with the Collider.',
  description = 'Returns the Lua value associated with the Collider.',
  arguments = {},
  returns = {
    data = {
      type = '*',
      description = 'The custom value associated with the Collider.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'data' }
    }
  },
  notes = [[
    The userdata is useful for linking a Collider with custom data:

        local collider = world:raycast(origin, direction, 'enemy')

        if collider then
          -- Get the enemy object from its Collider
          local enemy = collider:getUserData()
          enemy.health = 0
        end

    The user data is not shared between threads.  Each thread has its own user data for the
    Collider.
  ]]
}

return {
  summary = 'Associate a Lua value with the Shape.',
  description = 'Associates a Lua value with the Shape.',
  arguments = {
    data = {
      type = '*',
      description = 'The custom value to associate with the Shape.'
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

    The user data is not shared between threads.  Each thread has its own user data for the Shape.
  ]],
  related = {
    'Collider:getUserData',
    'Collider:setUserData',
    'Joint:getUserData',
    'Joint:setUserData'
  }
}

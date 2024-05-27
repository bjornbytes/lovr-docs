return {
  summary = 'Associate a Lua value with the Joint.',
  description = 'Associates a Lua value with the Joint.',
  arguments = {
    data = {
      type = '*',
      description = 'The custom value to associate with the Joint.'
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

    The user data is not shared between threads.  Each thread has its own user data for the Joint.
  ]],
  related = {
    'Collider:getUserData',
    'Collider:setUserData',
    'Shape:getUserData',
    'Shape:setUserData'
  }
}

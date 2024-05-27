return {
  summary = 'Get the Lua value associated with the Joint.',
  description = 'Returns the Lua value associated with the Joint.',
  arguments = {},
  returns = {
    data = {
      type = '*',
      description = 'The custom value associated with the Joint.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'data' }
    }
  },
  notes = [[
    The user data is not shared between threads.  Each thread has its own user data for the Joint.
  ]],
  related = {
    'Collider:getUserData',
    'Collider:setUserData',
    'Shape:getUserData',
    'Shape:setUserData'
  }
}

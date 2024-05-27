return {
  summary = 'Get the Lua value associated with the Shape.',
  description = 'Returns the Lua value associated with the Shape.',
  arguments = {},
  returns = {
    data = {
      type = '*',
      description = 'The custom value associated with the Shape.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'data' }
    }
  },
  notes = [[
    The user data is not shared between threads.  Each thread has its own user data for the Shape.
  ]],
  related = {
    'Collider:getUserData',
    'Collider:setUserData',
    'Joint:getUserData',
    'Joint:setUserData'
  }
}

return {
  summary = 'Get the World\'s collision callbacks.',
  description = [[
    - Returns the callbacks assigned to the World.
    - The callbacks are described in more detail on `World:setCallbacks`.
  ]],
  arguments = {},
  returns = {
    callbacks = {
      type = 'table',
      description = 'The World collision callbacks.',
      table = {
        {
          name = 'filter',
          type = 'function | nil',
          description = 'The function used to filter collisions.'
        },
        {
          name = 'enter',
          type = 'function | nil',
          description = 'The function called when 2 colliders start touching.'
        },
        {
          name = 'exit',
          type = 'function | nil',
          description = 'The function called when 2 colliders stop touching.'
        },
        {
          name = 'contact',
          type = 'function | nil',
          description = 'The function called every frame while 2 colliders are in contact.'
        }
      }
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'callbacks' }
    }
  }
}

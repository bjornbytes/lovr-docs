return {
  summary = 'Set the World\'s collision callbacks.',
  description = [[
    Assigns collision callbacks to the world.

    - They are
      - filter: filters collisions
      - start: called when colliders start touching
      - end: called when colliders stop touching
      - contact: called each frame while colliders are touching, with detailed contact info
    - World:update must be called from the thread that assigns the callbacks.
  ]],
  arguments = {
    callbacks = {
      type = 'table',
      description = 'The World collision callbacks.',
      table = {
        {
          name = 'filter',
          type = 'function',
          description = 'The function to use to filter collisions.'
        },
        {
          name = 'enter',
          type = 'function',
          description = 'The function to call when 2 colliders start touching.'
        },
        {
          name = 'exit',
          type = 'function',
          description = 'The function to call when 2 colliders stop touching.'
        },
        {
          name = 'contact',
          type = 'function',
          description = 'The function to call every frame while 2 colliders are in contact.'
        }
      }
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'callbacks' }
      returns = {},
    }
  }
}

return {
  tag = 'callbacks',
  summary = 'Called when a key is pressed.',
  description = 'This callback is called when a key is pressed.',
  arguments = {
    key = {
      type = 'KeyCode',
      description = 'The key that was pressed.'
    },
    scancode = {
      type = 'number',
      description = 'The id of the key (ignores keyboard layout, may vary between keyboards).'
    },
    isrepeat = {
      type = 'boolean',
      description = 'Whether the event is the result of a key repeat instead of an actual press.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'key', 'scancode', 'isrepeat' },
      returns = {}
    }
  },
  notes = [[
    By default this will be fired only once while a key is held down. This can be changed to fire
    multiple times by setting `lovr.system.setKeyRepeat` to true. In that case `isrepeat` will become
    true whenever the event is the result of a key repeat and false on a single press.
  ]],
  related = {
    'lovr.system.wasKeyPressed',
    'lovr.keyreleased',
    'lovr.textinput',
    'lovr.system.isKeyDown'
  }
}

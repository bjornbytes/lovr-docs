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
  related = {
    'lovr.system.wasKeyPressed',
    'lovr.keyreleased',
    'lovr.textinput',
    'lovr.system.isKeyDown'
  }
}

return {
  tag = 'callbacks',
  summary = 'Called when a key is released.',
  description = 'This callback is called when a key is released.',
  arguments = {
    key = {
      type = 'KeyCode',
      description = 'The key that was released.'
    },
    scancode = {
      type = 'number',
      description = 'The id of the key (ignores keyboard layout, may vary between keyboards).'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'key', 'scancode' },
      returns = {}
    }
  },
  related = {
    'lovr.system.wasKeyReleased',
    'lovr.keypressed',
    'lovr.textinput',
    'lovr.system.isKeyDown'
  }
}

return {
  tag = 'callbacks',
  summary = 'Called when text has been entered.',
  description = [[
    This callback is called when text has been entered.

    For example, when `shift + 1` is pressed on an American keyboard, `lovr.textinput` will be
    called with `!`.
  ]],
  arguments = {
    text = {
      type = 'string',
      description = 'The UTF-8 encoded character.'
    },
    code = {
      type = 'number',
      description = 'The integer codepoint of the character.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'text', 'code' },
      returns = {}
    }
  },
  notes = [[
    Some characters in UTF-8 unicode take multiple bytes to encode.  Due to the way Lua works, the
    length of these strings will be bigger than 1 even though they are just a single character.  The
    `utf8` library included with LÖVR can be used to manipulate UTF-8 strings.  `Pass:text` will
    also correctly handle UTF-8.
  ]],
  related = {
    'lovr.keypressed',
    'lovr.keyreleased'
  }
}

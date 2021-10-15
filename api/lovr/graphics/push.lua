return {
  summary = 'Push state onto a stack.',
  description = 'TODO',
  arguments = {
    {
      name = 'stack',
      type = 'StackType',
      default = [['transform']],
      description = 'The type of stack to push.'
    }
  },
  returns = {},
  notes = [[
    TODO stack balancing/error
  ]],
  related = {
    'lovr.graphics.pop',
    'StackType'
  }
}

return {
  tag = 'transform',
  summary = 'Push state onto a stack.',
  description = 'TODO',
  arguments = {
    stack = {
      type = 'StackType',
      default = [['transform']],
      description = 'The type of stack to push.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'stack' },
      returns = {}
    }
  },
  notes = [[
    TODO stack balancing/error
  ]],
  related = {
    'lovr.graphics.pop',
    'StackType'
  }
}

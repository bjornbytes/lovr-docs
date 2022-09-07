return {
  tag = 'transform',
  summary = 'Restore original state from a stack.',
  description = 'TODO',
  arguments = {
    stack = {
      type = 'StackType',
      default = [['transform']],
      description = 'The type of stack to pop.'
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
    'lovr.graphics.push',
    'StackType'
  }
}

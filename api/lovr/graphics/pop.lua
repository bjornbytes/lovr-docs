return {
  summary = 'Restore original state from a stack.',
  description = 'TODO',
  arguments = {
    {
      name = 'stack',
      type = 'StackType',
      default = [['transform']],
      description = 'The type of stack to pop.'
    }
  },
  returns = {},
  related = {
    'lovr.graphics.push',
    'StackType'
  }
}

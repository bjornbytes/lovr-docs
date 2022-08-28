return {
  summary = 'Get a Pass that renders to the headset.',
  description = 'TODO',
  arguments = {},
  returns = {
    pass = {
      type = 'Pass',
      description = 'The Pass.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'pass' }
    }
  },
  related = {
    'lovr.graphics.getPass',
    'lovr.conf'
  }
}

return {
  tag = 'headset-misc',
  summary = 'Check if the headset is "mounted" (worn on a head).',
  description = [[
    Returns whether the headset is mounted.  Usually this uses a proximity sensor on the headset to
    detect whether someone is wearing the headset.
  ]],
  arguments = {},
  returns = {
    mounted = {
      type = 'boolean',
      description = 'Whether the headset is mounted.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'mounted' }
    }
  },
  related = {
    'lovr.mount',
    'lovr.headset.isFocused',
    'lovr.headset.isVisible'
  }
}

return {
  tag = 'callbacks',
  summary = 'Called when the headset is put on or taken off.',
  description = 'The `lovr.mount` callback is called when the headset is put on or taken off.',
  arguments = {
    mounted = {
      type = 'boolean',
      description = 'Whether the headset is mounted.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'mounted' },
      returns = {}
    }
  },
  related = {
    'lovr.headset.isMounted'
  }
}

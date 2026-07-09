return {
  tag = 'headset-misc',
  summary = 'Get the name of the OpenXR runtime.',
  description = 'Returns the name of the OpenXR runtime.',
  arguments = {},
  returns = {
    runtime = {
      type = 'string',
      description = 'The name of the VR runtime, e.g. `SteamVR/OpenXR`.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'runtime' }
    }
  },
  notes = [[
    You should probably only use this for informational/logging purposes.  It's brittle to use the
    runtime name to change behavior, since runtimes can change and new ones might get released in
    the future.  It's better to use `lovr.headset.getFeatures` to check if individual features are
    supported.
  ]],
  related = {
    'lovr.headset.getName'
  }
}

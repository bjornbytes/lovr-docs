return {
  tag = 'controller-models',
  summary = 'Get a list of model keys.',
  description = [[
    Returns a list of model keys.  Use model keys to create models with `lovr.headset.newModel`.
    There is no correspondence between a model key and a particular `Device`.

    The `lovr.modelschanged` event will be called when the list of model keys changes, providing the
    opportunity to create models for any new keys that appear and destroy models for keys that are
    no longer present.
  ]],
  arguments = {},
  returns = {
    keys = {
      type = '{lightuserdata}',
      description = 'A list of model keys.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'keys' }
    }
  },
  related = {
    'lovr.headset.newModel',
    'lovr.modelschanged'
  }
}

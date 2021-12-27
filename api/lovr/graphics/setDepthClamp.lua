return {
  tag = 'pipeline',
  summary = 'Enable or disable depth clamp.',
  description = 'TODO',
  arguments = {
    {
      name = 'enable',
      type = 'boolean',
      description = 'Whether depth clamp should be enabled.'
    }
  },
  returns = {},
  notes = 'TODO depthClamp feature!',
  related = {
    'lovr.graphics.setDepthTest',
    'lovr.graphics.setDepthWrite',
    'lovr.graphics.setDepthOffset'
  }
}

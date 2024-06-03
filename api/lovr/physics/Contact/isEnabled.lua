return {
  summary = 'Check if the Contact is enabled.',
  description = [[
    Returns whether the Contact is enabled.  Disabled contacts do not generate any collision
    response.  Use `Contact:setEnabled` to disable a contact to selectively ignore certain
    collisions.
  ]],
  arguments = {},
  returns = {
    enabled = {
      type = 'boolean',
      description = 'Whether the Contact is enabled.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'enabled' }
    }
  },
  related = {
    'Collider:isEnabled',
    'Collider:setEnabled',
    'World:setCallbacks'
  }
}

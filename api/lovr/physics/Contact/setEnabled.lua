return {
  summary = 'Enable or disable the Contact.',
  description = [[
    Enables or disables the Contact.  Disabled contacts do not generate any collision response.
  ]],
  arguments = {
    enable = {
      type = 'boolean',
      description = 'Whether the Contact should be enabled.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  notes = [[
    Note that this is the slowest way to ignore a collision.  Faster ways to disable collisions (in
    increasing order of speed) are:

    - The `filter` callback in `World:setCallbacks`
    - Disabling collision between tags with `World:disableCollisionBetween`
    - Removing the collider from the World completely with `Collider:setEnabled`
  ]]
}

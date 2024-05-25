return {
  summary = 'Set the enabled translation/rotation axes.',
  description = 'Set the axes that are enabled for translation and rotation.',
  arguments = {
    translation = {
      type = 'string',
      description = [[
        A string containing the world-space axes the Collider is allowed to move on.  The string
        should have 'x', 'y', and 'z' letters representing the axes to enable.  Use nil or an empty
        string to disable all translation.
      ]]
    },
    rotation = {
      type = 'string',
      description = [[
        A string containing the world-space axes the Collider is allowed to rotate on.  The string
        should have 'x', 'y', and 'z' letters representing the axes to enable.  Use nil or an empty
        string to disable all rotation.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'translation', 'rotation' },
      returns = {}
    }
  },
  notes = [[
    The default state is `xyz` for both translation and rotation.

    The physics engine does not support disabling all axes.  At least one translation or rotation
    axis needs to be enabled.  To disable all movement for a collider, make it kinematic.

    When all translation axes are disabled, `Collider:getMass` will return 0.

    When all rotation axes are disabled, `Collider:getInertia` will return zero/identity.
  ]]
}

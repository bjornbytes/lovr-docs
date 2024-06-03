return {
  summary = 'Get the enabled translation/rotation axes.',
  description = 'Get the degrees of freedom of the Collider.',
  arguments = {},
  returns = {
    translation = {
      type = 'string',
      description = [[
        A string containing the world-space axes the Collider is allowed to move on.  The string
        will have 'x', 'y', and 'z' letters representing which axes are enabled.  If no axes are
        enabled then it will be an empty string.
      ]]
    },
    rotation = {
      type = 'string',
      description = [[
        A string containing the world-space axes the Collider is allowed to rotate around.  The
        string will have 'x', 'y', and 'z' letters representing which axes are enabled.  If no axes
        are enabled then it will be an empty string.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'translation', 'rotation' }
    }
  },
  notes = [[
    The default state is `xyz` for both translation and rotation.

    The physics engine does not support disabling all degrees of freedom.  At least one translation
    or rotation axis needs to be enabled.  To disable all movement for a collider, make it
    kinematic.
  ]]
}

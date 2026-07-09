return {
  tag = 'sourceEffects',
  summary = 'Set the volume cone of the Source.',
  description = [[
    Sets the directional volume cone of the source.  The cone is defined by three values:
    `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is within `innerAngle` of the
    source's direction, the volume won't be changed.  Otherwise, the volume will start to decrease,
    reaching a minimum of `outerVolume` once the listener is at `outerAngle` radians from the
    direction of the source.
  ]],
  arguments = {
    innerAngle = {
      type = 'number',
      description = 'The inner cone angle, in radians.'
    },
    outerAngle = {
      type = 'number',
      description = 'The outer cone angle, in radians.'
    },
    outerVolume = {
      type = 'number',
      description = 'The outer volume factor.'
    },
    enable = {
      type = 'boolean?',
      description = [[
        Whether the volume cone should be enabled.  Passing `true` will set a default cone with an
        `innerAngle` of `0`, an `outerAngle` of `math.pi`, and an `outerVolume` of `0`.  Falsy
        values disable the cone completely (equivalent to 0, 0, 1).
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'innerAngle', 'outerAngle', 'outerVolume' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  notes = [[
    When a Source is created, its `innerAngle` is `0`, its `outerAngle` is `0`, and its
    `outerVolume` is `1` (no cone effect).
  ]],
  related = {
    'Source:getFalloff',
    'Source:setFalloff',
    'Source:setOrientation'
  }
}

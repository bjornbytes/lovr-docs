return {
  tag = 'sourceEffects',
  summary = 'Get the volume cone of the Source.',
  description = [[
    Returns the directional volume cone of the source.  The cone is defined by three values:
    `innerAngle`, `outerAngle`, and `outerVolume`.  If the listener is within `innerAngle` of the
    source's direction, the volume won't be changed.  Otherwise, the volume will start to decrease,
    reaching a minimum of `outerVolume` once the listener is at `outerAngle` radians from the
    direction of the source.
  ]],
  arguments = {},
  returns = {
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
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'innerAngle', 'outerAngle', 'outerVolume' }
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

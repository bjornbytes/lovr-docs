return {
  tag = 'sourceEffects',
  summary = 'Set the volume falloff of the Source.',
  description = [[
    Sets the volume falloff of the Source, causing it to get quieter as it gets further away from
    the listener.
  ]],
  arguments = {
    minDistance = {
      type = 'number',
      description = 'The distance at which the volume will start to decrease.'
    },
    minVolume = {
      type = 'number',
      description = [[
        The minimum volume for the falloff.  For example, .25 would clamp the falloff to 25% of the
        source's volume.  Note that other effects like cone and occlusion can still decrease the
        volume further.  The falloff volume factor gets combined (multiplied) with other volume
        factors.
      ]]
    },
    enable = {
      type = 'boolean?',
      description = [[
        Whether volume falloff should be enabled.  Passing `true` will set a default falloff with a
        `minDistance` of `0` and a `minVolume` of `0`.  Falsy values disable falloff completely
        by setting the minVolume to `1`.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'minDistance', 'minVolume' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  notes = [[
    The formula for falloff is:

        if distance > minDistance then
          volume = volume * math.max(minVolume, 1 / (1 + distance - minDistance))
        end
  ]],
  related = {
    'Source:getCone',
    'Source:setCone',
    'Source:setPosition'
  }
}

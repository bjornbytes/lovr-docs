return {
  tag = 'sourceEffects',
  summary = 'Get the volume falloff of the Source.',
  description = [[
    Returns the volume falloff of the Source, which causes it to get quieter as it gets further away
    from the listener.
  ]],
  arguments = {},
  returns = {
    minDistance = {
      type = 'number',
      description = 'The distance at which the volume starts to decrease.'
    },
    minVolume = {
      type = 'number',
      description = [[
        The minimum volume for the falloff.  For example, .25 clamps the falloff to 25% of the
        source's volume.  Note that other effects like cone and occlusion can still decrease the
        volume further.  The falloff volume factor gets combined (multiplied) with other volume
        factors.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'minDistance', 'minVolume' }
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

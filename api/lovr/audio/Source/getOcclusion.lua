return {
  tag = 'sourceEffects',
  summary = 'Get the occlusion settings for the Source.',
  description = [[
    Returns the occlusion settings for the Source.  Occlusion makes sources quieter when there is an
    `AudioMesh` blocking the path between the source and the listener.
  ]],
  arguments = {},
  returns = {
    rays = {
      type = 'number',
      description = [[
        The number of rays used to trace the path between the source and the listener.  0 means
        occlusion is disabled, 1 will result in basic occlusion, and more rays can be used to
        support partial occlusion for large objects.  Typical values would be between 0 and 16.
      ]]
    },
    transmissionRays = {
      type = 'number',
      description = [[
        The number of rays used to compute transmission.  Transmission allows *some* audio to pass
        through walls, based on the `AudioMaterial` of the objects between the source and the
        listener.  This is usually between 0 and 4.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'rays', 'transmissionRays' }
    }
  },
  notes = 'Occlusion is disabled by default.',
  related = {
    'Source:getRadius',
    'Source:setRadius'
  }
}

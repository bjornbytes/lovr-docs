return {
  tag = 'sourceEffects',
  summary = 'Set the occlusion settings for the Source.',
  description = [[
    Sets the occlusion settings for the Source.  Occlusion makes sources quieter when there is an
    `AudioMesh` blocking the path between the source and the listener.
  ]],
  arguments = {
    rays = {
      type = 'number',
      description = [[
        The number of rays used to trace the path between the source and the listener.  0 means
        occlusion is disabled, 1 will result in basic occlusion, and more rays can be used to
        support partial occlusion for large objects.  Typical values would be between 0 and 64.
      ]]
    },
    transmissionRays = {
      type = 'number',
      description = [[
        The number of rays used to compute transmission.  Transmission allows *some* audio to pass
        through walls, based on the `AudioMaterial` of the objects between the source and the
        listener.  This is usually between 0 and 4.
      ]]
    },
    enable = {
      type = 'boolean?',
      description = [[
        Whether occlusion should be enabled.  Passing `true` is shorthand for `64` and `4`, and
        falsy values will disable occlusion by settings `rays` to `0`.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'rays', 'transmissionRays' },
      returns = {}
    },
    {
      arguments = { 'enable' },
      returns = {}
    }
  },
  related = {
    'Source:getRadius',
    'Source:setRadius',
    'AudioMesh'
  }
}

return {
  summary = 'Set the minimum and maximum distance.',
  description = 'Sets the minimum and maximum distance allowed between the Colliders.',
  arguments = {
    min = {
      type = 'number',
      default = '0',
      description = [[
        The minimum distance, in meters.  The Colliders won't be able to get closer than this.
      ]]
    },
    max = {
      type = 'number',
      default = 'min',
      description = [[
        The maximum distance, in meters.  The Colliders won't be able to get further than this.
      ]]
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'min', 'max' },
      returns = {}
    },
    {
      description = [[
        Remove the limits, setting the minimum distance to zero and the maximum distance to
        infinity.
      ]],
      arguments = {},
      returns = {}
    }
  },
  notes = 'The limits default to the distance between the Colliders when the Joint was created.'
}

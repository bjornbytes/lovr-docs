return {
  summary = 'Get the minimum and maximum distance.',
  description = 'Returns the minimum and maximum distance allowed between the Colliders.',
  arguments = {},
  returns = {
    min = {
      type = 'number',
      description = [[
        The minimum distance, in meters.  The Colliders won't be able to get closer than this.
      ]]
    },
    max = {
      type = 'number',
      description = [[
        The maximum distance, in meters.  The Colliders won't be able to get further than this.
      ]]
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'min', 'max' }
    }
  },
  notes = 'The limits default to the distance between the Colliders when the Joint was created.'
}

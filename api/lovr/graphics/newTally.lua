return {
  tag = 'graphics-objects',
  summary = 'Create a new Tally.',
  description = 'TODO',
  arguments = {
    {
      name = 'type',
      type = 'TallyType',
      description = 'The type of the Tally, which controls what "thing" it measures.'
    },
    {
      name = 'count',
      type = 'number',
      description = 'The number of slots in the Tally.  Each slot performs one measurement.'
    },
    {
      name = 'views',
      type = 'number',
      default = '2',
      description = [[
        Tally objects with the `time` type can only be used in render passes with a certain number
        of views.  This is ignored for other types of tallies.
      ]]
    }
  },
  returns = {
    {
      name = 'tally',
      type = 'Tally',
      description = 'The new Tally.'
    }
  },
  related = {
    'Pass:tick',
    'Pass:tock'
  }
}

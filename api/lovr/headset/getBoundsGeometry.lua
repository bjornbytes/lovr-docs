return {
  tag = 'playArea',
  summary = 'Get a list of points that make up the play area boundary.',
  description = 'Returns a list of points representing the boundaries of the play area.',
  arguments = {},
  returns = {
    {
      name = 'points',
      type = 'table',
      description = [[
        A list of points representing the play area.  Each point is a table consisting of an x, y,
        and z coordinate.
      ]]
    }
  }
}

return {
  tag = 'playArea',
  summary = 'Get whether the chaperone is currently visible.',
  description = [[
    Returns whether or not the boundary indicator is visible, indicating that the user is near the
    edge of the play area.
  ]],
  arguments = {},
  returns = {
    {
      name = 'isVisible',
      type = 'boolean',
      description = 'Whether or not the bounds are visible.'
    }
  }
}

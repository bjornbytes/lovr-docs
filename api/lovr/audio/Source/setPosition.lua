return {
  tag = 'sourceEffects',
  summary = 'Set the position of the Source.',
  description = [[
    Sets the position of the Source.  Setting the position will cause the Source to be spatialized
    based on its position relative to the listener.
  ]],
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the position.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the position.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the position.'
    },
    position = {
      type = 'vector',
      description = 'The position.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the position using numbers.',
      arguments = { 'x', 'y', 'z' },
      returns = {}
    },
    {
      description = 'Set the position using a vector.',
      arguments = { 'position' },
      returns = {}
    }
  },
  notes = [[
    The position doesn't have any defined units, but meters are used by convention.

    Ambisonic sources ignore their position, because they are omnidirectional.
  ]],
  related = {
    'Source:setOrientation',
    'Source:setPose'
  }
}

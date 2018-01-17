return {
  summary = 'Draw the Skybox.',
  description = 'Draws the Skybox at a specified angle.',
  arguments = {
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians to rotate the skybox around its axis of rotation'
    },
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  returns = {},
  notes = [[
    To prevent problems with the depth test, make sure you draw Skyboxes before drawing other
    things, or disable the depth test while drawing them.
  ]]
}

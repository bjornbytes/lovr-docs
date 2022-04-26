return {
  tag = 'drawing',
  summary = 'Draw a line.',
  description = 'TODO',
  arguments = {
    x1 = {
      type = 'number',
      description = 'The x coordinate of the first point.'
    },
    y1 = {
      type = 'number',
      description = 'The y coordinate of the first point.'
    },
    z1 = {
      type = 'number',
      description = 'The z coordinate of the first point.'
    },
    x2 = {
      type = 'number',
      description = 'The x coordinate of the next point.'
    },
    y2 = {
      type = 'number',
      description = 'The y coordinate of the next point.'
    },
    z2 = {
      type = 'number',
      description = 'The z coordinate of the next point.'
    },
    t = {
      type = 'table',
      description = 'A table of numbers or Vec3 objects (not both) representing points of the line.'
    },
    v1 = {
      type = 'Vec3',
      description = 'A vector containing the position of the first point of the line.'
    },
    v2 = {
      type = 'Vec3',
      description = 'A vector containing the position of the next point on the line.'
    },
    ['...'] = {
      type = '*',
      description = 'More points to add to the line.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x1', 'y1', 'z1', 'x2', 'y2', 'z2', '...' },
      returns = {}
    },
    {
      arguments = { 't' },
      returns = {}
    },
    {
      arguments = { 'v1', 'v2', '...' },
      returns = {}
    }
  },
  notes = 'TODO material, mesh, attributes'
}

return {
  tag = 'drawing',
  summary = 'Draw points.',
  description = 'TODO',
  arguments = {
    x = {
      type = 'number',
      description = 'The x coordinate of the first point.'
    },
    y = {
      type = 'number',
      description = 'The y coordinate of the first point.'
    },
    z = {
      type = 'number',
      description = 'The z coordinate of the first point.'
    },
    t = {
      type = 'table',
      description = 'A table of numbers or Vec3 objects (not both) representing point positions.'
    },
    v = {
      type = 'Vec3',
      description = 'A vector containing the position of the first point to draw.'
    },
    ['...'] = {
      type = '*',
      description = 'More points.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'x', 'y', 'z', '...' },
      returns = {}
    },
    {
      arguments = { 't' },
      returns = {}
    },
    {
      arguments = { 'v', '...' },
      returns = {}
    }
  },
  notes = 'TODO material, mesh, attributes'
}

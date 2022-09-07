return {
  tag = 'drawing',
  summary = 'Draw a cube.',
  description = 'Draws a cube.',
  arguments = {
    transform = {
      type = 'Mat4',
      description = [[
        The transform of the cube.  Can also be provided as position, scale, and rotation using a
        mix of `Vectors` or numbers.  When using numbers for the scale, 1 number is used.
      ]]
    },
    style = {
      type = 'DrawStyle',
      default = [['fill']],
      description = 'Whether the cube should be drawn filled or outlined.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'transform', 'style' },
      returns = {}
    }
  },
  notes = 'The local origin is in the center of the cube.'
}

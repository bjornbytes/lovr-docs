return {
  tag = 'pipeline',
  summary = 'Change the color components affected by drawing.',
  description = 'TODO',
  arguments = {
    r = {
      type = 'boolean',
      description = 'Whether the red component should be affected by drawing.'
    },
    g = {
      type = 'boolean',
      description = 'Whether the green component should be affected by drawing.'
    },
    b = {
      type = 'boolean',
      description = 'Whether the blue component should be affected by drawing.'
    },
    a = {
      type = 'boolean',
      description = 'Whether the alpha component should be affected by drawing.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'r', 'g', 'b', 'a' },
      returns = {}
    }
  },
  notes = 'TODO'
}

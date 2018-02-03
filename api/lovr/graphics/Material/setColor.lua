return {
  summary = 'Set a color property of the Material.',
  description = [[
    Sets a color property for a Material.  Different types of colors are supported for different
    lighting parameters.  Color channels should be from 0.0 to 1.0. Colors default to white and are
    gamma corrected as necessary, see `lovr.graphics.isGammaCorrect` for more info on that.
  ]],
  arguments = {
    colorType = {
      type = 'MaterialColor',
      default = [['diffuse']],
      description = 'The type of color to get.'
    },
    r = {
      type = 'number',
      description = 'The red component of the color.'
    },
    g = {
      type = 'number',
      description = 'The green component of the color.'
    },
    b = {
      type = 'number',
      description = 'The blue component of the color.'
    },
    a = {
      type = 'number',
      default = '1.0',
      description = 'The alpha component of the color.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'colorType', 'r', 'g', 'b', 'a' },
      returns = {}
    },
    {
      arguments = { 'r', 'g', 'b', 'a' },
      returns = {}
    }
  },
  related = {
    'MaterialColor',
    'lovr.graphics.setColor'
  }
}

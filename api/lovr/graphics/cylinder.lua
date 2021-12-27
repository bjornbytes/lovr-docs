return {
  tag = 'drawing',
  summary = 'Draw a cylinder.',
  description = 'TODO',
  arguments = {
    {
      name = 'transform',
      type = 'transformxy2',
      description = 'The transform to apply to the cylinder.'
    },
    {
      name = 'detail',
      type = 'number',
      default = '4',
      description = 'A detail value from 0 to 6.'
    },
    {
      name = 'capped',
      type = 'boolean',
      default = 'true',
      description = 'Whether the top and bottom of the tube should be rendered.'
    }
  },
  returns = {},
  notes = 'TODO material'
}

return {
  tag = 'pipeline',
  summary = 'Set the material.',
  description = [[
    Sets the material.  This will apply to most drawing, except for text, skyboxes, and models,
    which use their own materials.
  ]],
  arguments = {
    material = {
      type = 'Material',
      description = 'The material to use for drawing.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'material' },
      returns = {}
    },
    {
      description = 'Use the default material.',
      arguments = {},
      returns = {}
    }
  }
}

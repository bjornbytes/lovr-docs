return {
  tag = 'graphicsObjects',
  summary = 'Create a new Animator.',
  description = 'Creates a new `Animator` by reading animations from a `Model`.',
  arguments = {
    {
      name = 'model',
      type = 'Model',
      description = 'The model to read animations from.'
    }
  },
  returns = {
    {
      name = 'animator',
      type = 'Animator',
      description = 'The new Animator.'
    }
  },
  notes = [[
    You can attach an animator to a Model with `Model:setAnimator`.
  ]],
  related = {
    'Model:setAnimator'
  }
}

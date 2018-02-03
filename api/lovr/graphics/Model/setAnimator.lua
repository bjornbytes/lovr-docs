return {
  summary = 'Attach an Animator to the Model.',
  description = [[
    Attaches an `Animator` to the Model.  When attached, the animator will alter the pose of the bones
    of the model based on the set of playing animations.
  ]],
  arguments = {
    {
      name = 'animator',
      type = 'Animator',
      description = 'The Animator to attach.'
    }
  },
  returns = {},
  related = {
    'lovr.graphics.newAnimator'
  }
}

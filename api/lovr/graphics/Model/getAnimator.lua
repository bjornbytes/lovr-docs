return {
  summary = 'Get the Animator attached to the Model.',
  description = [[
    Returns the `Animator` attached to the Model.  When attached, the animator will alter the pose
    of the bones of the model based on the set of playing animations.
  ]],
  arguments = {},
  returns = {
    {
      name = 'animator',
      type = 'Animator',
      description = 'The Animator attached to the Model, or `nil` if none is set.'
    }
  },
  related = {
    'lovr.graphics.newAnimator'
  }
}

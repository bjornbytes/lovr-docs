return {
  summary = 'Set the priority of an animation, used for mixing.',
  description = 'Sets the priority of an animation.',
  arguments = {
    {
      name = 'name',
      type = 'string',
      description = 'The name of the animation.'
    },
    {
      name = 'priority',
      type = 'number',
      description = 'The new priority for the animation.'
    }
  },
  returns = {},
  notes = [[
    The priority controls the order that multiple playing animations get blended together.
    Animations with a lower priority will get applied first, and animations with higher priority
    will get layered on top afterwards.  If two or more animations have the same priority, they
    could get applied in any order.  All animations start with a priority of 1.

    You can use priority and alpha to control how different animations blend together.  For
    instance, if you have a character with "throw" and "walk" animations and both of them key the
    bones in the arm, you could have the character walk and throw at the same time by giving the
    "throw" animation a higher priority and playing it over the walk animation.
  ]],
  related = {
    'Animator:getAlpha',
    'Animator:setAlpha'
  }
}

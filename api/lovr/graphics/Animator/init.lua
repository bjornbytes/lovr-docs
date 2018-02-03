return {
  summary = 'An object that plays and mixes animations.',
  description = [[
    An animator is an object that controls the playback of skeletal animations.  Animators can be
    attached to models using `Model:setAnimator`.  Once attached, the Model will render using the
    animator's pose instead of the default pose.  Don't forget to update the animator in
    `lovr.update` using `Animator:update`!
  ]],
  constructors = {
    'lovr.graphics.newAnimator'
  },
  example = [[
    function lovr.load()
      model = lovr.graphics.newModel('model.fbx')
      animator = lovr.graphics.newAnimator(model)
      animator:play(animator:getAnimationNames()[1])
      model:setAnimator(animator)
    end

    function lovr.update(dt)
      animator:update(dt)
    end

    function lovr.draw()
      model:draw()
    end
  ]]
}

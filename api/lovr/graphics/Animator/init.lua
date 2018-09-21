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
  notes = [[
    Animations require that you multiply vertices by a special pose matrix in your vertex shader:

        vec4 vertex(mat4 projection, mat4 transform, vec4 vertex) {
          return projection * transform * lovrPoseMatrix * vertex;
        }
  ]],
  example = [=[
    function lovr.load()
      model = lovr.graphics.newModel('model.fbx')
      animator = lovr.graphics.newAnimator(model)
      animator:play(animator:getAnimationNames()[1])
      model:setAnimator(animator)

      shader = lovr.graphics.newShader([[
        vec4 vertex(mat4 projection, mat4 transform, vec4 vertex) {
          return projection * transform * lovrPoseMatrix * vertex;
        }
      ]], nil)
    end

    function lovr.update(dt)
      animator:update(dt)
    end

    function lovr.draw()
      lovr.graphics.setShader(shader)
      model:draw()
    end
  ]=]
}

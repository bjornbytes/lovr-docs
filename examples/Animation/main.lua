--[[
  Model by StrykerDoesAnimation
  https://sketchfab.com/models/e8ca2615b4304c3bacb780b0685d8a05
  CC Attribution
]]

function lovr.load()
  model = lovr.graphics.newModel('scytha/scene.gltf')
  animator = lovr.graphics.newAnimator(model)
  animation = animator:getAnimationNames()[1]
  assert(animation, 'No animation found!')
  animator:play(animation)
  animator:setLooping(animation, true)
  model:setAnimator(animator)

  shader = lovr.graphics.newShader([[
    vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
      return projection * transform * lovrPoseMatrix * vertex;
    }
  ]], nil)
end

function lovr.update(dt)
  animator:update(dt)
end

function lovr.draw()
  lovr.graphics.setShader(shader)
  model:draw(0, 0, -4, .2)
  lovr.graphics.setShader()
end

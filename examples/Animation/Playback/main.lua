--[[
  Model by StrykerDoesAnimation
  https://sketchfab.com/models/e8ca2615b4304c3bacb780b0685d8a05
  CC Attribution
]]

function lovr.load()
  model = lovr.graphics.newModel('scytha/scene.gltf')
end

function lovr.draw(pass)
  model:animate(1, lovr.headset.getTime())
  pass:draw(model, 0, 0, -4, .2)
end

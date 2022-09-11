-- Note: Wireframe rendering doesn't work in browsers

function lovr.load()
  model = lovr.graphics.newModel('suzanne.obj')
end

function lovr.draw(pass)
  pass:setShader('normal')
  pass:draw(model, 0, 1.7, -3, 1, lovr.headset.getTime() * .25)
end

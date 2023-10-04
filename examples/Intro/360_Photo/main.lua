local skybox

function lovr.load()
  skybox = lovr.graphics.newTexture('equirectangular.jpg')
end

function lovr.draw(pass)
  pass:skybox(skybox)
end

local skybox

function lovr.load()
  skybox = lovr.graphics.newTexture('equirectangular.jpg', { mipmaps = false })
end

function lovr.draw(pass)
  pass:skybox(skybox)
end

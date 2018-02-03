local skybox

function lovr.load()
  skybox = lovr.graphics.newTexture('equirectangular.jpg')
end

function lovr.draw()
  local angle, x, y, z = lovr.headset.getOrientation()
  lovr.graphics.skybox(skybox, -angle, x, y, z)
end

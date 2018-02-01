local skybox

function lovr.load()
  skybox = lovr.graphics.newSkybox('equirectangular.jpg')
end

function lovr.draw()
  local angle, x, y, z = lovr.headset.getOrientation()
  skybox:draw(-angle, x, y, z)
end

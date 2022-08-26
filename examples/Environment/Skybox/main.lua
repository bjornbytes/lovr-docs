-- Texture from Humus (www.humus.name)

function lovr.load()
  cube = lovr.graphics.newTexture({
    left = 'negx.jpg',
    right = 'posx.jpg',
    top = 'posy.jpg',
    bottom = 'negy.jpg',
    front = 'negz.jpg',
    back = 'posz.jpg'
  })
end

function lovr.draw(pass)
  pass:skybox(cube)
end

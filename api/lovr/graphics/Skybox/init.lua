return {
  summary = 'A cube wrapped around the camera, used as a 3D background.',
  description = [[
    A Skybox is a collection of six images used to apply a background to a three dimensional scene.
    Each image is used to texture the face of a cube, and the cube is drawn around the camera,
    giving an illusion of a 360-degree background.
  ]],
  constructor = 'lovr.graphics.newSkybox',
  notes = [[
    To prevent problems with the depth test, make sure you draw Skyboxes before drawing other
    things, or disable the depth test while drawing them.
  ]],
  example = {
    description = 'Drawing a Skybox in VR:',
    code = [[
      function lovr.load()
        skybox = lovr.graphics.newSkybox({
          '1.png',
          '2.png',
          '3.png',
          '4.png',
          '5.png',
          '6.png'
        })
      end

      function lovr.draw()
        lovr.graphics.setColor(255, 255, 255)
        skybox:draw(lovr.headset.getOrientation())

        -- Draw everything else
      end
    ]]
  }
}

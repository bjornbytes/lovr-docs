return {
  summary = 'An offscreen render target.',
  description = [[
    A Canvas is also known as a framebuffer or render-to-texture.  It allows you to render to an
    offscreen canvas instead of directly to the screen.  This lets you postprocess or transform the
    results later before finally rendering them to the screen.

    Canvases extend Textures, so Canvases can be used as textures in materials or rendered as
    fullscreen quads just like textures can, and they inherit all Texture functions.
  ]],
  constructors = {
    'lovr.graphics.newCanvas'
  },
  example = {
    description = 'Apply a postprocessing effect (wave) using a Canvas and a fragment shader.',
    code = [=[
      function lovr.load()
        lovr.graphics.setBackgroundColor(.1, .1, .1)
        canvas = lovr.graphics.newCanvas(lovr.headset.getDisplayDimensions())

        wave = lovr.graphics.newShader([[
          vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
            return vertex;
          }
        ]], [[
          uniform float time;
          vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
            uv.x += sin(uv.y * 10 + time * 4) * .01;
            uv.y += cos(uv.x * 10 + time * 4) * .01;
            return graphicsColor * lovrDiffuseColor * vertexColor * texture(image, uv);
          }
        ]])
      end

      function lovr.update(dt)
        wave:send('time', lovr.timer.getTime())
      end

      function lovr.draw(eye)
        -- Render the scene to the canvas instead of the headset.
        canvas:renderTo(function()
          lovr.graphics.clear()
          local size = 5
          for i = 1, size do
            for j = 1, size do
              for k = 1, size do
                lovr.graphics.setColor(i / size, j / size, k / size)
                local x, y, z = i - size / 2, j - size / 2, k - size / 2
                lovr.graphics.cube('fill', x, y, z, .5)
              end
            end
          end
        end)

        -- Render the canvas to the headset using a shader.
        lovr.graphics.setColor(1, 1, 1)
        lovr.graphics.setShader(wave)
        lovr.graphics.plane(canvas)
        lovr.graphics.setShader()
      end
    ]=]
  }
}

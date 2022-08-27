-- Renders a side-by-side stereo image on a plane, resulting in a 3D effect

function lovr.load()
  sbsTexture = lovr.graphics.newTexture('sbs_left_right.png', { mipmaps = false })
  sbsShader = lovr.graphics.newShader([[
    vec4 lovrmain() {
      return DefaultPosition;
    }
  ]], [[
    vec4 lovrmain() {
      vec2 newUV = clamp(UV, 0., 1.) * vec2(.5, 1.) + vec2(ViewIndex) * vec2(.5, 0.);

      // Use this instead for top-bottom stereo
      // vec2 newUV = clamp(UV, 0., 1.) * vec2(1., .5) + vec2(ViewIndex) * vec2(0., .5);

      return getPixel(ColorTexture, newUV);
    }
  ]])

  lovr.graphics.setBackgroundColor(.05, .05, .05)
end

function lovr.draw(pass)
  pass:setMaterial(sbsTexture)
  pass:setShader(sbsShader)
  pass:plane(0, 1, -2, 2.5, 2)
end

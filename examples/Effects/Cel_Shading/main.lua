function lovr.load()
  shader = lovr.graphics.newShader([[
    vec4 lovrmain() {
      return DefaultPosition;
    }
  ]], [[
    #define BANDS 5.0

    vec4 lovrmain() {
      const vec3 lightDirection = vec3(-1, -1, -1);
      vec3 L = normalize(-lightDirection);
      vec3 N = normalize(Normal);
      float normal = .5 + dot(N, L) * .5;

      vec3 baseColor = Color.rgb * normal;
      vec3 clampedColor = round(baseColor * BANDS) / BANDS;

      return vec4(clampedColor, Color.a);
    }
  ]])
end

function lovr.draw(pass)
  pass:setShader(shader)

  pass:setColor(0, 0, 1)
  pass:sphere(0, 1.7, -1, .15)

  pass:setColor(0, 1, 0)
  pass:sphere(-.4, 1.7, -1, .15)

  pass:setColor(1, 0, 0)
  pass:sphere(.4, 1.7, -1, .15)
end

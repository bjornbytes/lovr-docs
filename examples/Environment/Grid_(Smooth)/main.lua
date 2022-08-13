function lovr.load()
  shader = lovr.graphics.newShader([[
    vec4 lovrmain() {
      return DefaultPosition;
    }
  ]], [[
    const float gridSize = 25.;
    const float cellSize = .5;

    vec4 lovrmain() {
      vec2 uv = UV;

      // Distance-based alpha (1. at the middle, 0. at edges)
      float alpha = 1. - smoothstep(.15, .50, distance(uv, vec2(.5)));

      // Grid coordinate
      uv *= gridSize;
      uv /= cellSize;
      vec2 c = abs(fract(uv - .5) - .5) / fwidth(uv);
      float line = clamp(1. - min(c.x, c.y), 0., 1.);
      vec3 value = mix(vec3(.01, .01, .011), (vec3(.04)), line);

      return vec4(vec3(value), alpha);
    }
  ]], { flags = { highp = true } })

  lovr.graphics.setBackground(.05, .05, .05)
end

function lovr.draw(pass)
  pass:setShader(shader)
  pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)
end

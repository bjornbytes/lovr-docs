shader = lovr.graphics.newShader('unlit', [[
vec4 lovrmain() {
  vec4 color = DefaultColor;

  float fogDistance = distance(PositionWorld, CameraPositionWorld);
  float fogDensity = .05;
  float fogAmount = 1.0 - clamp(exp(-fogDensity * fogDistance), 0.0, 1.0);
  vec3 fogColor = vec3(1, 1, 1);

  color.rgb = mix(color.rgb, fogColor, fogAmount);

  return color;
}
]])

lovr.graphics.setBackgroundColor(1, 1, 1)

function lovr.draw(pass)
  pass:setShader(shader)

  pass:setColor(0, 0, 0)
  pass:plane(0, 0, 0, 100, 100, -math.pi / 2, 1, 0, 0)

  for x = -20, 20 do
    local z = -math.abs(x) - 5
    pass:box(x, 2, z, 1, 5, 1)
  end
end

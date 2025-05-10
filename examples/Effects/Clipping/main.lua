function lovr.load()
  shader = lovr.graphics.newShader([[
    vec4 lovrmain() {
      vec3 planePosition = vec3(0, 1.7, 0);
      vec3 planeNormal = vec3(0, -1, 0);

      ClipDistance[0] = dot(PositionWorld - planePosition, planeNormal);

      return DefaultPosition;
    }
  ]], 'normal')
end

function lovr.draw(pass)
  pass:setShader(shader)
  pass:monkey(0, 1.7, -1, .5, lovr.timer.getTime(), 1, 1, 0)
end


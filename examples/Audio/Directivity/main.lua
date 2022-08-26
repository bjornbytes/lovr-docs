function lovr.load()
  source = lovr.audio.newSource('sine.wav')
  source:setEffectEnabled('spatialization')
  source:setDirectivity(.5, 2.0)
  source:setLooping(true)
  source:setVolume(.8)
  source:play()
end

function lovr.update(dt)
  local x, y, z = 0, 1, -1
  local yaw = lovr.timer.getTime() * 2
  source:setPose(x, y, z, yaw, 0, 1, 0)
  lovr.audio.setPose(lovr.headset.getPose())
end

function lovr.draw(pass)
  if lovr.audio.getSpatializer() ~= 'phonon' then
    pass:text('Warning: phonon spatializer is not active', 0, 1.2, -1, .05)
  end

  shader = shader or lovr.graphics.newShader(
    'unlit',
    [[vec4 lovrmain() {
        vec3 L = vec3(0., 1., 0.);
        vec3 N = normalize(Normal);
        float NoL = dot(N, L) * .5 + .5;
        return vec4(vec3(NoL), 1.);
      }
    ]]
  )
  pass:setShader(shader)

  local radius, length = .03, .05
  local x, y, z, angle, ax, ay, az = source:getPose()

  -- Draw speaker cone
  pass:push()
  pass:translate(x, y, z)
  pass:translate(0, 0, -length)
  pass:rotate(angle + math.pi, ax, ay, az)
  pass:translate(0, 0, length)
  pass:cone(0, 0, 0, radius, length)
  pass:pop()
end

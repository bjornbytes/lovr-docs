-- Skybox is "industrial_pipe_and_valve_01" from PolyHaven (CC0)
-- Assets were generated from the skybox using cmgen from filament:
-- $ ./cmgen --format=png --extract=skybox -s 512 industrial_pipe_and_valve_01_4k.hdr
-- $ ./cmgen --format=ktx -x out industrial_pipe_and_valve_01_4k.hdr

function lovr.load()
  model = lovr.graphics.newModel('DamagedHelmet.glb')

  shader = lovr.graphics.newShader([[
    vec4 lovrmain() {
      return DefaultPosition;
    }
  ]], [[
    var(0) uniform textureCube cubemap;
    var(1) uniform sphericalHarmonics { vec3 sh[9]; };

    vec4 lovrmain() {
      Surface surface;
      initSurface(surface);

      vec3 color = vec3(0);
      vec3 lightDirection = vec3(-1, -1, -1);
      vec4 lightColorAndBrightness = vec4(1, 1, 1, 3);
      float visibility = 1.;
      color += getLighting(surface, lightDirection, lightColorAndBrightness, visibility);
      color += getIndirectLighting(surface, cubemap, sh);

      return vec4(color, 1);
    }
  ]], {
    flags = {
      glow = true,
      normalMap = true,
      vertexTangents = false, -- DamagedHelmet doesn't have vertex tangents
      tonemap = true
    }
  })

  skybox = lovr.graphics.newTexture({
    px = 'skybox/px.png',
    nx = 'skybox/nx.png',
    py = 'skybox/py.png',
    ny = 'skybox/ny.png',
    pz = 'skybox/pz.png',
    nz = 'skybox/nz.png'
  })

  environmentMap = lovr.graphics.newTexture('ibl.ktx')

  sphericalHarmonics = lovr.graphics.newBuffer({
    {  0.611764907836914,  0.599504590034485,  0.479980736970901 },
    {  0.659514904022217,  0.665349841117859,  0.567680120468140 },
    {  0.451633930206299,  0.450751245021820,  0.355226665735245 },
    { -0.044383134692907, -0.053154513239861, -0.019974749535322 },
    { -0.053045745939016, -0.057957146316767, -0.011247659102082 },
    {  0.485697060823441,  0.490428507328033,  0.397530466318130 },
    { -0.023690477013588, -0.024272611364722, -0.021886156871915 },
    { -0.179465517401695, -0.181243389844894, -0.141314014792442 },
    { -0.144527092576027, -0.143508568406105, -0.122757166624069 }
  }, { 'vec3', layout = 'std140' })
end

function lovr.draw(pass)
  pass:setCullMode('back')
  pass:setBlendMode()

  pass:skybox(skybox)

  pass:setShader(shader)
  pass:send('cubemap', skybox)
  pass:send('sphericalHarmonics', sphericalHarmonics)
  pass:draw(model, 0, 1.5, -1.5, .5)
end

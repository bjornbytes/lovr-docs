-- Raytraced Ambient Occlusion
--
-- Each frame, every pixel shoots a ray in a random direction.  Over time, with
-- enough samples, this approximates the ambient occlusion for the scene
--
-- Currently, there is temporal accumulation, but no temporal reprojection and
-- no spatial filtering.  The AO data is cleared whenever the camera moves, which
-- makes this example unsuitable for dynamic scenes or VR (TODO!)

-- The ambient occlusion textures can have a different resolution than the main display
local quality = 0.5

-- Can experiment with rg8, rg16, rg16f, and rg32f to store the AO data with different precision
local format = 'rg16'

function lovr.load()
  lovr.graphics.setBackgroundColor(.5, .5, .5)

  -- A basic shader that applies the value from the ambient occlusion texture to the object
  renderShader = lovr.graphics.newShader('unlit', [[
    uniform texture2DArray occlusionTexture;

    vec4 lovrmain() {
      vec4 color = DefaultColor;

      vec2 uv = (FragCoord.xy + .5) / Resolution;
      float occlusion = getPixel(occlusionTexture, uv, ViewIndex).r;

      return vec4(color.rgb * occlusion, color.a);
    }
  ]])

  occlusionShader = lovr.graphics.newShader('unlit', [[
    uniform raytracer tracer;
    uniform texture2DArray historyTexture;

    // https://www.shadertoy.com/view/4djSRW
    vec2 hash23(vec3 p3) {
      p3 = fract(p3 * vec3(.1031, .1030, .0973));
      p3 += dot(p3, p3.yzx + 33.33);
      return fract((p3.xx + p3.yz) * p3.zy);
    }

    vec4 lovrmain() {
      vec3 P = PositionWorld;
      vec3 N = normalize(Normal);

      // We're going to generate a random direction on a hemisphere centered around the vertex normal
      // First we generate 2 random numbers
      // Then we turn this into a cosine-weighted hemisphere direction
      // Then we turn that local direction into world space, using the tangent matrix

      // We "seed" the random generator with this pixel's coordinates and the current time
      vec2 random = hash23(vec3(FragCoord.xy + .5, mod(Time, 10)));

      // Do some math to convert the 2 random numbers into a point on a hemisphere
      float r = sqrt(random.x);
      float theta = 2. * PI * random.y;

      float dx = r * cos(theta);
      float dy = r * sin(theta);
      float dz = sqrt(1. - random.x);

      // The random direction we generated is in "local" space
      // Use the TangentMatrix (derived from UVs) to get it into world space
      vec3 localDirection = vec3(dx, dy, dz);
      vec3 worldDirection = TangentMatrix * localDirection;

      // Now we have all the information we need to make a ray with a random direction
      vec3 rayPos = P + N * .01;
      vec3 rayDir = worldDirection;

      // Shoot a ray!
      rayQueryEXT ray;
      float tmin = .001, tmax = 1e6;
      uint flags = gl_RayFlagsTerminateOnFirstHitEXT;
      rayQueryInitializeEXT(ray, tracer, flags, 0xff, rayPos, tmin, rayDir, tmax);
      rayQueryProceedEXT(ray);

      float occlusion;

      if (rayQueryGetIntersectionTypeEXT(ray, true) == gl_RayQueryCommittedIntersectionNoneEXT) {
        occlusion = 1.;
      } else {
        occlusion = 0.;
      }

      // Read last frame's ambient occlusion data.  The ambient occlusion factor is in the
      // R channel, and G stores the "weight", which decreases over time
      vec2 uv = FragCoord.xy / Resolution;
      vec4 pixel = getPixel(historyTexture, uv, ViewIndex);

      // Accumulate our sample (occlusion) into the history
      float weight = pixel.g / (pixel.g + 1);
      float history = pixel.r + (occlusion - pixel.r) * weight;

      // Write this frame's ambient occlusion data
      return vec4(history, weight, history, 1);
    }
  ]], { flags = { vertexTangents = false } })

  occlusionTextures = {}

  local displayWidth, displayHeight = lovr.headset.getDisplayDimensions()
  local width, height = displayWidth * quality, displayHeight * quality
  local layers = lovr.headset.getViewCount()

  -- The AO data is double-buffered.  The AO pass reads the result from last
  -- frame (#1) and writes the current frame's result (#2)
  for i = 1, 2 do
    occlusionTextures[i] = lovr.graphics.newTexture(width, height, layers, {
      format = format,
      linear = true,
      type = 'array',
      usage = { 'sample', 'render', 'transfer' }
    })

    occlusionTextures[i]:clear(0xffffff)
  end

  occlusionPass = lovr.graphics.newPass()

  -- We do a depth prepass for the AO pass to ensure that only 1 ray is traced per pixel
  occlusionDepthTexture = lovr.graphics.newTexture(width, height, layers, { format = 'd32f' })
  occlusionPrepass = lovr.graphics.newPass({ depth = occlusionDepthTexture, samples = 1 })

  -- Raytracer only works with Mesh and Model right now, so we make a Mesh to add to the Raytracer
  -- It needs to have UVs (or tangents) because the AO pass uses TangentMatrix
  cube = lovr.graphics.newMesh({
    { -.5, -.5, -.5;  0,  0, -1;  0, 0 },
    { -.5,  .5, -.5;  0,  0, -1;  0, 1 },
    {  .5, -.5, -.5;  0,  0, -1;  1, 0 },
    {  .5,  .5, -.5;  0,  0, -1;  1, 1 },
    {  .5,  .5, -.5;  1,  0,  0;  0, 1 },
    {  .5,  .5,  .5;  1,  0,  0;  1, 1 },
    {  .5, -.5, -.5;  1,  0,  0;  0, 0 },
    {  .5, -.5,  .5;  1,  0,  0;  1, 0 },
    {  .5, -.5,  .5;  0,  0,  1;  0, 0 },
    {  .5,  .5,  .5;  0,  0,  1;  0, 1 },
    { -.5, -.5,  .5;  0,  0,  1;  1, 0 },
    { -.5,  .5,  .5;  0,  0,  1;  1, 1 },
    { -.5,  .5,  .5; -1,  0,  0;  0, 1 },
    { -.5,  .5, -.5; -1,  0,  0;  1, 1 },
    { -.5, -.5,  .5; -1,  0,  0;  0, 0 },
    { -.5, -.5, -.5; -1,  0,  0;  1, 0 },
    { -.5, -.5, -.5;  0, -1,  0;  0, 0 },
    {  .5, -.5, -.5;  0, -1,  0;  1, 0 },
    { -.5, -.5,  .5;  0, -1,  0;  0, 1 },
    {  .5, -.5,  .5;  0, -1,  0;  1, 1 },
    { -.5,  .5, -.5;  0,  1,  0;  0, 1 },
    { -.5,  .5,  .5;  0,  1,  0;  0, 0 },
    {  .5,  .5, -.5;  0,  1,  0;  1, 1 },
    {  .5,  .5,  .5;  0,  1,  0;  1, 0 }
  })

  cube:setIndices({
    1,  2,   3,  3,  2,  4,
    5,  6,   7,  7,  6,  8,
    9,  10, 11, 11, 10, 12,
    13, 14, 15, 15, 14, 16,
    17, 18, 19, 19, 18, 20,
    21, 22, 23, 23, 22, 24
  })

  -- Make a grid of cubes
  cubes = {}

  table.insert(cubes, { 0, -5, 0, 10 })

  for z = -3.5, 3.5 do
    for x = -3.5, 3.5 do
      local size = .7
      table.insert(cubes, { x, size / 2, z, size })
    end
  end

  -- Create a Raytracer and add all the cubes to it
  raytracer = lovr.graphics.newRaytracer(#cubes)

  for i, data in ipairs(cubes) do
    local x, y, z, scale = unpack(data)
    raytracer:add(cube, x, y, z, scale)
  end

  -- Don't forget to build the Raytracer!
  raytracer:build()
end

function lovr.update(dt)
  -- Clear the ambient occlusion data when the camera moves.  This doesn't work well in VR yet...
  if lovr.system.isKeyDown('w', 'a', 's', 'd', 'q', 'e') or lovr.system.isMouseDown(1) or lovr.headset.isActive() then
    occlusionTextures[1]:clear(0xffffff)
    occlusionTextures[2]:clear(0xffffff)
  end
end

local function setCameras(pass)
  for i = 1, lovr.headset.getViewCount() do
    pass:setViewPose(i, lovr.headset.getViewPose(i))
    pass:setProjection(i, 'asymmetric', lovr.headset.getViewAngles(i))
  end
end

local function drawScene(pass)
  for i, data in ipairs(cubes) do
    local x, y, z, scale = unpack(data)
    pass:draw(cube, x, y, z, scale)
  end
end

function lovr.draw(pass)
  -- First: record a depth prepass for the ambient occlusion pass.  Pre-filling the depth buffer
  -- ensures that at most one ray is traced per pixel during the ambient occlusion pass
  occlusionPrepass:reset()
  setCameras(occlusionPrepass)
  drawScene(occlusionPrepass)

  -- Second: The ambient occlusion pass.  This shoots a ray in a random direction for each pixel,
  -- accumulating the results in an ambient occlusion texture
  occlusionPass:setCanvas({ occlusionTextures[2], depth = occlusionDepthTexture, samples = 1 })
  occlusionPass:setClear({ [1] = false, depth = false })
  occlusionPass:setDepthTest('equal')
  occlusionPass:setDepthWrite(false)
  occlusionPass:setShader(occlusionShader)
  occlusionPass:send('tracer', raytracer)
  occlusionPass:send('historyTexture', occlusionTextures[1])
  setCameras(occlusionPass)
  drawScene(occlusionPass)

  -- Third: render the scene to the main pass, applying the ambient occlusion factor
  pass:setShader(renderShader)
  pass:send('occlusionTexture', occlusionTextures[2])
  drawScene(pass)

  -- Debug mode for viewing the AO texture
  if lovr.system.isKeyDown('`') or lovr.headset.isDown('left', 'trigger') or lovr.headset.isDown('right', 'trigger') then
    pass:setShader()
    pass:fill(occlusionTextures[2])
  end

  -- Flip the double buffered AO textures
  occlusionTextures[1], occlusionTextures[2] = occlusionTextures[2], occlusionTextures[1]

  -- Submit all 3 passes
  return lovr.graphics.submit(occlusionPrepass, occlusionPass, pass)
end

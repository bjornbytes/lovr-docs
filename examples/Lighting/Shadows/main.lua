--[[
  Example of basic shadow mapping in LÖVR
  Ben Porter, 2022
]]

local z = -2
local light_pos = lovr.math.newVec3(3.0, 4.0, z)
local light_orthographic = false -- Use orthographic light
local shadow_map_size = 2048

local debug_render_from_light = false -- Enable to render scene from light
local debug_show_shadow_map = false -- Enable to view shadow map in overlap

local shader, render_texture
local shadow_map_texture, shadow_map_sampler
local light_space_matrix

local function render_scene(pass)
  local t = lovr.timer.getTime()

  pass:push()
  pass:setColor(0xCBC1AD)
  pass:circle(0, 0, z, 5, -math.pi / 2, 1, 0, 0, 'fill', 0, 2 * math.pi, 256)

  local count = 2
  local min, max = -(count - 1) / 2, (count - 1) / 2
  pass:setColor(0xEEEEEE)
  pass:translate(0, -min + .55, z)
  for i = min, max do
    for j = min, max do
      for k = min, max do
        pass:push()
        pass:translate(i, j, k)
        pass:rotate(t + i * 0.3 + j * 0.3, 1, 1, 1)
        pass:scale(0.45)
        if i + j % 2 == 1 then
          pass:box()
        else
          pass:scale(0.7)
          pass:sphere()
        end
        pass:pop()
      end
    end
  end
  pass:pop()
end

local function lighting_shader()
  local vs = [[
    vec4 lovrmain() {
      return Projection * View * Transform * VertexPosition;
    }
  ]]

  local fs = [[
    Constants {
      vec3 lightPos;
      mat4 lightSpaceMatrix;
      bool lightOrthographic;
    };

    layout(set = 2, binding = 0) uniform texture2D shadowMapTexture;

    vec4 diffuseLighting(vec3 lightDir, vec3 normal, float shadow) {
      float diff = max(dot(normal, lightDir), 0.0);
      vec4 diffuse = diff * vec4(1.0, 1.0, 0.8, 1.0);
      vec4 baseColor = Color * getPixel(ColorTexture, UV);
      vec4 ambience = vec4(0.05, 0.05, 0.1, 1.0);
      return baseColor * (ambience + (1 - shadow) * diffuse);
    }

    // Falloff shadow near edge of light bounds/frustum
    float shadowFalloff(vec2 uv) {
      const float margin = 0.05;
      uv = clamp(uv, vec2(0,0), vec2(1,1));
      float dx = 1;
      if (uv.x < margin) dx = uv.x / margin;
      else if (uv.x > 1 - margin) dx = ( 1 - uv.x ) / margin;
      float dy = 1;
      if (uv.y < margin) dy = uv.y / margin;
      else if (uv.y > 1 - margin) dy = ( 1 - uv.y ) / margin;
      return dx * dy;
    }

    vec4 lovrmain() {
      vec3 lightDir = normalize(lightPos - PositionWorld);
      vec3 normal = normalize(Normal);
      vec4 positionLightSpace = lightSpaceMatrix * vec4(PositionWorld, 1);
      vec3 positionLightSpaceProj = 0.5 * (positionLightSpace.xyz / positionLightSpace.w) + 0.5;
      vec4 shadowMap = getPixel(shadowMapTexture, positionLightSpaceProj.xy);
      float closestDepth = shadowMap.r * 0.5 + 0.5;
      float currentDepth = positionLightSpaceProj.z;
      float bias = max(0.05 * (1.0 - dot(normal, lightDir)), 0.005);
      float falloff = shadowFalloff(positionLightSpaceProj.xy);
      float shadow;
      if (lightOrthographic) {
        shadow = ((currentDepth - bias) >= closestDepth) ? 1.0 : 0.0;
      } else {
        shadow = ((currentDepth + bias) <= closestDepth) ? 1.0 : 0.0;
      }
      return diffuseLighting(lightDir, normal, falloff * shadow);
    }
  ]]

  return lovr.graphics.newShader(vs, fs, {})
end

local function render_shadow_map(draw)
  local shadow_map_pass
  if debug_render_from_light then
    shadow_map_pass = lovr.graphics.getPass('render', { shadow_map_texture, samples = 1 })
  else
    shadow_map_pass = lovr.graphics.getPass('render', {
      depth = { texture = shadow_map_texture, clear = light_orthographic and 1 or 0 }, samples = 1
    })
  end

  local near_plane = 2
  local projection
  if light_orthographic then
    local radius = 3
    local far_plane = 15
    projection = mat4():orthographic(-radius, radius, -radius, radius, near_plane, far_plane)
  else
    projection = mat4():perspective(math.pi / 3, 1, near_plane)
  end

  local view = mat4():lookAt(light_pos, vec3(0, 1, z))

  light_space_matrix = mat4(projection):mul(view)

  shadow_map_pass:setProjection(1, projection)
  shadow_map_pass:setViewPose(1, view, true)
  if light_orthographic then
    -- Note for ortho projection with a far plane the depth coord is reversed
    shadow_map_pass:setDepthTest('lequal')
  end

  if debug_render_from_light then
    shadow_map_pass:setShader(shader)
    shadow_map_pass:send('lightPos', light_pos)
  end

  draw(shadow_map_pass)

  return shadow_map_pass
end

local function render_lighting_pass(draw)
  local lighting_pass = lovr.graphics.getPass('render', { render_texture, samples = 1 })

  local t = lovr.timer.getTime()
  if lovr.headset then
    for i = 1, lovr.headset.getViewCount() do
      lighting_pass:setViewPose(i, lovr.headset.getViewPose(i))
      lighting_pass:setProjection(i, lovr.headset.getViewAngles(i))
    end
  else
    lighting_pass:setViewPose(1, 0, 3 - math.sin(t * 0.1), 4, -math.pi / 8, 1, 0, 0)
  end

  lighting_pass:setShader(shader)
  lighting_pass:setSampler(shadow_map_sampler)
  lighting_pass:send('shadowMapTexture', shadow_map_texture)
  lighting_pass:send('lightPos', light_pos)
  lighting_pass:send('lightSpaceMatrix', light_space_matrix)
  lighting_pass:send('lightOrthographic', light_orthographic)
  draw(lighting_pass)
  lighting_pass:setShader()

  lighting_pass:setColor(1, 1, 1, 1)
  lighting_pass:sphere(light_pos, 0.1)

  return lighting_pass
end

local function debug_passes(pass)
  pass:setDepthWrite(false)

  if debug_render_from_light then
    pass:fill(shadow_map_texture)
  else
    pass:fill(render_texture)
    if debug_show_shadow_map then
      -- Render shadow map in overlay
      local width, height = lovr.system.getWindowDimensions()
      pass:setViewport(0, 0, width / 4, height / 4)
      pass:fill(shadow_map_texture)
    end
  end
end

function lovr.load(args)
  shader = lighting_shader()
  lovr.graphics.setBackgroundColor(0x4782B3)

  local shadow_map_format = debug_render_from_light and 'rgba8' or 'd32f'

  shadow_map_texture = lovr.graphics.newTexture(shadow_map_size, shadow_map_size, {
    format = shadow_map_format,
    linear = false,
    mipmaps = false
  })

  shadow_map_sampler = lovr.graphics.newSampler({ wrap = 'clamp' })

  if lovr.headset then
    local width, height = lovr.headset.getDisplayDimensions()
    local layers = lovr.headset.getViewCount()
    render_texture = lovr.graphics.newTexture(width, height, layers, { mipmaps = false })
  else
    local width, height = lovr.system.getWindowDimensions()
    render_texture = lovr.graphics.newTexture(width, height, 1, { mipmaps = false })
  end
end

function lovr.update(dt)
  local t = lovr.timer.getTime()
  light_pos.x = 3 * math.cos(t * 0.4)
  light_pos.z = 3 * math.sin(t * 0.4) + z
end

function lovr.draw(pass)
  local shadow_map_pass = render_shadow_map(render_scene)
  local lighting_pass = render_lighting_pass(render_scene)

  debug_passes(pass)

  return lovr.graphics.submit({ shadow_map_pass, lighting_pass, pass })
end

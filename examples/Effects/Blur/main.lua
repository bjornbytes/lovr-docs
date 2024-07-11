-- This demo renders a scene to a canvas, then renders the canvas to screen filtered through a shader.
--
-- Sample contributed by andi mcc

local applyBlur = true -- Set this to false to see the scene with no postprocessing.

-- For the fragment shader: We are going to create a separable gaussian blur.
-- A "separable" blur means we first blur horizontally, then blur vertically to get a 2D blur.
local blurShader = [[
  // This one-dimensional blur filter samples five points and averages them by different amounts.
  // Weights and offsets taken from http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/

  // The weights for the center, one-point-out, and two-point-out samples
  #define WEIGHT0 0.2270270270
  #define WEIGHT1 0.3162162162
  #define WEIGHT2 0.0702702703

  // The distances-from-center for the samples
  #define OFFSET1 1.3846153846
  #define OFFSET2 3.2307692308

  Constants {
    // This constant will be set every draw to determine whether we are sampling horizontally or vertically.
    vec2 direction;
  };

  // The texture to sample from.
  layout(set = 2, binding = 0) uniform texture2DArray sourceTexture;

  // lovr's shader architecture will automatically supply a main(), which will call this lovrmain() function
  vec4 lovrmain() {
    vec2 uvOffset = direction / Resolution.xy; // Convert the offset from pixels to UVs
    vec4 color = vec4(0.0);
    color += getPixel(sourceTexture, UV, ViewIndex) * WEIGHT0;
    color += getPixel(sourceTexture, UV + uvOffset * OFFSET1, ViewIndex) * WEIGHT1;
    color += getPixel(sourceTexture, UV - uvOffset * OFFSET1, ViewIndex) * WEIGHT1;
    color += getPixel(sourceTexture, UV + uvOffset * OFFSET2, ViewIndex) * WEIGHT2;
    color += getPixel(sourceTexture, UV - uvOffset * OFFSET2, ViewIndex) * WEIGHT2;
    return color;
  }
]]

-- The vertex and fragment shaders will be combined together into a shader program
local screenShader

-- Image of an eyechart
local eyechart

-- This table will contain two textures we will use as scratch space
local tempTexture

function lovr.load()
  -- Load the eyechart image
  -- Source: https://www.publicdomainpictures.net/view-image.php?image=244244&picture=eye-chart-test-vintage
  -- Creative Commons 0 / Public Domain license
  local texture = lovr.graphics.newTexture('eye-chart-test-vintage-cc0.jpg')
  local textureWidth, textureHeight = texture:getDimensions()

  eyechart = {
    scale = .75,
    aspect = textureHeight / textureWidth,
    texture = texture
  }

  -- Configure the objects needed for the blur
  if applyBlur then
    local width, height = lovr.headset.getDisplayDimensions()
    local layers = lovr.headset.getViewCount()

    -- Compile the shader
    screenShader = lovr.graphics.newShader('fill', blurShader)

    -- Create two temporary textures
    tempTexture = {
      lovr.graphics.newTexture(width, height, layers, { mipmaps = false }),
      lovr.graphics.newTexture(width, height, layers, { mipmaps = false })
    }

    -- Make a clamping sampler (clampler, get it?) to prevent blurred
    -- pixels from wrapping around the edges
    clampler = lovr.graphics.newSampler({ wrap = 'clamp' })
  end
end

-- The scene is drawn in this callback
local function sceneDraw(pass)
  -- Draw text on the left and right
  for _, sign in ipairs { -1, 1 } do
    pass:push()
    pass:rotate(sign * math.pi / 2, 0, 1, 0)
    pass:text('MOVE CLOSER', 0, 0, -10, 5)
    pass:pop()
  end

  -- Draw the eye chart
  pass:setMaterial(eyechart.texture)
  pass:plane(0, 1.7, -1, eyechart.scale, eyechart.scale * eyechart.aspect)
end

-- This simple function is used to render a render pass that
-- draws one texture onto another with the blur shader
local function fullScreenDraw(source, destination, blurSize)
  local pass = lovr.graphics.newPass({ destination, depth = false, samples = 1 })
  pass:setSampler(clampler)
  pass:setShader(screenShader)
  pass:send('sourceTexture', source)
  pass:send('direction', blurSize)
  pass:fill()
  return pass
end

function lovr.draw(pass)
  if not applyBlur then
    -- No-postprocessing path: Call scene-draw callback without doing anything fancy
    sceneDraw(pass)
  else
    local passes = {}

    -- Start by drawing the scene to one of our temp textures.
    local scene = lovr.graphics.newPass(tempTexture[1])

    -- Make the scene pass use the same cameras as the headset
    for i = 1, pass:getViewCount() do
      scene:setViewPose(i, pass:getViewPose(i))
      scene:setProjection(i, pass:getProjection(i, mat4()))
    end

    sceneDraw(scene)

    table.insert(passes, scene)

    -- We now have the scene in a texture, which means we can apply a full-screen effect by
    -- rendering the texture with a shader. However, because our blur is separable,
    -- we will need to do this twice, once for horizontal blur and once for vertical.
    -- We would also like to do multiple blur passes at larger and larger scales, to get a blurrier blur.
    -- To achieve these many passes we will render from texture 1 into 2, and then 2 back into 1, and repeat.

    table.insert(passes, fullScreenDraw(tempTexture[1], tempTexture[2], { 1, 0 }))
    table.insert(passes, fullScreenDraw(tempTexture[2], tempTexture[1], { 0, 1 }))

    table.insert(passes, fullScreenDraw(tempTexture[1], tempTexture[2], { 2, 0 }))
    table.insert(passes, fullScreenDraw(tempTexture[2], tempTexture[1], { 0, 2 }))

    table.insert(passes, fullScreenDraw(tempTexture[1], tempTexture[2], { 4, 0 }))
    table.insert(passes, fullScreenDraw(tempTexture[2], tempTexture[1], { 0, 4 }))

    -- Finally, draw the blurred texture to the main display
    pass:fill(tempTexture[1])

    table.insert(passes, pass)

    return lovr.graphics.submit(passes)
  end
end

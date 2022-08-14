-- This demo renders a scene to a canvas, then renders the canvas to screen filtered through a shader.
--
-- Sample contributed by andi mcc

local useCanvas = true -- Set this to false to see the scene with no postprocessing.

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

  // The Canvas texture to sample from.
  layout(set = 2, binding = 0) uniform texture2DArray canvas;

  // lovr's shader architecture will automatically supply a main(), which will call this lovrmain() function
  vec4 lovrmain() {
    vec2 uvOffset = direction / Resolution.xy; // Convert the offset from pixels to UVs
    vec4 color = vec4(0.0);
    color += getPixel(canvas, UV, ViewIndex) * WEIGHT0;
    color += getPixel(canvas, UV + uvOffset * OFFSET1, ViewIndex) * WEIGHT1;
    color += getPixel(canvas, UV - uvOffset * OFFSET1, ViewIndex) * WEIGHT1;
    color += getPixel(canvas, UV + uvOffset * OFFSET2, ViewIndex) * WEIGHT2;
    color += getPixel(canvas, UV - uvOffset * OFFSET2, ViewIndex) * WEIGHT2;
    return color;
  }
]]

-- The vertex and fragment shaders will be combined together into a shader program
local screenShader

-- Image of an eyechart
local eyechart

-- This table will contain two canvases we will use as scratch space
local tempCanvas

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

  -- Configure the shader
  if useCanvas then
    local width, height = lovr.headset.getDisplayDimensions()

    -- Compile the shader
    screenShader = lovr.graphics.newShader('fill', blurShader)

    -- Create two temporary canvases
    tempCanvas = {
      lovr.graphics.newCanvas(width, height),
      lovr.graphics.newCanvas(width, height)
    }
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

  pass:setMaterial(eyechart.texture)
  pass:plane(0, 1.7, -1, eyechart.scale, eyechart.scale * eyechart.aspect)
  pass:setMaterial()
end

-- This simple callback is used to draw one canvas onto another
local function fullScreenDraw(pass, source)
  screenShader:send('canvas', source:getTexture())
  pass:fill()
end

function lovr.draw(pass)
  if not useCanvas then

    -- No-postprocessing path: Call scene-draw callback without doing anything fancy
    sceneDraw(pass)

  else

    -- Start by drawing the scene to one of our temp canvases.
    tempCanvas[1]:renderTo(sceneDraw)
    tempCanvas[2]:renderTo(function() lovr.graphics.clear() end)

    -- We now have the scene in a texture (a canvas), which means we can apply a full-screen effect
    -- by rendering the texture with a shader material. However, because our blur is separable,
    -- we will need to do this twice, once for horizontal blur and once for vertical.
    -- We would also like to do multiple blur passes at larger and larger scales, to get a blurrier blur.
    -- To achieve these many passes we will render from canvas A into B, and then B back into A, and repeat.
    lovr.graphics.setShader(screenShader)

    pass:send("direction", {1, 0})
    tempCanvas[2]:renderTo(fullScreenDraw, tempCanvas[1])

    pass:send("direction", {0, 1})
    tempCanvas[1]:renderTo(fullScreenDraw, tempCanvas[2])

    pass:send("direction", {2, 0})
    tempCanvas[2]:renderTo(fullScreenDraw, tempCanvas[1])

    pass:send("direction", {0, 2})
    tempCanvas[1]:renderTo(fullScreenDraw, tempCanvas[2])

    pass:send("direction", {4, 0})
    tempCanvas[2]:renderTo(fullScreenDraw, tempCanvas[1])

    pass:send("direction", {0, 4})
    pass:send("canvas", tempCanvas[2]:getTexture())
    pass:fill() -- On the final pass, render directly to the screen.
  end
end

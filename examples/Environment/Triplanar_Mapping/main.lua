function lovr.load()
  grass = lovr.graphics.newTexture('grass.png')
  rock = lovr.graphics.newTexture('rock.png')
  dirt = lovr.graphics.newTexture('dirt.png')

  triplanar = lovr.graphics.newShader('unlit', [[
    layout(set = 2, binding = 0) uniform texture2D textureX;
    layout(set = 2, binding = 1) uniform texture2D textureY;
    layout(set = 2, binding = 2) uniform texture2D textureZ;
    
    Constants {
      float textureScale;
    };

    vec4 lovrmain() {
      vec2 xscale = vec2(-sign(Normal.x), -1.);
      vec2 yscale = vec2( sign(Normal.y), +1.);
      vec2 zscale = vec2( sign(Normal.z), -1.);

      vec3 colorX = getPixel(textureX, PositionWorld.zy * textureScale * xscale).rgb;
      vec3 colorY = getPixel(textureY, PositionWorld.xz * textureScale * yscale).rgb;
      vec3 colorZ = getPixel(textureZ, PositionWorld.xy * textureScale * zscale).rgb;

      vec3 normal = abs(normalize(Normal));
      vec3 weight = normal / (normal.x + normal.y + normal.z);
      vec3 color = colorX * weight.x + colorY * weight.y + colorZ * weight.z;
      
      return Color * vec4(color, 1.);
    }
  ]])
end

function lovr.draw(pass)
  pass:setShader(triplanar)
  pass:send('textureScale', 1.0)
  pass:send('textureX', rock)
  pass:send('textureY', grass)
  pass:send('textureZ', dirt)

  local width = 4 + 2 * math.cos(lovr.timer.getTime())
  local height = 3 + 2 * math.sin(lovr.timer.getTime())

  pass:box(0, -2, -10, width, height, 3)
end

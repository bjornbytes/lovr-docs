-- Shows how to write to textures with a compute shader

function lovr.load()
  texture = lovr.graphics.newTexture(256, 256, {
    usage = { 'sample', 'storage' },
    mipmaps = false,
    linear = true
  })

  shader = lovr.graphics.newShader([[
    layout(local_size_x = 8, local_size_y = 8) in;
    layout(rgba8) uniform writeonly image2D image;

    void lovrmain() {
      ivec2 coord = ivec2(GlobalThreadID.xy);
      ivec2 size = imageSize(image);

      if (coord.x >= size.x || coord.y >= size.y) {
        return;
      }

      vec2 uv = vec2(coord) / size;
      vec4 color = vec4(uv.x, uv.y, 1., 1.);
      imageStore(image, coord, color);
    }
  ]])

  local pass = lovr.graphics.newPass()
  pass:setShader(shader)
  pass:send('image', texture)
  pass:compute(math.ceil(texture:getWidth() / 8), math.ceil(texture:getHeight() / 8))
  lovr.graphics.submit(pass)
end

function lovr.draw(pass)
  pass:draw(texture, 0, 1.7, -1)
end

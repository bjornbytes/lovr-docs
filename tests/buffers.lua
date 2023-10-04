function lovr.load()
  local buffer, data

  -- Size
  buffer = lovr.graphics.newBuffer(16)
  assert(buffer:getSize() == 16)
  assert(buffer:getLength() == nil)
  assert(buffer:getStride() == nil)
  assert(buffer:getFormat() == nil)

  -- Format
  buffer = lovr.graphics.newBuffer('int')
  assert(buffer:getSize() == 4)
  assert(buffer:getLength() == 1)
  assert(buffer:getStride() == 4)

  -- Length
  buffer = lovr.graphics.newBuffer('float', 16)
  assert(buffer:getSize() == 64)
  assert(buffer:getLength() == 16)
  assert(buffer:getStride() == 4)

  -- Table data
  buffer = lovr.graphics.newBuffer('int', { 1, 2, 3 })
  assert(buffer:getSize() == 12)
  assert(buffer:getLength() == 3)
  assert(buffer:getStride() == 4)

  data = buffer:getData()
  assert(data[1] == 1 and data[2] == 2 and data[3] == 3)

  buffer:setData({ 4, 5, 6 })
  data = buffer:getData()
  assert(data[1] == 4 and data[2] == 5 and data[3] == 6)

  buffer:setData({ 8, 9 }, 2)
  data = buffer:getData()
  assert(data[1] == 4 and data[2] == 8 and data[3] == 9)

  buffer:clear()
  data = buffer:getData()
  assert(data[1] == 0 and data[2] == 0 and data[3] == 0)

  -- Keys
  buffer = lovr.graphics.newBuffer({{ 'x', 'int' }, { 'y', 'float' }})
  buffer:setData({ x = -1, y = 1e7 })
  data = buffer:getData()[1]
  assert(data[1] == -1 and data[2] == 1e7)

  -- Arrays
  buffer = lovr.graphics.newBuffer({{ 'a', 'float', 3 }})
  assert(buffer:getSize() == 12)
  assert(buffer:getLength() == 1)
  assert(buffer:getStride() == 12)
  buffer:setData({ a = { 10, 100, 1000 } })
  data = buffer:getData()[1]
  assert(data.a[1] == 10 and data.a[2] == 100 and data.a[3] == 1000)

  -- Structs
  buffer = lovr.graphics.newBuffer({
    { 'a', {
      { 'b', {
        { 'c', 'vec2' }
      }}
    }}
  })
  assert(buffer:getSize() == 8)
  assert(buffer:getLength() == 1)
  assert(buffer:getStride() == 8)
  buffer:setData({ a = { b = { c = { 1.2, 3.4 } } } })
  data = buffer:getData()[1]
  assert(vec2(unpack(data.a.b.c)):equals(vec2(1.2, 3.4)))

  -- Layouts
  buffer = lovr.graphics.newBuffer({ 'float', layout = 'std140' })
  assert(buffer:getStride() == 16)
  buffer = lovr.graphics.newBuffer({ 'vec3', layout = 'std430' })
  assert(buffer:getStride() == 16)

  -- Blob length
  buffer = lovr.graphics.newBuffer('un10x3', lovr.data.newBlob(16))
  assert(buffer:getLength() == 4)
  buffer = lovr.graphics.newBuffer('un10x3', lovr.data.newBlob(15))
  assert(buffer:getLength() == 3)

  -- FFI
  local ok, ffi = pcall(require, 'ffi')
  if ok and ffi then
    buffer = lovr.graphics.newBuffer('float')
    ffi.cast('float*', buffer:mapData())[0] = 7
    assert(buffer:getData()[1] == 7)
  end

  -- Push constants
  shader = lovr.graphics.newShader([[
    struct S { int a, b, c; };

    Constants {
      float x;
      vec2 y;
      float z[3];
      vec2 w[2];
      S s;
      S t[2];
    };

    void lovrmain() {}
  ]])

  pass = lovr.graphics.newPass()
  pass:setShader(shader)
  pass:send('x', 7)
  pass:send('y', 3, 4)
  pass:send('y', { 3, 4 })
  pass:send('y', vec2(3, 4))
  pass:send('z', { 1, 2, 3 })
  pass:send('w', { 1, 2, 3, 4 })
  pass:send('w', { vec2(1, 2), vec2(3, 4) })
  pass:send('w', { { 1, 2 }, { 3, 4 } })
  pass:send('s', { a = 1, b = 2, c = 3 })
  pass:send('t', { { a = 1, b = 2, c = 3 }, { a = 4, b = 5, c = 6 } })
end

function table.eq(a, b)
  if type(a) ~= type(b) then return false end
  if type(a) ~= 'table' then return a == b end
  if #a ~= #b then return false end
  for k, _ in pairs(a) do
    if not table.eq(a[k], b[k]) then return false end
  end
  return true
end

function lovr.load()
  local buffer, data

  -- Empty Format
  buffer = lovr.graphics.newBuffer(16)
  assert(buffer:getSize() == 16)
  assert(buffer:getLength() == nil)
  assert(buffer:getStride() == nil)
  assert(buffer:getFormat() == nil)

  -- Single Scalar
  buffer = lovr.graphics.newBuffer('int')
  assert(buffer:getSize() == 4)
  assert(buffer:getLength() == 0)
  assert(buffer:getStride() == 4)
  buffer:setData(-3)
  assert(buffer:getData() == -3)

  -- Single Vector
  buffer = lovr.graphics.newBuffer('vec3', vec3(1, 2, 3))
  assert(buffer:getSize() == 12)
  assert(buffer:getLength() == 0)
  assert(buffer:getStride() == 12)
  x, y, z = buffer:getData()
  assert(x == 1 and y == 2 and z == 3)

  buffer:setData(vec3(4, 5, 6))
  x, y, z = buffer:getData()
  assert(x == 4 and y == 5 and z == 6)

  buffer:setData({ 7, 8, 9 })
  x, y, z = buffer:getData()
  assert(x == 7 and y == 8 and z == 9)

  -- Single Item Array
  buffer = lovr.graphics.newBuffer('int', 1)
  assert(buffer:getSize() == 4)
  assert(buffer:getLength() == 1)
  assert(buffer:getStride() == 4)
  buffer:setData({ -5 })
  assert(buffer:getData()[1] == -5)

  -- Array
  buffer = lovr.graphics.newBuffer('float', 3)
  assert(buffer:getSize() == 12)
  assert(buffer:getLength() == 3)
  assert(buffer:getStride() == 4)
  buffer:setData({ .5, .25, .125 })
  data = buffer:getData()
  assert(table.eq(buffer:getData(), { .5, .25, .125 }))

  -- Anonymous Struct
  buffer = lovr.graphics.newBuffer({ 'vec2', 'vec3', 'vec4' }, 0)
  assert(buffer:getSize() == 36)
  assert(buffer:getLength() == 0)
  assert(buffer:getStride() == 36)

  buffer:setData({ 1, 2; 3, 4, 5; 6, 7, 8, 9 })
  assert(table.eq(buffer:getData(), { { 1, 2 }, { 3, 4, 5 }, { 6, 7, 8, 9 } }))

  buffer:setData({ { 9, 8 }, { 7, 6, 5 }, { 4, 3, 2, 1 } })
  assert(table.eq(buffer:getData(), { { 9, 8 }, { 7, 6, 5 }, { 4, 3, 2, 1 } }))

  buffer:setData({ vec2(1, 2), vec3(3, 4, 5), vec4(6, 7, 8, 9) })
  assert(table.eq(buffer:getData(), { { 1, 2 }, { 3, 4, 5 }, { 6, 7, 8, 9 } }))

  -- Anonymous Struct Array
  buffer = lovr.graphics.newBuffer({ 'vec2', 'vec3' }, 2)
  assert(buffer:getSize() == 40)
  assert(buffer:getLength() == 2)
  assert(buffer:getStride() == 20)

  buffer:setData({ { 1, 2, 3, 4, 5 }, { 5, 4, 3, 2, 1 } })
  assert(table.eq(buffer:getData(), { { { 1, 2 }, { 3, 4, 5 } }, { { 5, 4 }, { 3, 2, 1 } } }))

  buffer:setData({ { { 4, 4 }, { 3, 3, 3 } }, { { 2, 2 }, { 1, 1, 1 } }, -0 })
  assert(table.eq(buffer:getData(), { { { 4, 4 }, { 3, 3, 3 } }, { { 2, 2 }, { 1, 1, 1 } } }))

  buffer:setData({ { vec2(7), vec3(6) }, { vec2(4), vec3(5) } })
  assert(table.eq(buffer:getData(), { { { 7, 7 }, { 6, 6, 6 } }, { { 4, 4 }, { 5, 5, 5 } } }))

  -- Single Struct
  buffer = lovr.graphics.newBuffer({ { 'a', 'float' }, { 'b', 'vec2' } })
  buffer:setData({ a = 7, b = { 1, 2 } })
  assert(table.eq(buffer:getData(), { a = 7, b = { 1, 2 } }))
  buffer:setData({ a = 8, b = vec2(3, 4) })
  assert(table.eq(buffer:getData(), { a = 8, b = { 3, 4 } }))
  buffer:setData({ 1, 2, 3 })
  assert(table.eq(buffer:getData(), { a = 1, b = { 2, 3 } }))
  buffer:setData({ 4, { 5, 6 } })
  assert(table.eq(buffer:getData(), { a = 4, b = { 5, 6 } }))
  buffer:setData({ 7, vec2(8, 9) })
  assert(table.eq(buffer:getData(), { a = 7, b = { 8, 9 } }))
  buffer:setData({ 10, b = vec2(11, 12) })
  assert(table.eq(buffer:getData(), { a = 10, b = { 11, 12 } }))

  -- Struct Array
  buffer = lovr.graphics.newBuffer({ { 'a', 'float' }, { 'b', 'vec2' } }, {
    { a = 1, b = { 2, 3 } },
    { a = 4, b = { 5, 6 } }
  })

  assert(table.eq(buffer:getData(), { { a = 1, b = { 2, 3 } }, { a = 4, b = { 5, 6 } } }))

  buffer:setData({
    { 9, 8, 7 },
    { a = 6, b = vec2(5, 4) }
  })

  assert(table.eq(buffer:getData(), { { a = 9, b = { 8, 7 } }, { a = 6, b = { 5, 4 } } }))
  assert(pcall(buffer.setData, buffer, { 1, 2, 3, 4, 5, 6 }) == false)

  -- Struct With Array of Structs
  buffer = lovr.graphics.newBuffer({
    { 'list', { { 'pos', 'vec3' }, { 'size', 'float' } }, 3 },
    { 'count', 'int' }
  })

  buffer:setData({
    list = {
      { vec3(1, 1, 1), 2 },
      { 3, 3, 3, 4 },
      { pos = { 5, 5, 5 }, size = 6 }
    },
    count = 101
  })

  assert(table.eq(buffer:getData(), {
    list = {
      { pos = { 1, 1, 1 }, size = 2 },
      { pos = { 3, 3, 3 }, size = 4 },
      { pos = { 5, 5, 5 }, size = 6 }
    },
    count = 101
  }))

  -- Array data offset
  buffer = lovr.graphics.newBuffer('int', { 1, 2, 3 })
  assert(buffer:getSize() == 12)
  assert(buffer:getLength() == 3)
  assert(buffer:getStride() == 4)
  assert(table.eq(buffer:getData(), { 1, 2, 3 }))

  buffer:setData({ 8, 9 }, 2)
  assert(table.eq(buffer:getData(), { 1, 8, 9 }))

  buffer:setData({ -1, -2 }, 3, 2, 1)
  assert(table.eq(buffer:getData(), { 1, 8, -2 }))

  -- Clear
  buffer = lovr.graphics.newBuffer('int', { 1, 2, 3 })
  buffer:clear()
  assert(table.eq(buffer:getData(), { 0, 0, 0 }))

  -- Nested Structs
  buffer = lovr.graphics.newBuffer({
    { 'a', {
      { 'b', {
        { 'c', 'vec2' }
      }}
    }}
  })
  assert(buffer:getSize() == 8)
  assert(buffer:getLength() == 0)
  assert(buffer:getStride() == 8)
  buffer:setData({ a = { b = { c = { 1.5, 2.5 } } } })
  assert(table.eq(buffer:getData(), { a = { b = { c = { 1.5, 2.5 } } } }))

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
  pass:send('y', { 3, 4 })
  pass:send('y', vec2(3, 4))
  pass:send('z', { 1, 2, 3 })
  pass:send('w', { 1, 2, 3, 4 })
  pass:send('w', { vec2(1, 2), vec2(3, 4) })
  pass:send('w', { { 1, 2 }, { 3, 4 } })
  pass:send('s', { a = 1, b = 2, c = 3 })
  pass:send('t', { { a = 1, b = 2, c = 3 }, { a = 4, b = 5, c = 6 } })
end

lovr.event.quit()

function lovr.load()
  font = lovr.graphics.getDefaultFont()
  local lines = font:getLines({ 0xff0000, 'hello ', 0x0000ff, 'world' }, 0)
  assert(#lines == 2)
  assert(lines[1] == 'hello ')
  assert(lines[2] == 'world')
end

lovr.event.quit()

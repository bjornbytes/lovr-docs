function lovr.load()
  t = lovr.graphics.newTexture(100, 100, { format = 'd32f' })
  p = lovr.graphics.getPass('render', t)
end

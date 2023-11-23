function lovr.load()
  t = lovr.graphics.newTexture(100, 100, { format = 'd32f' })
  p = lovr.graphics.newPass({ depth = t })
  lovr.graphics.submit(p)
end

lovr.event.quit()

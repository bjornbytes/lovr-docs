function lovr.load()
  stats = { 0, 0, 0, 0 }
  tally = lovr.graphics.newTally('shader', 1, 1)
  readbacks = {}
end

function lovr.update(dt)
  while readbacks[1] and readbacks[1]:isComplete() do
    stats = readbacks[1]:getData()
    table.remove(readbacks, 1)
  end
end

function lovr.draw(pass)
  -- Track metrics in the Tally when drawing the cube
  pass:tick(tally, 1)
  pass:cube(0, 0.7, -1, .5, lovr.headset.getTime())
  pass:tock(tally, 1)

  -- Read back the tally data
  local tx = lovr.graphics.getPass('transfer')
  local readback = tx:read(tally, 1)
  table.insert(readbacks, readback)

  -- Render latest tally results
  pass:text(('%s: %s\n%s: %s\n%s: %s\n%s: %s'):format(
    'vertices', stats[1],
    'vertexshader', stats[2],
    'visibletriangles', stats[3],
    'fragmentshader', stats[4]
  ), 0, 1.7, -1, .1)

  return lovr.graphics.submit(pass, tx)
end

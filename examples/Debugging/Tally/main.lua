function lovr.load()
  readbacks = {}
  buffer = lovr.graphics.newBuffer('uint')
  pixels = 0
end

function lovr.update(dt)
  while readbacks[1] and readbacks[1]:isComplete() do
    pixels = readbacks[1]:getData()
    table.remove(readbacks, 1)
  end
end

function lovr.draw(pass)
  -- Track metrics in the Tally when drawing the cube
  pass:beginTally()
  pass:cube(0, 0.7, -1, .5, lovr.headset.getTime())
  pass:finishTally()

  -- Render most recent tally result
  pass:text(('Cube is %d pixels'):format(pixels), 0, 1.7, -1, .1)

  -- Tell the pass to copy the tally result to the buffer
  pass:setTallyBuffer(buffer)

  -- Submit the pass
  lovr.graphics.submit(pass)

  -- Read back the tally result from the buffer (after submission)
  table.insert(readbacks, buffer:newReadback())

  -- We already submitted the pass, tell lovr not to submit it again!
  return true
end

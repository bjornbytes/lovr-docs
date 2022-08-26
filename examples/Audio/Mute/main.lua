function lovr.load()
  source = lovr.audio.newSource('sine.wav')
  source:setLooping(true)
  source:play()
  muted = false
end

function lovr.update()
  if lovr.headset.wasPressed('left', 'trigger') or lovr.headset.wasPressed('right', 'trigger') then
    muted = not muted
    lovr.audio.setVolume(muted and 0 or 1)
  end
end

function lovr.draw(pass)
  local font = lovr.graphics.getDefaultFont()
  pass:text(muted and 'Muted' or 'Unmuted', 0, 1.7, -1, .1)
  pass:text('Press trigger to toggle mute', 0, 1.7 - font:getHeight() * .2, -1, .1)
end

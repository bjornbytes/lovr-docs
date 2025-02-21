function lovr.conf(t)
  t.audio.start = false
  t.modules.audio = not os.getenv('CI')
  t.modules.graphics = not os.getenv('CI')
  t.window = nil
end

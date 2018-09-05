function lovr.conf(t)
  t.window.msaa = 4
  t.gammacorrect = lovr.getOS() ~= 'Web'
end

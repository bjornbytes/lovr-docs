function lovr.conf(t)
  -- Request a stencil buffer for this app.
  -- Kludge: Only one of these should be needed, depending on driver,
  -- but we don't know which driver has been picked yet, so we set both.
  t.graphics.stencil = true
  t.headset.stencil = true
end
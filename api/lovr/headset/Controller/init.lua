return {
  summary = 'An object used to interact with connected VR controllers.',
  description = [[
    Controller objects represent the controllers held in players' hands.  To obtain a list of
    currently connected controllers, use `lovr.headset.getControllers`.  To determine when
    controllers are added and removed, use `lovr.controlleradded` and `lovr.controllerremoved`.
    Often Controllers won't be considered "active" until they are moved around a bit.
  ]],
  example = {
    description = 'Draw cubes for the controllers and vibrate them if the trigger is pressed.',
    code = [[
      function lovr.update(dt)
        for i, controller in ipairs(lovr.headset.getControllers()) do
          if controller:getAxis('trigger') > .9 then
            controller:vibrate(.004)
          end
        end
      end

      function lovr.draw()
        for i, controller in ipairs(lovr.headset.getControllers()) do
          local x, y, z = controller:getPosition()
          local angle, ax, ay, az = controller:getOrientation()
          lovr.graphics.cube('fill', x, y, z, .08, angle, ax, ay, az)
        end
      end
    ]]
  }
}

return {
  tag = 'callbacks',
  summary = 'Called to implement the headset simulator.',
  description = [[
    When VR isn't available, LÖVR implements a headset simulator that can be controlled with the
    keyboard and mouse.  This is implemented in the `lovr.simulate` callback, and can be overridden
    to customize the simulator behavior.

    The default implementation reads the keyboard/mouse state and uses the following functions to
    assign virtual poses and button states:

    - `lovr.headset.setPosition`
    - `lovr.headset.setOrientation`
    - `lovr.headset.setPose`
    - `lovr.headset.setButton`

    When VR isn't active, the regular headset accessors (e.g. `lovr.headset.getPosition`) will
    return the virtual poses and buttons.

    Overriding the callback could be useful for the following:

    - Changing the keyboard/mouse inputs used for the simulator
    - Simulating other devices, or adding support for more buttons
    - Disabling the simulator in certain situations (e.g. disable simulator when menu is open)
    - Recording/replaying VR input events for debugging
    - Synchronizing VR device state over the network
  ]],
  arguments = {
    dt = {
      type = 'number',
      description = 'The number of seconds elapsed since the last update.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'dt' },
      returns = {}
    }
  },
  example = {
    description = 'The default simulator implementation.',
    code = [[
      local mouseX, mouseY, handX, handY, distance, pitch, yaw = nil, nil, 0, 0, .5, nil, nil

      function lovr.simulate(dt)
        if not lovr.math then return end

        if not pitch or not yaw then
          pitch, yaw = quaternion(lovr.headset.getOrientation()):toeuler()
          mouseX, mouseY = lovr.system.getMousePosition()
        end

        local movespeed = 3
        local sprintspeed = 15
        local walkspeed = .5
        local turnspeed = .005
        local turnsmooth = 30

        local click = lovr.system.isMouseDown(1)

        lovr.system.setMouseMode(click and 'relative' or 'normal')

        local lastX, lastY = mouseX, mouseY
        mouseX, mouseY = lovr.system.getMousePosition()

        if click then
          yaw = yaw - (mouseX - lastX or mouseX) * turnspeed
          pitch = pitch - (mouseY - lastY or mouseY) * turnspeed
          pitch = math.min(pitch, math.pi / 2)
          pitch = math.max(pitch, -math.pi / 2)
        else
          handX, handY = mouseX, mouseY
        end

        local trigger = lovr.system.isMouseDown(2)
        lovr.headset.setButton('hand/left', 'trigger', trigger)
        lovr.headset.setButton('hand/left/point', 'trigger', trigger)

        -- Head

        local angle, ax, ay, az = lovr.headset.getOrientation()
        local target = quaternion(yaw, 0, 1, 0) * quaternion(pitch, 1, 0, 0)
        local orientation = quaternion(angle, ax, ay, az):slerp(target, 1 - math.exp(-turnsmooth * dt))

        local sprint = lovr.system.isKeyDown('lshift', 'rshift')
        local walk = lovr.system.isKeyDown('lctrl', 'rctrl')
        local forward = lovr.system.isKeyDown('w', 'up')
        local backward = lovr.system.isKeyDown('s', 'down')
        local left = lovr.system.isKeyDown('a', 'left')
        local right = lovr.system.isKeyDown('d', 'right')
        local up = lovr.system.isKeyDown('q')
        local down = lovr.system.isKeyDown('e')

        local vx = left and -1 or right and 1 or 0
        local vy = down and -1 or up and 1 or 0
        local vz = forward and -1 or backward and 1 or 0
        local speed = sprint and sprintspeed or walk and walkspeed or movespeed
        local velocity = vector(vx, vy, vz):normalize() * speed * dt
        local position = vector(lovr.headset.getPosition('head')) + orientation * velocity
        lovr.headset.setPose('head', position, orientation)

        -- Hand

        local left, right, up, down = lovr.headset.getViewAngles(1)
        local near, far = lovr.headset.getClipDistance()
        local inverseProjection = mat4():fov(left, right, up, down, near, far):invert()

        local width, height = lovr.system.getWindowDimensions()
        local coordinate = vector(handX / width * 2 - 1, handY / height * 2 - 1, 1, 1)
        local direction = (orientation * (inverseProjection * coordinate)):normalize()

        distance = distance * (1 + lovr.system._getScrollDelta() * .05)
        distance = math.min(distance, 10)
        distance = math.max(distance, .05)

        local handPosition = position + direction * distance
        local handOrientation = quaternion.lookdir(direction, orientation * vector.up)

        lovr.headset.setPose('hand/left', handPosition, handOrientation)
        lovr.headset.setPose('hand/left/point', handPosition, handOrientation)
      end
    ]]
  },
  related = {
    'lovr.headset.isActive',
    'lovr.headset.setPosition',
    'lovr.headset.setOrientation',
    'lovr.headset.setPose',
    'lovr.headset.setButton',
    'lovr.headset.start',
    'lovr.headset.connect'
  }
}

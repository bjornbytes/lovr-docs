local options = {
  ['2_Bone_IK'] = {
    devices = {
      head = {
        position = { -.03, 1.6, .1 }
      }
    }
  },
  FPS_Controls = false,
  Window_HUD = false
}

function lovr.load()
  lovr.audio.stop('playback')

  local width, height = 360, 400

  local backbuffer = lovr.graphics.newTexture(width, height, { usage = { 'sample', 'render', 'transfer' } })
  local pass = lovr.graphics.newPass({ backbuffer, depth = 'd32fs8' })

  for i, category in ipairs(lovr.filesystem.getDirectoryItems('/')) do
    if lovr.filesystem.isDirectory(category) and not category:match('^%.') then
      for j, project in ipairs(lovr.filesystem.getDirectoryItems(category)) do
        local path = table.concat({ category, project }, '/')
        local file = path .. '/main.lua'

        print(('Snapping %s...'):format(path))

        if options[project] ~= false then
          local ok, chunk = pcall(lovr.filesystem.load, file)

          if not ok then
            print(string.format('Could not parse %q (%s)', file, chunk))
          else
            local env

            env = setmetatable({
              lovr = setmetatable({
                headset = setmetatable({
                  getDriver = function()
                    return 'openxr'
                  end,
                  getName = function()
                    return 'Extremely Spooky Headset You Have Never Heard Of!!'
                  end,
                  getOriginType = function()
                    return 'floor'
                  end,
                  getDisplayWidth = function()
                    return width
                  end,
                  getDisplayHeight = function()
                    return height
                  end,
                  getDisplayDimensions = function()
                    return width, height
                  end,
                  getViewCount = function()
                    return 1
                  end,
                  getViewPose = function()
                    return env.lovr.headset.getPose('head')
                  end,
                  getViewAngles = function()
                    return .5, .5, .5, .5
                  end,
                  isTracked = function(device)
                    local o = options[project]
                    device = (device or 'head'):gsub('^hand/', ''):gsub('/point$', '')
                    return device == 'head' or (o and o.devices and o.devices[device])
                  end,
                  getPose = function(device)
                    device = device or 'head'

                    local defaultPose = {
                      head = { 0, 1.7, 0; 0, 0, 0, 0 }
                    }

                    if not options[project] or not options[project].devices or not options[project].devices[device] then
                      return unpack(defaultPose[device] or { 0, 0, 0; 0, 0, 0, 0 })
                    end

                    local d = options[project].devices[device]

                    if d.pose then
                      return unpack(d.pose)
                    else
                      local x, y, z, angle, ax, ay, az = 0, 0, 0, 0, 0, 0, 0

                      if d.position then
                        x, y, z = unpack(d.position)
                      end

                      if d.orientation then
                        angle, ax, ay, az = unpack(d.orientation)
                      elseif d.target then
                        angle, ax, ay, az = select(7, mat4():target(vec3(x, y, z), vec3(unpack(d.target))):unpack())
                      end

                      return x, y, z, angle, ax, ay, az
                    end
                  end,
                  getPosition = function(device)
                    local x, y, z = env.lovr.headset.getPose(device)
                    return x, y, z
                  end,
                  getOrientation = function(device)
                    local angle, ax, ay, az = select(4, env.lovr.headset.getPose(device))
                    return angle, ax, ay, az
                  end,
                  getVelocity = function(device)
                    return 0, 0, 0
                  end,
                  getAngularVelocity = function(device)
                    return 0, 0, 0
                  end,
                  isDown = function(device, button)
                    return false
                  end,
                  wasPressed = function(device, button)
                    return false
                  end,
                  wasReleased = function(device, button)
                    return false
                  end,
                  isTouched = function(device, button)
                    return false
                  end,
                  getAxis = function(device, axis)
                    return 0, 0
                  end,
                  getSkeleton = function(device)
                    return nil
                  end,
                  vibrate = function(device, strength, duration, frequency)
                    -- thanks...
                  end,
                  newModel = function(device, options)
                    return nil
                  end,
                  animate = function(model)
                    return false
                  end,
                  isFocused = function()
                    return true
                  end,
                  update = function()
                    return 0
                  end,
                  getTime = function()
                    return 0
                  end,
                  getDeltaTime = function()
                    return 0
                  end,
                  getPass = function()
                    for i = 1, env.lovr.headset.getViewCount() do
                      pass:setViewPose(i, env.lovr.headset.getViewPose(i))
                      pass:setProjection(i, env.lovr.headset.getViewAngles(i))
                    end

                    return pass
                  end,
                  submit = function()
                    --
                  end,
                  getHands = function()
                    return { 'hand/left', 'hand/right' }
                  end
                }, { __index = lovr.headset }),
                load = function() end,
                update = function() end,
                draw = function() end,
                require = function(module)
                  if module:match('/') then
                    return require(path .. '/' .. module)
                  else
                    return require(path:gsub('/', '.') .. '.' .. module)
                  end
                end
              }, { __index = lovr })
            }, { __index = _G })

            setfenv(chunk, env)

            lovr.graphics.setBackgroundColor(0, 0, 0, 1)
            pass:setClear(0x000000)
            lovr.filesystem.mount(lovr.filesystem.getRealDirectory(path) .. '/' .. path, '/', false)

            local ok, result = pcall(chunk)

            if not ok then
              print(('Failed to run main.lua for %s (%s)'):format(project, result))
            else
              local ok, thread = pcall(setfenv(env.lovr.run, env))

              if not ok or not thread then
                print(('\tFailed to run lovr.run for %s (%s)'):format(project, thread))
              else
                local ok, result = pcall(thread)

                if not ok then
                  print(('\tFailed to run main loop for %s (%s)'):format(project, result))
                end

                local image = backbuffer:getPixels()
                lovr.filesystem.write(project .. '.png', image:encode())
              end
            end

            lovr.filesystem.unmount(path)
            lovr.graphics.submit()
          end
        end
      end
    end
  end

  lovr.event.quit()
  print('Done')
end

return {
  summary = 'Compute an angle/axis rotation from a vector.',
  description = 'Returns the angle/axis orientation to use to get an object to look at a point.',
  arguments = {
    {
      name = 'x',
      type = 'number',
      description = 'The x position of the object.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y position of the object.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z position of the object.'
    },
    {
      name = 'tx',
      type = 'number',
      description = 'The x position of the target to look at.'
    },
    {
      name = 'ty',
      type = 'number',
      description = 'The y position of the target to look at.'
    },
    {
      name = 'tz',
      type = 'number',
      description = 'The z position of the target to look at.'
    },
    {
      name = 'ux',
      type = 'number',
      default = '0',
      description = 'The x component of the global up vector.'
    },
    {
      name = 'uy',
      type = 'number',
      default = '1',
      description = 'The y component of the global up vector.'
    },
    {
      name = 'uz',
      type = 'number',
      default = '0',
      description = 'The z component of the global up vector.'
    }
  },
  returns = {
    {
      name = 'angle',
      type = 'number',
      description = 'The number of radians to rotate around the axis of rotation.'
    },
    {
      name = 'ax',
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      description = 'The z component of the axis of rotation.'
    }
  },
  notes = [[
    With the default up vector, strange things will happen when trying to look in directions that
    line up with the up vector, similar to how the cameras in a first person shooter work. Sometimes
    this is alright, but other times you may want to keep track of the up vector of the camera as it
    rotates and pass that in as the up vector to avoid issues.
  ]],
  example = {
    description = 'Rotate a texture so it always faces the headset.',
    code = [[
      function lovr.load()
        eye = lovr.graphics.newTexture('texture.png')
      end

      function lovr.draw()
        local x, y, z = 0, 2, -2
        local angle, ax, ay, az = lovr.math.lookAt(x, y, z, lovr.headset.getPosition())
        lovr.graphics.plane(eye, x, y, z, 1, angle, ax, ay, az)
      end
    ]]
  }
}

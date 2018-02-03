return {
  summary = 'Convert an angle/axis orientation to a direction vector.',
  description = 'Converts a rotation in angle/axis representation into a direction vector.',
  arguments = {
    {
      name = 'angle',
      type = 'number',
      description = 'The angle (in radians).'
    },
    {
      name = 'ax',
      type = 'number',
      default = '0',
      description = 'The x component of the axis of rotation.'
    },
    {
      name = 'ay',
      type = 'number',
      default = '1',
      description = 'The y component of the axis of rotation.'
    },
    {
      name = 'az',
      type = 'number',
      default = '0',
      description = 'The z component of the axis of rotation.'
    }
  },
  returns = {
    {
      name = 'x',
      type = 'number',
      description = 'The x component of the direction vector.'
    },
    {
      name = 'y',
      type = 'number',
      description = 'The y component of the direction vector.'
    },
    {
      name = 'z',
      type = 'number',
      description = 'The z component of the direction vector.'
    }
  },
  example = {
    description = 'Give Controllers laser beams.',
    code = [[
      function lovr.draw()
        for i, controller in ipairs(lovr.headset.getControllers()) do
          local x, y, z = controller:getPosition()
          local angle, ax, ay, az = controller:getOrientation()
          local dx, dy, dz = lovr.math.orientationToDirection(angle, ax, ay, az)
          local length = 2
          lovr.graphics.line(x, y, z, x + dx * length, y + dy * length, z + dz * length)
        end
      end
    ]]
  },
  related = {
    'lovr.math.lookAt'
  }
}

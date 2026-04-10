return {
  summary = 'Set the orientation of the AudioMesh.',
  description = 'Sets the orientation of the AudioMesh.',
  arguments = {
    angle = {
      type = 'number',
      description = [[
        The number of radians the AudioMesh should be rotated around its rotation axis.
      ]]
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    },
    orientation = {
      type = 'quaternion',
      description = 'The new orientation for the AudioMesh.'
    }
  },
  returns = {},
  variants = {
    {
      description = 'Set the orientation using numbers.',
      arguments = { 'angle', 'ax', 'ay', 'az' },
      returns = {}
    },
    {
      description = 'Set the orientation using a vector.',
      arguments = { 'orientation' },
      returns = {}
    }
  },
  related = {
    'AudioMesh:setPosition',
    'AudioMesh:setPose',
    'AudioMesh:setScale',
    'AudioMesh:setTransform'
  }
}

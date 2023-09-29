return {
  summary = 'A stream of graphics commands.',
  description = [[
    Pass objects are used to record commands for the GPU.  Commands can be recorded by calling
    functions on the Pass.  After recording a set of passes, they can be submitted for the GPU to
    process using `lovr.graphics.submit`.
  ]],
  constructors = {
    'lovr.graphics.getPass',
    'lovr.graphics.getWindowPass',
    'lovr.headset.getPass'
  },
  sections = {
    {
      name = 'Drawing',
      tag = 'drawing',
      description = 'Draw objects and shapes.'
    },
    {
      name = 'Coordinate System',
      tag = 'transform',
      description = 'Manipulate the 3D coordinate system.'
    },
    {
      name = 'Render States',
      tag = 'pipeline',
      description = [[
        Set render states that change the way drawing happens.  `Pass:push` and `Pass:pop` with a
        `StackType` of `state` can be used to save and restore render states.
      ]]
    },
    {
      name = 'Shader Variables',
      tag = 'shader-inputs',
    },
    {
      name = 'Camera',
      tag = 'camera',
    },
    {
      name = 'Compute',
      tag = 'compute',
    },
    {
      name = 'Transfers',
      tag = 'transfer'
    },
    {
      name = 'Miscellaneous',
      tag = 'pass-misc'
    }
  }
}

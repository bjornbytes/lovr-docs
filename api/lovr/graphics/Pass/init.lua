return {
  summary = 'A stream of graphics commands.',
  description = [[
    Pass objects are used to record work for the GPU.  They contain a list of things to draw and a
    list of compute shaders to run.

    Methods like `Pass:sphere` will "record" a draw on the Pass, which adds it to the list.  Other
    methods like `Pass:setBlendMode` or `Pass:setShader` will change the way the next draws are
    processed.

    Once all of the work has been recorded to a Pass, it can be sent to the GPU using
    `lovr.graphics.submit`, which will start processing all of the compute work and draws (in that
    order).

    A Pass can have a **canvas**, which is a set of textures that the draws will render to.

    `Pass:reset` is used to clear all of the computes and draws, putting the Pass in a fresh state.

    `lovr.draw` is called every frame with a `Pass` that is configured to render to either the
    headset or the window.  The Pass will automatically get submitted afterwards.
  ]],
  constructors = {
    'lovr.graphics.newPass',
    'lovr.graphics.getWindowPass',
    'lovr.headset.getPass',
    'lovr.graphics.getPass'
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
      name = 'Camera',
      tag = 'camera'
    },
    {
      name = 'Shaders',
      tag = 'shaders'
    },
    {
      name = 'Compute',
      tag = 'compute'
    },
    {
      name = 'Tally',
      tag = 'tally'
    },
    {
      name = 'Canvas',
      tag = 'canvas'
    },
    {
      name = 'Miscellaneous',
      tag = 'pass-misc'
    }
  }
}

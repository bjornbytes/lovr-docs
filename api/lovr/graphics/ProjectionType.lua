return {
  summary = 'Different projection types.',
  description = 'The different projection types for `Pass:setProjection`.',
  values = {
    {
      name = 'orthographic',
      description = [[
        A 2D orthographic projection given by 6 numbers: left, right, bottom, top, near, far.
        Left/right default to 0 and the width of the canvas.  Bottom/top default to 0 and the height
        of the canvas.  Near and far default to -1 and 1.  All of the numbers can be left off to set
        an orthographic projection with 0,0 in the upper-left corner and units in pixels.
      ]]
    },
    {
      name = 'perspective',
      description = [[
        A 3D perspective projection given by 4 numbers: fovy, aspect, near, far.  Fovy is in radians
        and defaults to 90 degrees.  The aspect ratio is width/height and defaults to the aspect
        ratio of the canvas.  Near and far default to .01 and 0.
      ]]
    },
    {
      name = 'asymmetric',
      description = [[
        An asymmetric perspective projection given by 6 numbers: left, right, up, down, near, far.
        This is meant to be used with `lovr.headset.getViewAngles`.  All of the angles are in
        radians, and are usually positive.  Near and far default to .01 and 0.
      ]]
    },
    {
      name = 'matrix',
      description = '16 numbers for a raw projection matrix, in column-major order.'
    }
  },
  notes = [[
    LÖVR creates projection matrices compatible with Vulkan.  The NDC direction is Y down, and the
    Z coordinate is from 0 to 1.

    When the far clipping plane is zero, LÖVR sets an infinite far plane and reverses the Z
    direction.  This is the default because it improves depth precision and reduces Z fighting.
    Using a non-infinite far plane requires the depth buffer to be cleared to 1.0 instead of 0.0 and
    the default depth test to be changed to `lequal` instead of `gequal`.
  ]]
}

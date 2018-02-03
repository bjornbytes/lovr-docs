return {
  summary = 'Different types of coordinate space origins.',
  description = [[
    Represents the different types of origins for coordinate spaces.  An origin of "floor" is common
    for headsets that support roomscale tracking, and means that the origin is on the floor in the
    center of the play area.  An origin of "head" is common for devices that do not support
    positional tracking and means the origin is relative to the position of the head.
  ]],
  values = {
    {
      name = 'head',
      description = 'The origin is near the head.'
    },
    {
      name = 'floor',
      description = 'The origin is on the floor.'
    }
  }
}

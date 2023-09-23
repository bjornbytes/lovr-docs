return {
  description = 'Different types of input devices supported by the `lovr.headset` module.',
  values = {
    {
      name = 'head',
      description = 'The headset.'
    },
    {
      name = 'floor',
      description = [[
        A device representing the floor, at the center of the play area.  The pose of this device in
        physical space will remain constant, even if after recentering.
      ]]
    },
    {
      name = 'left',
      description = 'A shorthand for hand/left.'
    },
    {
      name = 'right',
      description = 'A shorthand for hand/right.'
    },
    {
      name = 'hand/left',
      description = 'The left controller.'
    },
    {
      name = 'hand/right',
      description = 'The right controller.'
    },
    {
      name = 'hand/left/point',
      description = 'The left controller pointer (pose only).'
    },
    {
      name = 'hand/right/point',
      description = 'The right controller pointer (pose only).'
    },
    {
      name = 'elbow/left',
      description = 'A device tracking the left elbow.'
    },
    {
      name = 'elbow/right',
      description = 'A device tracking the right elbow.'
    },
    {
      name = 'shoulder/left',
      description = 'A device tracking the left shoulder.'
    },
    {
      name = 'shoulder/right',
      description = 'A device tracking the right shoulder.'
    },
    {
      name = 'chest',
      description = 'A device tracking the chest.'
    },
    {
      name = 'waist',
      description = 'A device tracking the waist.'
    },
    {
      name = 'knee/left',
      description = 'A device tracking the left knee.'
    },
    {
      name = 'knee/right',
      description = 'A device tracking the right knee.'
    },
    {
      name = 'foot/left',
      description = 'A device tracking the left foot or ankle.'
    },
    {
      name = 'foot/right',
      description = 'A device tracking the right foot or ankle.'
    },
    {
      name = 'camera',
      description = 'A camera device, often used for recording "mixed reality" footage.'
    },
    {
      name = 'keyboard',
      description = 'A tracked keyboard.'
    },
    {
      name = 'eye/left',
      description = 'The left eye.'
    },
    {
      name = 'eye/right',
      description = 'The right eye.'
    }
  },
  notes = [[
    The difference between `hand/left` and `hand/left/point` is the first represents an object held
    in the hand, whereas the second represents the laser pointer used to aim.  Drawing a controller
    model would use `hand/left`, whereas drawing a pointer or aiming would use `hand/left/point`.
  ]],
  related = {
    'DeviceAxis',
    'DeviceButton',
    'lovr.headset.getPose',
    'lovr.headset.getPosition',
    'lovr.headset.getOrientation',
    'lovr.headset.getVelocity',
    'lovr.headset.getAngularVelocity',
    'lovr.headset.getSkeleton',
    'lovr.headset.isTracked',
    'lovr.headset.isDown',
    'lovr.headset.isTouched',
    'lovr.headset.wasPressed',
    'lovr.headset.wasReleased',
    'lovr.headset.getAxis',
    'lovr.headset.vibrate',
    'lovr.headset.animate'
  }
}

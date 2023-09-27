return {
  tag = 'input',
  summary = 'Animate a model to match its Device input state.',
  description = [[
    Animates a model to match its input state.  The buttons and joysticks on a controller will move
    as they're pressed/moved and hand models will move to match hand tracking joints.

    The model must have been created using `lovr.headset.newModel` with the `animated` flag set to
    `true`.
  ]],
  arguments = {
    device = {
      type = 'Device',
      default = [['head']],
      description = 'The device to use for the animation data.'
    },
    model = {
      type = 'Model',
      description = 'The model to animate.'
    }
  },
  returns = {
    success = {
      type = 'boolean',
      description = [[
        Whether the animation was applied successfully to the Model.  If the Model was not
        compatible or animation data for the device was not available, this will be `false`.
      ]]
    }
  },
  variants = {
    {
      arguments = { 'model' },
      returns = { 'success' }
    },
    {
      arguments = { 'device', 'model' },
      returns = { 'success' }
    }
  },
  notes = [[
    It's possible to animate a custom hand model by retargeting joint poses, see the
    `Interaction/Custom_Hand_Rig` example.
  ]],
  related = {
    'lovr.headset.newModel',
    'Model:animate'
  }
}

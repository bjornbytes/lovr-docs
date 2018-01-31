return {
  tag = 'listener',
  summary = 'Set the doppler effect.',
  description = [[
    Sets parameters for the doppler effect.  The speed of sound and the intensity of the
    effect can be controlled.

    The doppler effect changes the pitch of Sources based on their relative velocity to the
    listener.
  ]],
  arguments = {
    {
      name = 'factor',
      type = 'number',
      description = 'How intense the doppler factor is.'
    },
    {
      name = 'speedOfSound',
      type = 'number',
      description = 'The speed of virtual sound, in meters per second.'
    }
  },
  returns = {},
  related = {
    'lovr.audio.getVelocity',
    'lovr.audio.setVelocity',
    'Source:getVelocity',
    'Source:setVelocity'
  }
}

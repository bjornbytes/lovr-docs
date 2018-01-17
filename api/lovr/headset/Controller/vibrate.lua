return {
  summary = 'Make the Controller go BZZZ!',
  description = 'Causes the Controller to vibrate for a specified duration.',
  arguments = {
    {
      name = 'duration',
      type = 'number',
      description = 'The amount of time to vibrate the Controller, in seconds.'
    }
  },
  returns = {},
  notes = [[
    On the HTC Vive, the value for the `duration` currently must be less than .004 seconds.  Call
    this function several frames in a row for stronger or prolonged vibration patterns.
  ]]
}

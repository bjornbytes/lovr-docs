return {
  tag = 'modules',
  summary = 'Connects to VR hardware.',
  description = [[
    The `lovr.headset` module is where all the magical VR functionality is.  With it, you can access
    connected VR hardware and get information about the available space the player has.  Note that
    all units are reported in meters.  Position `(0, 0, 0)` is the center of the play area.
  ]],
  sections = {
    {
      name = 'Headset',
      tag = 'headset',
      description = [[
        Functions that return information about the head mounted display (HMD) currently strapped to
        the player's face.
      ]]
    },
    {
      name = 'Play area',
      tag = 'playArea',
      description = [[
        Retrieve information about the size and shape of the room the player is in, and provides
        information about the "chaperone", a visual indicator that appears whenever a player is
        about to run into a wall.
      ]]
    },
    {
      name = 'Controllers',
      tag = 'controllers',
      description = [[
        Get a list of connected `Controller`s.  Also see `lovr.controlleradded` and
        `lovr.controllerremoved`.
      ]]
    }
  }
}

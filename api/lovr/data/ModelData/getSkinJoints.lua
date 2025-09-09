return {
  summary = 'Get the joints in a skin.',
  description = 'Returns a table with the node indices of the joints in a skin.',
  arguments = {
    skin = {
      type = 'number',
      description = 'The index of a skin.'
    }
  },
  returns = {
    joints = {
      type = 'table',
      description = 'The joints in the skin.'
    }
  },
  notes = 'There is currently a maximum of 256 joints per skin.',
  variants = {
    {
      arguments = { 'skin' },
      returns = { 'joints' }
    }
  }
}

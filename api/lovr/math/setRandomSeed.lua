return {
  tag = 'random',
  summary = 'Set the random seed.',
  description = [[
    Seed the random generator with a new seed.  Each seed will cause `lovr.math.random` and
    `lovr.math.randomNormal` to produce a unique sequence of random numbers.  When `lovr.math` is
    first loaded, the random generator is seeded with the current time.
  ]],
  arguments = {
    seed = {
      type = 'number',
      description = 'The new seed.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'seed' },
      returns = {}
    }
  }
}

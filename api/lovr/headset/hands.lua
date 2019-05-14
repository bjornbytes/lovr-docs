return {
  summary = 'Iterate over currently tracked hand devices.',
  description = 'Returns a Lua iterator for all of the currently tracked hand devices.',
  arguments = {},
  returns = {
    {
      name = 'iterator',
      type = 'function',
      arguments = {},
      returns = {},
      description = 'The iterator function, usable in a for loop.  Will return `Device` paths.'
    }
  },
  example = [[
    function lovr.update(dt)
      for hand in lovr.headset.hands() do
        print(hand, lovr.headset.getPose(hand))
      end
    end
  ]]
}

return {
  summary = 'Reset the Transform.',
  description = 'Resets the Transform to the origin.',
  arguments = {},
  returns = {
    {
      name = 'transform',
      type = 'Transform',
      description = 'The original Transform.'
    }
  },
  example = [[
    transform = lovr.math.newTransform(3, 4, 5)
    print(transform:transformPoint(1, 2, 2)) -- Prints 4, 6, 7
    transform:origin()
    print(transform:transformPoint(1, 2, 3)) -- Prints 1, 2, 3
  ]]
}

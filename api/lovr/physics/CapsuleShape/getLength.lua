return {
  summary = 'Get the length of the CapsuleShape.',
  description = 'Returns the length of the CapsuleShape, not including the caps.',
  arguments = {},
  returns = {
    length = {
      type = 'number',
      description = 'The length of the capsule, in meters.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { 'length' }
    }
  },
  related = {
    'CapsuleShape:getRadius',
    'CapsuleShape:setRadius'
  }
}

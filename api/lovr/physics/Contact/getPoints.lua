return {
  summary = 'Get the contact points of the Contact.',
  description = [[
    Returns the contact points of the Contact.  These are the points where the colliders are
    intersecting.
  ]],
  arguments = {},
  returns = {
    ['...points'] = {
      type = 'number',
      description = 'Triplets of x/y/z numbers, one for each contact point.'
    }
  },
  variants = {
    {
      arguments = {},
      returns = { '...points' }
    }
  }
}

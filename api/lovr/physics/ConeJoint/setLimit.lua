return {
  summary = 'Set the angle limit of the ConeJoint.',
  description = [[
    Returns the angle limit of the ConeJoint.  The relative angle between the ConeJoint's axis and
    the second Collider will be constrained to this limit.
  ]],
  arguments = {
    limit = {
      type = 'number',
      description = 'The new limit in radians, between 0 and pi.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'limit' },
      returns = {}
    }
  },
  notes = 'The default limit is zero, preventing any rotation away from the axis.'
}

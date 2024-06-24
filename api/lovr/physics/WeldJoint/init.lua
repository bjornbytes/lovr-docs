return {
  summary = 'A joint that welds two colliders together.',
  description = [[
    A WeldJoint is a `Joint` that restricts all relative motion between two colliders, as though
    they were welded together into a single object.  All six degrees of freedom are constrained.

    WeldJoints are useful for making breakable objects.  Several colliders can be welded together
    with joints, and if `Joint:getForce` reports a large enough value, the joints can be disabled or
    destroyed, allowing the pieces to move freely.
  ]],
  extends = 'Joint',
  constructors = {
    'lovr.physics.newWeldJoint'
  }
}

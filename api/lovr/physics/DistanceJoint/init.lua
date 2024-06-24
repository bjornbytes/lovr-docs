return {
  summary = 'A fixed distance joint.',
  description = [[
    A DistanceJoint is a type of `Joint` that tries to keep two colliders within a certain distance.
    The distance is determined by the initial distance between the anchor points.  The joint allows
    for rotation on the anchor points.
  ]],
  extends = 'Joint',
  constructors = {
    'lovr.physics.newDistanceJoint'
  },
  related = {
    'Collider'
  }
}

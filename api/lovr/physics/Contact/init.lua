return {
  summary = 'A physics contact between two colliders.',
  description = [[
    Contacts hold collision-related state between two colliders.

    They are not created directly, but are reported from the `enter` and `contact` physics
    callbacks, set with `World:setCallbacks`.
  ]],
  extends = 'Object'
}

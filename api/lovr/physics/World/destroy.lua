return {
  summary = 'Destroy the World!!  Muahaha!',
  description = [[
    Destroys the World.  This will destroy all colliders, shapes, and joints in the world.  After
    calling this function, the world can no longer be used.  Attempting to call a method on the
    World after destroying it will error, with the exception of `World:isDestroyed`.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  notes = [[
    If a World gets garbage collected, it will be destroyed and, consequently, all of the colliders,
    shapes, and joints in the World will be destroyed as well, even if they can still be reached by
    Lua.  This is an exception to the way objects in LÖVR normally work, and is done to avoid issues
    with cycles in reference counting.
  ]],
  related = {
    'Collider:destroy',
    'Shape:destroy',
    'Joint:destroy'
  }
}

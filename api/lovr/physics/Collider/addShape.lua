return {
  summary = 'Add a Shape to the Collider.',
  description = 'Attaches a Shape to the collider.',
  arguments = {
    shape = {
      type = 'Shape',
      description = 'The Shape to attach.'
    }
  },
  returns = {},
  variants = {
    {
      arguments = { 'shape' },
      returns = {}
    }
  },
  notes = [[
    By default, LÖVR will recompute mass properties for the Collider as shapes are added and
    removed.  Use `Collider:setAutomaticMass` to enable or disable this behavior.

    Shapes can only be attached to a single Collider.  Attempting to attach a shape to multiple
    colliders (or to a single collider multiple times) will error.  Use `Collider:removeShape` to
    remove shapes from their original collider before reattaching them.

    Adding a `MeshShape` or a `TerrainShape` will force the Collider to be immobile.  It will
    immediately become kinematic, and will not move via velocity or forces.  However, it can still
    be repositioned with methods like `Collider:setPosition`.
  ]],
  related = {
    'Collider:removeShape',
    'Collider:getShapes',
    'Collider:getShape',
    'Shape'
  }
}

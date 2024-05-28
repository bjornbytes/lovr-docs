return {
  tag = 'worldQueries',
  summary = 'Find colliders that overlap a shape.',
  description = [[
    - Collides a shape with the world, returning all colliders that the shape touches.
    - You can provide a shape and a transform
    - Or a collider which will use the collider's shape and pose.
    - You can pass a tag filter to filter results by tags
    - You can pass a callback which will be called for each hit, or leave nil to get the first hit

    Tests a shape or collider against the World, returning intersecting shapes.  This function can
    take a Shape or a Collider.  When given a Shape, the pose of the shape in the world must be
    specified.  When given a Collider, all shapes attached to the collider will be checked for
    collisions, and no pose is necessary since the pose of the Collider will be used.

    A tag filter can be given to filter out shapes by their collider's tag:

    - Use nil to skip filtering.
    - Pass a tag name to only return shapes whose collider has that tag.
    - Pass a tag name with a ~ in front of it to exclude colliders with that tag.
    - Pass multiple tags separated by spaces to include multiple tags (works with ~ too).

    Provide an optional callback to call for each shape detected.  If the callbacks nil, this
    function returns the first shape detected.  In either case this function returns the shape, the
    hit position, and a penetration vector.  The penetration vector represents the direction and
    distance the shape would need to move so that it is no longer colliding with the input shape.
  ]],
  arguments = {
    shape = {
      type = 'Shape',
      description = 'The Shape to test.'
    },
    x = {
      type = 'number',
      description = 'The x position to place the shape at, in meters.'
    },
    y = {
      type = 'number',
      description = 'The y position to place the shape at, in meters.'
    },
    z = {
      type = 'number',
      description = 'The z position to place the shape at, in meters.'
    },
    position = {
      type = 'Vec3',
      description = 'The position to place the shape at, in meters.'
    },
    angle = {
      type = 'number',
      description = 'The angle the shape is rotated around its rotation axis, in radians.'
    },
    ax = {
      type = 'number',
      description = 'The x component of the axis of rotation.'
    },
    ay = {
      type = 'number',
      description = 'The y component of the axis of rotation.'
    },
    az = {
      type = 'number',
      description = 'The z component of the axis of rotation.'
    },
    orientation = {
      type = 'Quat',
      description = 'The orientation of the shape.'
    },
    filter = {
      type = 'string',
      default = 'nil',
      description = 'Tags to filter by, or nil for no filter.'
    },
    callback = {
      type = 'function',
      description = 'The callback to call for each intersection detected.'
    }
  },
  returns = {
    collider = {
      type = 'Collider',
      description = 'The collider that was hit.'
    },
    shape = {
      type = 'Shape',
      description = 'The shape that was hit.'
    },
    x = {
      type = 'number',
      description = 'The x position of a world space contact point on the surface of the shape.'
    },
    y = {
      type = 'number',
      description = 'The y position of a world space contact point on the surface of the shape.'
    },
    z = {
      type = 'number',
      description = 'The z position of a world space contact point on the surface of the shape.'
    },
    nx = {
      type = 'number',
      description = 'The x component of the penetration vector.'
    },
    ny = {
      type = 'number',
      description = 'The y component of the penetration vector.'
    },
    nz = {
      type = 'number',
      description = 'The z component of the penetration vector.'
    }
  },
  variants = {
    {
      arguments = { 'shape', 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'shape', 'position', 'orientation', 'filter', 'callback' },
      returns = {}
    },
    {
      arguments = { 'shape', 'x', 'y', 'z', 'angle', 'ax', 'ay', 'az', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz' }
    },
    {
      arguments = { 'shape', 'position', 'orientation', 'filter' },
      returns = { 'collider', 'shape', 'x', 'y', 'z', 'nx', 'ny', 'nz' }
    }
  },
  related = {
    'World:shapecast',
    'World:raycast',
    'World:queryBox',
    'World:querySphere'
  }
}

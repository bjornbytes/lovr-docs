return {
  summary = 'Types of physics shapes.',
  description = [[
    Represents the different types of physics Shapes available.
  ]],
  values = {
    {
      name = 'box',
      description = 'A box.'
    },
    {
      name = 'sphere',
      description = 'A sphere.'
    },
    {
      name = 'capsule',
      description = 'A capsule (cylinder with rounded ends).'
    },
    {
      name = 'cylinder',
      description = 'A cylinder.'
    },
    {
      name = 'convex',
      description = 'A convex hull.'
    },
    {
      name = 'mesh',
      description = 'A triangle mesh.  Colliders with this shape can not move.'
    },
    {
      name = 'terrain',
      description = 'A heightfield.  Colliders with this shape can not move.'
    }
  },
  related = {
    'Shape',
    'BoxShape',
    'SphereShape',
    'CapsuleShape',
    'CylinderShape',
    'ConvexShape',
    'MeshShape',
    'TerrainShape'
  }
}

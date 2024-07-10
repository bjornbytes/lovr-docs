return {
  summary = 'A 3D vector.',
  description = 'A vector object that holds three numbers.',
  constructors = {
    'lovr.math.newVec3',
    'lovr.math.vec3'
  },
  swizzles = {
    components = {
      { 'x', 'y', 'z' },
      { 'r', 'g', 'b' },
      { 's', 't', 'p' }
    }
  },
  related = {
    'Vec2',
    'Vec4',
    'Vectors'
  }
}

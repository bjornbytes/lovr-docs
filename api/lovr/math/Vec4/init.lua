return {
  summary = 'A 4D vector.',
  description = 'A vector object that holds four numbers.',
  constructors = {
    'lovr.math.newVec4',
    'lovr.math.vec4'
  },
  swizzles = {
    components = {
      { 'x', 'y', 'z', 'w' },
      { 'r', 'g', 'b', 'a' },
      { 's', 't', 'p', 'q' }
    }
  },
  related = {
    'Vec2',
    'Vec3',
    'Vectors'
  }
}

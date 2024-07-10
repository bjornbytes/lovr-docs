return {
  summary = 'A 2D vector.',
  description = 'A vector object that holds two numbers.',
  constructors = {
    'lovr.math.newVec2',
    'lovr.math.vec2'
  },
  swizzles = {
    components = {
      { 'x', 'y' },
      { 'r', 'g' },
      { 's', 't' }
    }
  },
  related = {
    'Vec3',
    'Vec4',
    'Vectors'
  }
}

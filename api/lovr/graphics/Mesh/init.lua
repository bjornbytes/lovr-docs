return {
  summary = 'A drawable triangle mesh.',
  description = [[
    Meshes store arbitrary geometry data, and can be drawn with `Pass:draw`.

    Meshes hold a list of **vertices**.  The number of vertices is declared upfront when the Mesh is
    created, and it can not be resized afterwards.

    The Mesh has a **vertex format**, which is a set of **attributes** comprising each vertex, like
    a `position`, `color`, etc.
  ]],
  constructors = {
    'lovr.graphics.getBuffer',
    'lovr.graphics.newBuffer'
  }
}

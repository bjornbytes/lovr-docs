return {
  summary = 'An asset imported from a 3D model file.',
  description = [[
    A Model is a drawable object loaded from a 3D file format.  Most common 3D file formats are
    supported, such as `3ds`, `blend`, `dae`, `fbx`, `stl`, `obj`, and `glTF`.  Models will use
    normals and texture coordinates, if provided.

    The following advanced features are not supported yet: animations, materials, and vertex colors.
  ]],
  constructors = {
    'lovr.graphics.newModel',
    'Controller:newModel'
  },
  example = [[
    local model

    function lovr.load()
      model = lovr.graphics.newModel('assets/model.fbx', 'assets/texture.png')
    end

    function lovr.draw()
      model:draw(0, 1, -1, 1, lovr.timer.getTime())
    end
  ]]
}
